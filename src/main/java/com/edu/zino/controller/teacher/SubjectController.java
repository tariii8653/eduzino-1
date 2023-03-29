package com.edu.zino.controller.teacher;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Subject;
import com.edu.zino.domain.Teacher;
import com.edu.zino.model.teacher.SubjectService;
import com.edu.zino.vo.StudyPlanVO;

@Controller
@RequestMapping("/subject")
public class SubjectController {
	private final static int GOAL = 0;
	private final static int DETAIL = 1;
	private final static int MOVIE = 2;
	private final static int PRIVIEW = 3;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("/regist")
	public ModelAndView registStart(HttpServletRequest request) {
		Teacher teacher = new Teacher();//향후 세션에서 가져올예정
		teacher.setTeacher_idx(1);
		
		Subject subject = new Subject();
		subject.setTeacher(teacher);
		
		subjectService.insert(subject);
		
		ModelAndView mav = new ModelAndView("redirect:/teacher/subject/regist/goal/"+subject.getSubject_idx());
		return mav;
	}
	
	@GetMapping("/regist/goal/{subject_idx}")
	public ModelAndView getRegistFormGoal(HttpServletRequest request,@PathVariable("subject_idx") int subject_idx) {
		ModelAndView mav = new ModelAndView("/teacher/subject/registform-goal");
		StudyPlanVO studyPlanVO = new StudyPlanVO(GOAL, "학습목표");
		mav.addObject("studyPlanVO", studyPlanVO);
		return mav;
	}
	@GetMapping("/regist/detail/{subject_idx}")
	public ModelAndView getRegistFormDetail(HttpServletRequest request,@PathVariable("subject_idx") int subject_idx) {
		ModelAndView mav=new ModelAndView("/teacher/subject/registform-detail");
		StudyPlanVO studyPlanVO = new StudyPlanVO(DETAIL, "강의내용");
		mav.addObject("studyPlanVO", studyPlanVO);
		return mav;
	}
	
	@GetMapping("/regist/movie/{subject_idx}")
	public ModelAndView getRegistFormMovie(HttpServletRequest request,@PathVariable("subject_idx") int subject_idx) {
		ModelAndView mav=new ModelAndView("/teacher/subject/registform-movie");
		StudyPlanVO studyPlanVO = new StudyPlanVO(MOVIE, "커리큘럼");
		mav.addObject("studyPlanVO", studyPlanVO);
		return mav;
	}
	
	@GetMapping("/list")
	public ModelAndView getList(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("/teacher/subject/list");
		return mav;
	}
	
	@GetMapping("/detail/{subject_idx}")
	public ModelAndView getDetail(@PathVariable("subject_idx") int subject_idx) {
		ModelAndView mav=new ModelAndView("/teacher/subject/subject-detail");
		return mav;
	}
	
	

}
