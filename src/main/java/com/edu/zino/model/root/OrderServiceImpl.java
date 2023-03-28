package com.edu.zino.model.root;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.zino.domain.Cart;
import com.edu.zino.domain.Member;
import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.model.user.CartDAO;
import com.edu.zino.model.user.OrderDetailDAO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//주문메서드
	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(OrderSummary orderSummary) {
		//1) 주문요약 넣기> pk 반환
		orderSummaryDAO.insert(orderSummary);
		
		
		//2) 디테일 넣기
		List<Cart> cartList=cartDAO.selectAll(orderSummary.getMember());
		for(int i=0; i<cartList.size(); i++) {	
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderSummary(orderSummary);
			orderDetail.setSubject(cartList.get(i).getSubject());
			
			logger.info("getSubject는 "+orderDetail.getSubject());
			orderDetailDAO.insert(orderDetail);
			
			//카트에서 삭제
			//cartDAO.delCart(cartList.get(i));
		}
		
	}
	
	//회원별 주문내역 가져오기
		public List selectAllByMember(Member member) {
			return orderSummaryDAO.selectAllByMember(member);
		}

		//토스 결제 로직
		@Override
		@Transactional(propagation = Propagation.REQUIRED)
		public String getPay(String orderId, int amount, String paymentKey) {
			
			HttpRequest httprequest = HttpRequest.newBuilder()
				    .uri(URI.create("https://api.tosspayments.com/v1/payments/"+paymentKey))
				    .header("Authorization", "Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==")
				    .header("Content-Type", "application/json")
				    .method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\""+paymentKey+"\",\"amount\":"+amount+",\"orderId\":\""+orderId+"\"}"))
				    .build();
				HttpResponse<String> response=null;
				try {
					response = HttpClient.newHttpClient().send(httprequest, HttpResponse.BodyHandlers.ofString());
					System.out.println(response.body());
				} catch (IOException e) {
					e.printStackTrace();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			return response.body();
		}
		
		
	/*----orderDetail-------*/
	public List selectAll(int order_summary_idx) {
		return orderDetailDAO.selectAll(order_summary_idx);
	}

	

}
