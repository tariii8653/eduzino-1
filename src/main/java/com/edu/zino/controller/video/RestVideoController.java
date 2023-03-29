package com.edu.zino.controller.video;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.zino.domain.Video;
import com.edu.zino.model.root.VideoService;


@RestController
@RequestMapping("/rest")
public class RestVideoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 	
	
	@Autowired
	private VideoService videoService;
	
	@GetMapping("/teacher/videos/{teacher_idx}")
	public ResponseEntity<List<Video>> getVideoByTeacher(@PathVariable("teacher_idx") int teacher_idx){
		List<Video> videoList = videoService.selectAllByTeacher(teacher_idx);
		ResponseEntity<List<Video>> entity = new ResponseEntity<>(videoList,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/teacher/video/delete")
	public ResponseEntity<List<Video>> deleteRequest(int video_idx,int teacher_idx){
		logger.info("넘겨받은 video_idx : "+video_idx);
		List<Video> videoList = videoService.deleteRequest(video_idx,teacher_idx);
		ResponseEntity<List<Video>> entity = new ResponseEntity<>(videoList,HttpStatus.OK);
		return entity;
	}
	
	
}
