package com.edu.zino.model.user;

import java.util.List;

import com.edu.zino.domain.Cart;
import com.edu.zino.domain.Member;

public interface CartDAO {
	public List selectAll(Member member);
	public void Insert(Cart cart);
	public void delCart(Cart cart);
	public void delOneCart(int cart_idx);
	public int selectCount(Cart cart);
	public List selectCheckedCart(Cart cart);
}
