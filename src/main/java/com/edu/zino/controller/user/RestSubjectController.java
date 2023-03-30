package com.edu.zino.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.zino.domain.Subject;
import com.edu.zino.model.teacher.SubjectService;

@RestController
@RequestMapping("/rest")
public class RestSubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("/category/{top_category_idx}/subjects")
	public ResponseEntity<List<Subject>> getSubjectList(@PathVariable("top_category_idx") int top_category_idx){
		List<Subject> subjectList = subjectService.selectAllByTopCategory(top_category_idx);
		return new ResponseEntity<List<Subject>>(subjectList,HttpStatus.OK);
	}
}
