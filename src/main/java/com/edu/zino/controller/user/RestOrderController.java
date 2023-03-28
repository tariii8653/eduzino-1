package com.edu.zino.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.zino.domain.OrderDetail;
import com.edu.zino.domain.OrderSummary;
import com.edu.zino.model.root.OrderService;

@RequestMapping("/rest")
@RestController
public class RestOrderController {

	@Autowired
	private OrderService orderService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/order/orderlist/{summary_idx}")
	public List<OrderDetail> getOrderDetail(@PathVariable("summary_idx") int order_summary_idx){
		return orderService.selectAll(order_summary_idx);
	}
	
	
	
	
}
