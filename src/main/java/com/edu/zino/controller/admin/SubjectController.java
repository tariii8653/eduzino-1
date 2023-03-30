package com.edu.zino.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.model.teacher.SubjectService;

@Controller
@RequestMapping("/subject")
public class SubjectController {
	
	
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("/list/{page}")
	public ModelAndView getAccessList(@PathVariable("page") int page) {
		Map<String,Object> map = subjectService.selectAllAccessList(page);
		ModelAndView mav = new ModelAndView("/admin/subject/access-list");
		mav.addObject("subjectList", map.get("subjectList"));
		mav.addObject("firstPage", map.get("firstPage"));
		mav.addObject("lastPage", map.get("lastPage"));
		mav.addObject("totalPage", map.get("totalPage"));
		return mav;
	}
	
	@GetMapping("/list/request/{page}")
	public ModelAndView getRequestList(@PathVariable("page") int page) {
		Map<String,Object> map = subjectService.selectAllPermissionRequestList(page);
		ModelAndView mav = new ModelAndView("/admin/subject/request-list");
		mav.addObject("subjectList", map.get("subjectList"));
		mav.addObject("firstPage", map.get("firstPage"));
		mav.addObject("lastPage", map.get("lastPage"));
		mav.addObject("totalPage", map.get("totalPage"));
		System.out.println("firstPage :  "+map.get("firstPage"));
		return mav;
	}
	
	
}
