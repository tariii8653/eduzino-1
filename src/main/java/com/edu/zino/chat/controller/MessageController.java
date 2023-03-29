package com.edu.zino.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.chat.model.ChatService;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.model.root.OrderService;

@Controller
public class MessageController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private OrderService orderService;
	
	
	//선생님의 수강생목록 가져오기
	@GetMapping("/chat/message")
	public ModelAndView getTeacherMessage(HttpServletRequest request,@RequestParam(defaultValue = "0") int member_idx) {
		
		
		//로그인 하면 session에서 teacher_idx를 가져오므로 getMapping으로 가져올 필요는 없음
		int teacher_idx = 1;
		
		List<OrderSummary> orderSummaryList = chatService.selectAllByTeacher(teacher_idx);
		
		
		ModelAndView mav = new ModelAndView("/teacher/chat/message");
		mav.addObject("orderSummaryList", orderSummaryList);
		mav.addObject("member_idx", member_idx);
		
		return mav;
	}
	
	//학생의 선생님목록 가져오기
	@GetMapping("/user/chat/message")
	public ModelAndView getUserMessage(HttpServletRequest request) {
		
		//로그인 하면 session에서 회원를 가져오므로 getMapping으로 가져올 필요는 없음
		int member_idx = 2;
		
		List<OrderSummary> orderSummaryMemberTeacherList = orderService.selectAllByMemberTeacher(member_idx);
		
		
		ModelAndView mav = new ModelAndView("/user/chat/message");
		mav.addObject("orderSummaryMemberTeacherList", orderSummaryMemberTeacherList);
		
		return mav;
	}
	
	
}
