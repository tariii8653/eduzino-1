package com.edu.zino.model.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.edu.zino.domain.Review;
import com.edu.zino.exception.ReviewException;

public class MybatisReviewDAO implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		
		return sqlSessionTemplate.selectList("Review.selectAll");
	}

	@Override
	public Review select(int review_idx) {
		
		return sqlSessionTemplate.selectOne("Review.select",review_idx);
	}

	@Override
	public void insert(Review review) throws ReviewException{
		int result=sqlSessionTemplate.insert("Review.insert",review);
		if(result<1) {
			throw new ReviewException("수강평 한건 조회 실패");
		}
		
	}

	@Override
	public void update(Review review) throws ReviewException{
		int result=sqlSessionTemplate.update("Review.update",review);
		if(result<1) {
			throw new ReviewException("수강평 한건 수정 실패");
		}
		
	}

	@Override
	public void delete(int review_idx) throws ReviewException{
		int result=sqlSessionTemplate.delete("Review.update",review_idx);
		if(result<1) {
			throw new ReviewException("수강평 한건 삭제 실패");
		}
	}

}
