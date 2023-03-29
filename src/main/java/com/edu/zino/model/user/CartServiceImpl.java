package com.edu.zino.model.user;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.zino.domain.Cart;
import com.edu.zino.domain.Member;
import com.edu.zino.domain.Subject;
import com.edu.zino.domain.Wish;
import com.edu.zino.exception.CartException;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private WishDAO wishDAO;
	
	//전체 카트 목록 가져오기
	public List selectAll(Member member) {
		return cartDAO.selectAll(member);
	}

	//찜목록 > 카트로 이동하기
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(Cart[] cart) throws CartException{
		for(int i=0; i<cart.length; i++) {
			cartDAO.Insert(cart[i]);
		}
	}

	//카트에서 삭제하기
	@Transactional(propagation = Propagation.REQUIRED)
	public void delCart(Cart[] cart) throws CartException{
			for(int i=0; i<cart.length; i++) {
				cartDAO.delCart(cart[i]);
			}
		}

	//카트 중복검사
	@Override
	public int selectCount(Cart cart)  throws CartException {
		int count = cartDAO.selectCount(cart);
		return count;
	}

	//카트 한 건만 삭제
	@Transactional(propagation = Propagation.REQUIRED)
	public void delOneCart(int cart_idx) {
		cartDAO.delOneCart(cart_idx);
		
	}


	
}
