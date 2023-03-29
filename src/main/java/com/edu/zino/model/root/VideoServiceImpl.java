package com.edu.zino.model.root;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Video;
import com.edu.zino.exception.VideoException;

@Service
public class VideoServiceImpl implements VideoService{

	@Autowired
	private VideoDAO videoDAO;
	
	@Override
	public void insert(List<Video> videos) throws VideoException{
		videoDAO.insert(videos);
	}

	@Override
	public List<Video> selectAllByTeacher(int teacher_idx) {
		return videoDAO.selectAllByTeacher(teacher_idx);
	}

	@Override
	public void update(Video video) throws VideoException{
		videoDAO.update(video);
	}

	@Override
	public List<Video> deleteRequest(int video_idx,int teacher_idx) throws VideoException{
		videoDAO.deleteRequest(video_idx);
		return videoDAO.selectAllByTeacher(teacher_idx);
	}

	@Override
	public void delete(List<Video> videos) {
		videoDAO.delete(videos);
	}





	

}
