package edu.npu.onlinebook.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.npu.onlinebook.domain.OrderDetail;

public class OrderDetailRowMapper implements RowMapper<OrderDetail> {

	public OrderDetail mapRow(ResultSet resultSet, int row) throws SQLException {
		
		OrderDetail orderDetail = new OrderDetail();
		
		orderDetail.setOrderDetailId(resultSet.getLong("orderdetailid"));
		orderDetail.setOrderId(resultSet.getLong("orderid"));
		orderDetail.setBookId(resultSet.getLong("bookid"));
		orderDetail.setQuantity(resultSet.getInt("quantity"));
		return orderDetail;
	}

}
