package edu.npu.onlinebook.dao.jdbc;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import edu.npu.onlinebook.dao.OrderDao;
import edu.npu.onlinebook.domain.Order;

@Repository("OrderDaoJdbcImpl")
public class OrderDaoJdbcImpl implements OrderDao {
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate namedTemplate;
	private SimpleJdbcInsert jdbcInsert;
	private OrderRowMapper orderRowMapper;

	@PostConstruct
	public void setup() {
		jdbcTemplate = new JdbcTemplate(dataSource);
		namedTemplate = new NamedParameterJdbcTemplate(dataSource);
		jdbcInsert = new SimpleJdbcInsert(dataSource)
				.withTableName("cusorder")
				.usingGeneratedKeyColumns("orderid")
				.usingColumns("userid", "date", "totalamount", "creditno",
						"shipaddress");
		orderRowMapper = new OrderRowMapper();

	}

	public int insertOrder(Order order) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(order);
		Number newId = jdbcInsert.executeAndReturnKey(params);
		return newId.intValue();
	}

	public List<Order> findOrderByUserId(long userId) {
		String sql = "SELECT * FROM cusorder WHERE userid=?";
		List<Order> orderList = jdbcTemplate.query(sql, orderRowMapper, userId);
		return orderList;
	}

	public Order findOrderById(long orderId) {
		String sql = "SELECT * FROM cusorder WHERE orderid = :orderid";
		MapSqlParameterSource params = new MapSqlParameterSource("orderid",
				orderId);
		Order order = namedTemplate.queryForObject(sql, params, orderRowMapper);

		return order;
	}

}
