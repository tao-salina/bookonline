package edu.npu.onlinebook.services;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import edu.npu.onlinebook.domain.Order;

public interface OrderService {

	@Transactional
	public void addNewOder(Order order);
	
	public List<Order> findOrderByUserId(long userId);
	
}
