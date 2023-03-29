package com.edu.zino.controller.teacher;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Section;
import com.edu.zino.domain.Subject;
import com.edu.zino.model.teacher.SubjectService;

@RestController
@RequestMapping("/rest")
public class RestSubjectController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private SubjectService subjectService;
	
	@PostMapping("/subject/{subject_idx}/goals-requirements")
	public ResponseEntity<String> inserGoalAndRequirement(HttpServletRequest request,@PathVariable int subject_idx,String[] goals,String[] requirements){
		List<Goal> goalList = new ArrayList<Goal>();
		List<Requirement> requirementList = new ArrayList<Requirement>();
		Subject subject = new Subject();
		for(String goal_name : goals) {
			Goal goal = new Goal();
			goal.setGoal_name(goal_name);
			goal.setSubject(subject);
			goalList.add(goal);
		}
		for(String requirement_name : requirements) {
			Requirement requirement = new Requirement();
			requirement.setSubject(subject);
			requirement.setRequirement_name(requirement_name);
			requirementList.add(requirement);
		}
		subject.setSubject_idx(subject_idx);
		subject.setGoals(goalList);
		subject.setRequirements(requirementList);
		subjectService.regist(subject);
		
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/subject/{subject_idx}/goals-requirements")
	public ResponseEntity<Map<String,List>> getGoalBySubject(HttpServletRequest request,@PathVariable("subject_idx") int subject_idx){
		Map<String,List> map = subjectService.selectGoalAndRequirement(subject_idx);
		ResponseEntity<Map<String,List>> entity = new ResponseEntity<Map<String,List>>(map,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/subject/{subject_idx}")
	public ResponseEntity<String> update(HttpServletRequest request,Subject subject){
		logger.info("받은 subject : "+subject);
		String filePath = (String)request.getSession().getServletContext().getAttribute("filePath");
		subjectService.update(subject,filePath);
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/subject/{subject_idx}/detail")
	public ResponseEntity<Subject> selectToDetail(HttpServletRequest request,@PathVariable("subject_idx") int subject_idx){
		Subject subject = subjectService.selectToDetail(subject_idx);
		logger.info("가져올 subject는 : "+subject);
		ResponseEntity<Subject> entity = new ResponseEntity<Subject>(subject,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/subject/{subject_idx}/section")
	@ResponseBody
	public ResponseEntity<String> insertSection(@RequestBody List<Section> sectionList){
		logger.info("넘어온 sectionList : "+sectionList);
		subjectService.registSectionList(sectionList);
		ResponseEntity<String> entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/subject/{subject_idx}/section")
	public ResponseEntity<List<Section>> getSectionList(@PathVariable("subject_idx") int subject_idx){
		List<Section> sectionList = subjectService.selectSection(subject_idx);
		logger.info("가져온 sectionList : "+sectionList);
		ResponseEntity<List<Section>> entity = new ResponseEntity<List<Section>>(sectionList,HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/subjects/{teacher_idx}")
	public ResponseEntity<List<Subject>> getSubjectList(@PathVariable("teacher_idx") int teacher_idx){
		List<Subject> subjectList = subjectService.selectAllByTeacherAccess(teacher_idx);
		ResponseEntity<List<Subject>> entity = new ResponseEntity<List<Subject>>(subjectList,HttpStatus.OK); 
		return entity;
	}
	
	@GetMapping("/subject/{subject_idx}")
	public ResponseEntity<Subject> getSubject(@PathVariable("subject_idx") int subject_idx){
		Subject subject = subjectService.select(subject_idx);
		ResponseEntity<Subject> entity = new ResponseEntity<Subject>(subject,HttpStatus.OK);
		return entity;
	}
	
	@DeleteMapping("/subject/{subject_idx}")
	public ResponseEntity<Void> delete(@PathVariable("subject_idx") int subject_idx){
		subjectService.delete(subject_idx);
		ResponseEntity<Void> entity = new ResponseEntity<Void>(HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("subject/{subject_idx}/summary")
	public ResponseEntity<Subject> selectSummary(@PathVariable("subject_idx") int subject_idx){
		Subject subject = subjectService.selectSummary(subject_idx);
		ResponseEntity<Subject> entity = new ResponseEntity<Subject>(subject,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/subject/request")
	public ResponseEntity<Void> subjectRequest(int subject_idx){
		subjectService.subjectRequest(subject_idx);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@PostMapping("/subject/access")
	public ResponseEntity<Void> setAccess(Subject subject){
		logger.info("subject : "+subject);
		subjectService.updateAccess(subject);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	
	
	
	
}
