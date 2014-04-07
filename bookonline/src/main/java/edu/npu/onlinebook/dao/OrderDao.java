package edu.npu.onlinebook.dao;

import java.util.List;

import edu.npu.onlinebook.domain.Order;

public interface OrderDao {
	
	public List<Order> findOrderByUserId(long userId);

	public Order findOrderById(long bookId);

	public int insertOrder(Order order);
	
}
