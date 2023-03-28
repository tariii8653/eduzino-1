package com.edu.zino.model.user;

import java.util.List;

import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;

public interface OrderDetailDAO {
	public void insert(OrderDetail orderDetail);
	public List selectAll(int order_summary_idx);
}
