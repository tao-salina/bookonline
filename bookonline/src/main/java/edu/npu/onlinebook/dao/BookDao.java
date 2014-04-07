package edu.npu.onlinebook.dao;

import java.util.List;

import edu.npu.onlinebook.domain.Book;

public interface BookDao {

	public List<Book> findAllBook();

	public List<Book> findBookByType(String bookType);
	
	public List<Book> findBookByName(String bookName);

	public List<Book> findBookByNameAndType(String bookName, String bookType);
	
	public List<Book> findBookByPrice(float low, float high);

	public Book findBookById(long bookId);

}
