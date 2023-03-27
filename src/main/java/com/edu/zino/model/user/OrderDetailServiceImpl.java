package com.edu.zino.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.exception.OrderDetailException;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	@Transactional
	public void regist(OrderDetail[] orderDetail) throws OrderDetailException{
		for(int i=0; i<orderDetail.length; i++) {			
			orderDetailDAO.insert(orderDetail[i]);
		}
	}

	@Override
	public List selectAll(OrderSummary orderSummary) {
		return orderDetailDAO.selectAll(orderSummary);
	}

}
