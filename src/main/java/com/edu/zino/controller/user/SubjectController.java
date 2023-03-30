package com.edu.zino.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/subject")
public class SubjectController {
	
	@GetMapping("/category/{top_category_idx}")
	public ModelAndView getSubjectPage(HttpServletRequest request,@PathVariable("top_category_idx")int category_idx) {
		return new ModelAndView("/user/subject/subject-list");
	}
	
}
