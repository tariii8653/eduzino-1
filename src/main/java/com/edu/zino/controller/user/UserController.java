package com.edu.zino.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.domain.TopCategory;
import com.edu.zino.model.root.TopCategoryService;

@Controller
public class UserController {
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	@GetMapping("/")
	public ModelAndView getIndex(HttpServletRequest request) {
		List<TopCategory> topCategoryList= topCategoryService.selectAll();
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("topCategoryList",topCategoryList);
		return mav;
	}
	
	@GetMapping("/default")
	public ModelAndView getDefault(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("default");
		return mav;
	}
	
	@GetMapping("/mypage")
	public ModelAndView getMypage() {
		ModelAndView mav = new ModelAndView("/user/mypage");
		return mav;
	}
	
	@GetMapping("/user/message")
	public ModelAndView getMessage() {
		ModelAndView mav = new ModelAndView("/user/message");
		return mav;
	}
	
}
