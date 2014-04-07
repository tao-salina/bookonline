package edu.npu.onlinebook.dao.jdbc;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import edu.npu.onlinebook.dao.UserDao;
import edu.npu.onlinebook.domain.User;

@Repository("UserDaoJdbcImpl")
public class UserDaoJdbcImpl implements UserDao {
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;

	private NamedParameterJdbcTemplate namedTemplate;
	private SimpleJdbcInsert jdbcInsert;
	private UserRowMapper userRowMapper;

	@PostConstruct
	public void setup() {
		namedTemplate = new NamedParameterJdbcTemplate(dataSource);
		userRowMapper = new UserRowMapper();
		jdbcInsert = new SimpleJdbcInsert(dataSource).withTableName("user")
				.usingGeneratedKeyColumns("userid")
				.usingColumns("firstname", "lastname", "email", "password");
	}

	public void insertUser(User stud) {
		long id;
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(
				stud);
		Number newId = jdbcInsert.executeAndReturnKey(paramSource);
		id = newId.longValue();
		stud.setUserId(id);
	}

	public User findUserByEmailAndPswd(String email, String password) {
		String sql = "SELECT * FROM user WHERE email = :email AND password = :password";
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("email", email);
		params.addValue("password", password);
		User user = namedTemplate.queryForObject(sql, params, userRowMapper);

		return user;
	}

	public User findUserById(long userId) {
		String sql = "SELECT * FROM user WHERE userid = :userid";
		MapSqlParameterSource params = new MapSqlParameterSource("userid",
				userId);
		User user = namedTemplate.queryForObject(sql, params, userRowMapper);

		return user;
	}
}
