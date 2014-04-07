package edu.npu.onlinebook.dao.mock;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import edu.npu.onlinebook.dao.BookDao;
import edu.npu.onlinebook.domain.Book;

@Repository("BookDaoMockImpl")
public class BookDaoMockImpl implements BookDao {
	private ArrayList<Book> bookList;
	static int idCnt = 1;
	
	@PostConstruct
	private void initData() {
		bookList = new ArrayList<Book>();
	}
	
	@Override
	public List<Book> findBookByType(String bookType) {
		return bookList;
	}

	@Override
	public List<Book> findBookByNameAndType(String bookName, String bookType) {
		return bookList;
	}

	@Override
	public Book findBookById(long bookId) {
		return null;
	}

	@Override
	public List<Book> findAllBook() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> findBookByName(String bookName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> findBookByPrice(float low, float high) {
		// TODO Auto-generated method stub
		return null;
	}

}
