package edu.npu.onlinebook.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.npu.onlinebook.domain.User;

public class UserRowMapper implements RowMapper<User> {

	public User mapRow(ResultSet resultSet, int row) throws SQLException {

		User user = new User();

		user.setUserId(resultSet.getLong("userid"));
		user.setEmail(resultSet.getString("email"));
		user.setFirstName(resultSet.getString("firstname"));
		user.setLastName(resultSet.getString("lastname"));
		user.setPassword(resultSet.getString("password"));
		return user;
	}

}
