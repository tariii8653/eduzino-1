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

import com.edu.zino.domain.Member;
import com.edu.zino.model.admin.AdminboardService;
import com.edu.zino.model.member.MemberService;

@Controller
public class AdminController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());

	@Autowired
	private  AdminboardService adminboardService;
	
	@Autowired
	private MemberService memberService;
	
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
		ModelAndView mav=new ModelAndView("/admin/qnaboard_service/qnaboard_main");
		return mav;
	}

	 
	@GetMapping("/index")
	public String getIndex() {
		return "/admin/index";
	}

	/* ----------------------------------
				관리자 로그인
	------------------------------------ */

	
	@GetMapping("/login")
	public ModelAndView getLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/login");
		return mav;
	}
	
	/* ----------------------------------
	 			전체 회원 관리
	 ------------------------------------ */
	@GetMapping("/member")	//전체 회원 목록
	public ModelAndView getMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/list");
		return mav;
	}
	
	@GetMapping("/member/detail")	//회원 한 명 상세보기 
	public ModelAndView getMemberDetail(HttpServletRequest request, int member_idx) {
		Member member = memberService.selectMember(member_idx);	//파라미터 넘겨주면서 서비스에게 일 시키기 
		ModelAndView mav = new ModelAndView("/admin/member/detail");
		mav.addObject("member", member);
		return mav;
	}
	

	@GetMapping("/member/blacklist")	//정지 회원 목록
	public ModelAndView getBlacklist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/blacklist");
		return mav;
	}

	@GetMapping("/member/blackdetail")	//정지 회원 한 명 상세보기 
	public ModelAndView getBlackDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/member/blackdetail");
		return mav;
	}
	
	
}
