package com.edu.zino.model.user;

import java.util.List;

import org.springframework.stereotype.Service;

import com.edu.zino.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	private ReviewDAO reviewDAO;

	@Override
	public List selectAll() {
		
		return reviewDAO.selectAll();
	}

	@Override
	public Review select(int review_idx) {
	
		return reviewDAO.select(review_idx);
	}

	@Override
	public void insert(Review review) {
		reviewDAO.insert(review);
		
	}

	@Override
	public void update(Review review) {
		reviewDAO.update(review);
		
	}

	@Override
	public void delete(int review_idx) {
		reviewDAO.delete(review_idx);
		
	}

}
