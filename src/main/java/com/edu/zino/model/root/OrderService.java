package com.edu.zino.model.root;

import java.util.List;

import com.edu.zino.domain.Member;
import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;

public interface OrderService {
	
	/*--orderSummary-----*/
	//결제내역 추가
	public void regist(OrderSummary orderSummary);
	
	//회원별 주문내역 가져오기
	public List selectAllByMember(Member member);
	
	//토스 결제로직
	public String getPay(String orderId, int amount, String paymentKey);

	/*--orderDetail-----*/
	
	//상세내역 전체 가져오기
	public List selectAll(int order_summary_idx);
	
}