package com.edu.zino.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.zino.domain.Member;
import com.edu.zino.domain.Wish;
import com.edu.zino.exception.WishException;

@Service
public class WishServiceImpl implements WishService{

	@Autowired
	private WishDAO wishDAO;
	
	public List selectAll(Member member) {
		return wishDAO.selectAll(member);
	}

	@Override
	public Wish select(Wish wish) {
		return wishDAO.select(wish);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delWish(Wish[] wish)throws WishException{
		for(int i=0; i<wish.length; i++) {			
			wishDAO.delWish(wish[i]);		
		}
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(Wish wish) throws WishException{
		wishDAO.insert(wish);
	}

	@Override
	public int selectCount(Wish wish)  throws WishException {
		int count = wishDAO.selectCount(wish);
		return count;
	}
	

}
