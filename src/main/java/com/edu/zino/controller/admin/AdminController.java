package com.edu.zino.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.model.admin.AdminboardService;

@Controller
public class AdminController {

	private Logger logger=LoggerFactory.getLogger(this.getClass().getName());
	
	@Autowired
	private  AdminboardService adminboardService;
	
	@GetMapping("/board")
	public ModelAndView getBoard(HttpServletRequest request) {
		
		List adminboardList=adminboardService.selectAll();
		
		ModelAndView mav=new ModelAndView("/admin/board/board_main");
		mav.addObject("adminboardList",adminboardList);
		return mav;
		
	}
	
	@GetMapping("/qnaboard")
	public ModelAndView getQnaBoard(HttpServletRequest request) {
		logger.info("qna페이지 요청 받음");
		ModelAndView mav=new ModelAndView("/admin/qnaboard/qnaboard_main");
		return mav;
	}
	 
	@GetMapping("/index")
	public String getIndex() {
		return "/admin/index";
	}
	
	@GetMapping("/login")
	public ModelAndView getLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/login");
		return mav;
	}
	
	@GetMapping("/member")
	public ModelAndView getMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/list");
		return mav;
	}
	
	@GetMapping("/member/detail")
	public ModelAndView getMemberDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/detail");
		return mav;
	}
	
}
