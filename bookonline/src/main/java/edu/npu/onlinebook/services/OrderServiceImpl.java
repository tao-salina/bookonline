package edu.npu.onlinebook.services;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.npu.onlinebook.dao.OrderDao;
import edu.npu.onlinebook.dao.OrderDetailDao;
import edu.npu.onlinebook.domain.Order;
import edu.npu.onlinebook.domain.OrderDetail;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	@Qualifier("OrderDaoJdbcImpl")
	private OrderDao orderDao;
	
	@Autowired
	@Qualifier("OrderDetailDaoJdbcImpl")
	private OrderDetailDao orderDetailDao;

	@Override
	public void addNewOder(Order order) {
		List<OrderDetail> details = order.getDetails();

		Date date = new Date();
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		// String strDate = df.format(date);
		order.setDate(date);
		long orderId = orderDao.insertOrder(order);
		for (OrderDetail orderDetail : details) {
			orderDetail.setOrderId(orderId);
			orderDetailDao.insertOrderDetail(orderDetail);
		}
	}

	@Override
	public List<Order> findOrderByUserId(long userId) {
		return orderDao.findOrderByUserId(userId);
	}

}
