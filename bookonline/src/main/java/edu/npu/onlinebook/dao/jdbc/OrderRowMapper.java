package edu.npu.onlinebook.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.npu.onlinebook.domain.Order;

public class OrderRowMapper implements RowMapper<Order> {

	public Order mapRow(ResultSet resultSet, int row) throws SQLException {

		Order order = new Order();
		
		order.setOrderId(resultSet.getLong("orderid"));
		order.setUserId(resultSet.getLong("userid"));
		order.setDate(resultSet.getDate("date"));
		order.setTotalAmount(resultSet.getFloat("totalamount"));
		order.setCreditNo(resultSet.getString("creditno"));
		order.setShipAddress(resultSet.getString("shipaddress"));
		return order;
	}

}
