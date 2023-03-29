package com.edu.zino.model.user;



import java.util.List;

import com.edu.zino.domain.Review;

public interface ReviewDAO {
	public List selectAll();
	public Review select(int review_idx);
	public void insert(Review review);
	public void update(Review review);
	public void delete(int review_idx);
}
