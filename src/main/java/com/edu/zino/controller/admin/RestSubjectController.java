package com.edu.zino.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.zino.model.teacher.SubjectService;

@RestController
@RequestMapping("/rest")
public class RestSubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@PostMapping("/subject/request")
	public ResponseEntity<Void> updatePermission(int subject_idx){
		subjectService.updatePermission(subject_idx);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
}
