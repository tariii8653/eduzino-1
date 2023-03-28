package com.edu.zino.model.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.zino.domain.Qnaboard;

@Service
public class QnaboardServiceImpl implements QnaboardService{
	@Autowired
	private QnaboardDAO qnaboardDAO;
	
	@Override
	public List selectAll() {
		
		return qnaboardDAO.selectAll();
	}

	@Override
	public Qnaboard select(int qnaboard_idx) {

		return qnaboardDAO.select(qnaboard_idx);
	}

	@Override
	public void insert(Qnaboard qnaboard) {
		qnaboardDAO.insert(qnaboard);
		
	}

	@Override
	public void update(Qnaboard qnaboard) {
		qnaboardDAO.update(qnaboard);
		
	}

	@Override
	public void delete(int qnaboard_idx) {
		qnaboardDAO.delete(qnaboard_idx);
		
	}

}
