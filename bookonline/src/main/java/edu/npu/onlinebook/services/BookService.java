package edu.npu.onlinebook.services;

import java.util.List;

import edu.npu.onlinebook.domain.Book;

public interface BookService {

	public List<Book> searchBook(String bookName, String bookType);
	
	public List<Book> searchBookByPrice(int priceLevel);

	public Book getBookById(long bookId);

}
