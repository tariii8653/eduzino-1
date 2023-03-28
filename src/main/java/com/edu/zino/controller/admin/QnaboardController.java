package com.edu.zino.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.domain.Admin;
import com.edu.zino.domain.Qnaboard;
import com.edu.zino.domain.Target;
import com.edu.zino.model.admin.QnaboardService;

@Controller
@RequestMapping("/qnaboard")
public class QnaboardController {
	@Autowired
	private QnaboardService qnaboardService;
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	//목록 요청 처리
	@RequestMapping(value = "/list",method =RequestMethod.GET)
	public ModelAndView getList(HttpServletRequest request) {
		logger.info("목록요청을 받음");
		List qnaboardList=qnaboardService.selectAll();
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard//list");
		mav.addObject("qnaboardList",qnaboardList);
		
		return mav;
	}
	
	//글쓰기 폼 요청
	@GetMapping("/registform")
	public ModelAndView getRegist(HttpServletRequest request) {
		logger.info("글쓰기폼 요청");
		return new ModelAndView("/admin/qnaboard/regist");
	}
	
	//글쓰기 요청 처리
	@PostMapping("/regist")
	public ModelAndView getInsert(HttpServletRequest request,Qnaboard qnaboard) {
		logger.info("글쓰기 요청");
		Admin admin=new Admin();
		admin.setAdmin_idx(1);
		qnaboard.setAdmin(admin);

		//일시키기 
		qnaboardService.insert(qnaboard);
		ModelAndView mav=new ModelAndView("redirect:/admin/qnaboard/list");
		return mav;
	}
	
	//상세보기 요청 처리
	@GetMapping(value = "/detail")
	public ModelAndView getDetail(HttpServletRequest request,int qnaboard_idx) {
		logger.info("상세보기 요청");
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard/detail");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	
	//수정폼 요청 처리
	@GetMapping("/editform")
	public ModelAndView getEditForm(HttpServletRequest request, int qnaboard_idx) {
		logger.info("수정폼  요청");
		
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard/editform");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	
	@GetMapping("/delform")
	public ModelAndView getDelForm(HttpServletRequest request,int qnaboard_idx) {
		logger.info("삭제폼 요청");
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		ModelAndView mav=new ModelAndView("/admin/qnaboard/delform");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	
}
	

