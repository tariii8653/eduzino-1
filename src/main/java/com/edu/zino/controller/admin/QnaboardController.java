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
public class QnaboardController {
	@Autowired
	private QnaboardService qnaboardService;
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	/*qnaboard_service controller*/	
	//목록 요청 처리
	@RequestMapping(value = "qnaboard_service/list",method =RequestMethod.GET)
	public ModelAndView getList(HttpServletRequest request) {
		logger.info("목록요청을 받음");
		List qnaboardList=qnaboardService.selectAll();
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard_service//list");
		mav.addObject("qnaboardList",qnaboardList);
		
		return mav;
	}
	
	//글쓰기 폼 요청
	@GetMapping("qnaboard_service/registform")
	public ModelAndView getRegist(HttpServletRequest request) {
		logger.info("글쓰기폼 요청");
		return new ModelAndView("/admin/qnaboard_service/regist");
	}
	
	//글쓰기 요청 처리
	@PostMapping("qnaboard_service/regist")
	public ModelAndView getInsert(HttpServletRequest request,Qnaboard qnaboard) {
		logger.info("글쓰기 요청");
		Admin admin=new Admin();
		admin.setAdmin_idx(1);
		qnaboard.setAdmin(admin);

		//일시키기 
		qnaboardService.insert(qnaboard);
		ModelAndView mav=new ModelAndView("redirect:/admin/qnaboard_service/list");
		return mav;
	}
	
	//상세보기 요청 처리
	@GetMapping(value = "qnaboard_service/detail")
	public ModelAndView getDetail(HttpServletRequest request,int qnaboard_idx) {
		logger.info("상세보기 요청");
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard_service/detail");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	
	//수정폼 요청 처리
	@GetMapping("qnaboard_service/editform")
	public ModelAndView getEditForm(HttpServletRequest request, int qnaboard_idx) {
		logger.info("수정폼  요청");
		
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard_service/editform");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	//한건 수정하기
	@PostMapping("/qnaboard_service/edit")
	public ModelAndView getEdit(HttpServletRequest request,Qnaboard qnaboard) {
		Admin admin=new Admin();
		admin.setAdmin_idx(1);
		
		qnaboard.setAdmin(admin);
		
		qnaboardService.update(qnaboard);
		
		ModelAndView mav=new ModelAndView("redirect:/admin/qnaboard_service/list");
		
		return mav;
	}
	
	@GetMapping("qnaboard_service/delform")
	public ModelAndView getDelForm(HttpServletRequest request,int qnaboard_idx) {
		logger.info("삭제폼 요청");
		Qnaboard qnaboard=qnaboardService.select(qnaboard_idx);
		ModelAndView mav=new ModelAndView("/admin/qnaboard_service/delform");
		mav.addObject("qnaboard",qnaboard);
		return mav;
	}
	
	//한건 삭제하기
	@PostMapping("qnaboard_service/del")
	public ModelAndView getDel(HttpServletRequest request,int qnaboard_idx,Qnaboard qnaboard) {
		
		Admin admin=new Admin();
		admin.setAdmin_idx(1);
		qnaboard.setAdmin(admin);
		
		qnaboardService.delete(qnaboard_idx);
		return new ModelAndView("redirect:/admin/qnaboard_service/list");
	}
	
	/*qnaboard_fnq(자주묻는 질문)*/
	
	//목록 요청
	@RequestMapping(value = "qnaboard_fnq/list",method =RequestMethod.GET)
	public ModelAndView getList2(HttpServletRequest request) {
		logger.info("fnq목록요청을 받음");
		List qnaboardList=qnaboardService.selectAll();
		
		ModelAndView mav=new ModelAndView("/admin/qnaboard_fnq/list");
		mav.addObject("qnaboardList",qnaboardList);
		
		return mav;
	}
	
	
}
	

