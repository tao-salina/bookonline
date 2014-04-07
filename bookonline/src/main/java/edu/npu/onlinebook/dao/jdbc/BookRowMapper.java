package edu.npu.onlinebook.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import edu.npu.onlinebook.domain.Book;

public class BookRowMapper implements RowMapper<Book> {

	public Book mapRow(ResultSet resultSet, int row) throws SQLException {

		Book book = new Book();

		book.setBookId(resultSet.getLong("bookid"));
		book.setBookName(resultSet.getString("bookname"));
		book.setBookType(resultSet.getString("booktype"));
		book.setAuthor(resultSet.getString("author"));
		book.setDetail(resultSet.getString("detail"));
		book.setImage(resultSet.getString("image"));
		book.setPrice(resultSet.getFloat("price"));
		return book;
	}

}
