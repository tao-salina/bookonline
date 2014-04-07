package edu.npu.onlinebook.dao.jdbc;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.npu.onlinebook.dao.BookDao;
import edu.npu.onlinebook.domain.Book;

@Repository("BookDaoJdbcImpl")
public class BookDaoJdbcImpl implements BookDao {
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate namedTemplate;
	private BookRowMapper bookRowMapper;

	@PostConstruct
	public void setup() {
		jdbcTemplate = new JdbcTemplate(dataSource);
		namedTemplate = new NamedParameterJdbcTemplate(dataSource);
		bookRowMapper = new BookRowMapper();
	}

	public List<Book> findBookByType(String bookType) {
		String sql = "SELECT * FROM book WHERE booktype=?";
		List<Book> bookList = jdbcTemplate.query(sql, bookRowMapper, bookType);
		return bookList;
	}

	public List<Book> findBookByName(String bookName) {
		String sql = "SELECT * FROM book WHERE LOWER(bookname) LIKE :bookname";
		String finalName = "%" + bookName.toLowerCase().trim() + "%";
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("bookname", finalName);

		List<Book> bookList = namedTemplate.query(sql, params, bookRowMapper);
		return bookList;
	}

	public List<Book> findBookByNameAndType(String bookName, String bookType) {
		String sql = "SELECT * FROM book WHERE booktype = :booktype AND LOWER(bookname) LIKE :bookname";
		String finalName = "%" + bookName.toLowerCase().trim() + "%";

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("booktype", bookType);
		params.addValue("bookname", finalName);

		List<Book> bookList = namedTemplate.query(sql, params, bookRowMapper);
		return bookList;
	}
	
	public List<Book> findBookByPrice(float low, float high){
		String sql = "SELECT * FROM book WHERE price >= ? and price < ?";
		List<Book> bookList = jdbcTemplate.query(sql, bookRowMapper, low, high );
		return bookList;
	}

	public List<Book> findAllBook() {
		String sql = "SELECT * FROM book";
		List<Book> bookList = jdbcTemplate.query(sql, bookRowMapper);
		return bookList;
	}

	public Book findBookById(long bookId) {
		String sql = "SELECT * FROM book WHERE bookid = :bookid";
		MapSqlParameterSource params = new MapSqlParameterSource("bookid",
				bookId);
		Book book = namedTemplate.queryForObject(sql, params, bookRowMapper);

		return book;
	}

}
