package com.edu.zino.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.domain.Cart;
import com.edu.zino.domain.Member;
import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.domain.Payment;
import com.edu.zino.domain.Paystate;
import com.edu.zino.domain.Subject;
import com.edu.zino.exception.OrderSummaryException;
import com.edu.zino.exception.PayException;
import com.edu.zino.model.root.OrderService;
import com.edu.zino.util.MessageUtil;
import com.google.gson.JsonObject;

@Controller
public class PayController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private OrderService orderService;
	
	@GetMapping("/order/paycomplete")
	public ModelAndView payCom() {
		return new ModelAndView("/user/order/paycomplete");
	}
	
	//결제 완료 (콜백주소)
	@GetMapping("/pay/payment")
	public ModelAndView cartTopay(HttpServletRequest request, OrderSummary order){
		
		String orderId=request.getParameter("orderId");
		int amount=Integer.parseInt(request.getParameter("amount"));
		String paymentKey=request.getParameter("paymentKey");
		
		logger.info("orderId는 "+orderId);
		logger.info("amount는 "+amount);
		logger.info("paymentKey는 "+paymentKey);
		
		//결제 완료 시 넘어오는 파라미터(json)를 String 으로 받음
		String payResult=orderService.getPay(orderId, amount, paymentKey);
		logger.info("payresult는 "+payResult);
		
		JSONObject obj = new JSONObject(payResult);
		String method = obj.getString("method"); //결제방법
		String state = obj.getString("status"); //결제상태
		int balanceAmount =  obj.getInt("balanceAmount");
		
		logger.info("method "+method);
		logger.info("status "+state);
		
		//order_summary에 등록
		Member member = new Member();
		member.setMember_idx(2);
		
		//얘네는 나중에 서비스로 옮기기
		Payment payment = new Payment();
		if(method.equals("간편결제")) {
			payment.setPayment_idx(2); //간편결제라서 2얘가 해당할듯
		}else {
			payment.setPayment_idx(1);
		} //이건 payResult의 method 키값으로 대체
		payment.setPayment_type(method);
		
		Paystate paystate = new Paystate(); //payResult의 status 키값으로 대체
		if(state.equals("DONE")) {
			paystate.setPaystate_idx(2); //결제완료
			paystate.setState("결제완료");
		}else {
			paystate.setPaystate_idx(1); //결제실패
			paystate.setState("결제실패");
		}
	
		//orderSummary에 들어갈 내용들을 채워준다
		order.setMember(member); //회원번호
		order.setOrder_id(orderId); //주문번호
		order.setPayment(payment);//결제방법
		order.setPaystate(paystate);//결제상태
		order.setTotal_buy(amount); //구매금액
		order.setTotal_pay(balanceAmount); //실제 결제금액(포인트사용 후)
		//장바구니에서 끌어다써도 된다
		
		order.setOrderDetailList(null); //여러 건 등록시 사용해야할듯?
		
		logger.info("paystate는 "+order.getPayment());
		logger.info("paystate는 "+order.getPaystate());

		logger.info("채워진 order는 "+order);
		

		//3단계> 여기서 orderSummary, orderDetail -insert / cart-del 완료
		orderService.regist(order);
		
		//4단계
		ModelAndView mav = new ModelAndView("/user/order/paycomplete"); 
		return null;
	}
	
	//결제 실패
	@GetMapping("/pay/payfail")
	public ModelAndView payFail(HttpServletRequest request) {
	
		String orderId=request.getParameter("orderId");
		String failMessage=request.getParameter("message");
		String failCode=request.getParameter("code");
		
		String failResult = orderId+failMessage+failCode;
		
		ModelAndView mav= new ModelAndView("/user/cart/cartList");
		mav.addObject("failResult",failResult);
		
		return mav;
	}
	
	
	
	/*-----------exception-------------------*/
	@ExceptionHandler(PayException.class)
	public ResponseEntity<MessageUtil> handle(PayException e){
		
		MessageUtil msg = new MessageUtil();
		msg.setMsg("결제 작업 실패");
		
		ResponseEntity entity = new ResponseEntity<MessageUtil>(msg,HttpStatus.OK);
		return entity;
	}
}
