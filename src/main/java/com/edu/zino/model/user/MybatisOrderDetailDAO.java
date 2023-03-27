package com.edu.zino.model.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.exception.OrderDetailException;

@Repository
public class MybatisOrderDetailDAO implements OrderDetailDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//주문 상세내역 추가
	@Override
	public void insert(OrderDetail orderDetail) throws OrderDetailException{
		
		int result = sqlSessionTemplate.insert("OrderDetail.insert", orderDetail);
		if(result<1) {
			throw new OrderDetailException("주문상세내역 추가 실패");
		}
	}
	
	//주문idx에 딸린 건수 가져오기
	@Override
	public List selectAll(OrderSummary orderSummary) throws OrderDetailException{
		return sqlSessionTemplate.selectList("OrderDetail.selectByOrderSummary",orderSummary);
	}

}
