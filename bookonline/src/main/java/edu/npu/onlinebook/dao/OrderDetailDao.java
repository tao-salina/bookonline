package edu.npu.onlinebook.dao;

import java.util.List;

import edu.npu.onlinebook.domain.OrderDetail;

public interface OrderDetailDao {

	public List<OrderDetail> findOrderDetailByOrderId(long orderId);

	public int insertOrderDetail(OrderDetail orderDetail);

}
