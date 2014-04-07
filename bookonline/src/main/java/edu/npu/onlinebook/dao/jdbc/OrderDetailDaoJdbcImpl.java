package edu.npu.onlinebook.dao.jdbc;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import edu.npu.onlinebook.dao.OrderDetailDao;
import edu.npu.onlinebook.domain.OrderDetail;

@Repository("OrderDetailDaoJdbcImpl")
public class OrderDetailDaoJdbcImpl implements OrderDetailDao {
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;

	private JdbcTemplate jdbcTemplate;
	private SimpleJdbcInsert jdbcInsert;
	private OrderDetailRowMapper orderDetailRowMapper;

	@PostConstruct
	public void setup() {
		jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcInsert = new SimpleJdbcInsert(dataSource).withTableName(
				"orderdetail").usingGeneratedKeyColumns("orderdetailid");
		orderDetailRowMapper = new OrderDetailRowMapper();

	}

	public int insertOrderDetail(OrderDetail orderDetail) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(
				orderDetail);
		Number newId = jdbcInsert.executeAndReturnKey(params);
		return newId.intValue();
	}

	public List<OrderDetail> findOrderDetailByOrderId(long orderId) {
		String sql = "SELECT * FROM orderdetail WHERE orderid=?";
		List<OrderDetail> detailList = jdbcTemplate.query(sql,
				orderDetailRowMapper, orderId);
		return detailList;
	}

}
