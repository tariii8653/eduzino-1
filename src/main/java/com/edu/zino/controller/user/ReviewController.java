package com.edu.zino.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	//메인
	@GetMapping("/user/review")
	public ModelAndView getReview(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("/user/review/reviewpage");
		return mav;
	}
	//글쓰기 폼 
	@GetMapping("/user/review/regist")
	public ModelAndView getRegist(HttpServletRequest request) {
		logger.info("글쓰기 폼 요청");
		return new ModelAndView("/user/review/regist");
	}
}
