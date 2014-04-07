package edu.npu.onlinebook.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import edu.npu.onlinebook.dao.BookDao;
import edu.npu.onlinebook.domain.Book;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	@Qualifier("BookDaoJdbcImpl")
	private BookDao bookDao;

	public List<Book> searchBook(String bookName, String bookType) {
		List<Book> bookList = null;
		if ((bookName == null || bookName.equals("")) && bookType.equals("all")) {
			bookList = bookDao.findAllBook();
		} else if (bookName == null || bookName.equals("")) {
			bookList = bookDao.findBookByType(bookType);
		} else if (bookType.equals("all")) {
			bookList = bookDao.findBookByName(bookName);
		} else {
			bookList = bookDao.findBookByNameAndType(bookName, bookType);
		}

		return bookList;
	}

	public List<Book> searchBookByPrice(int priceLevel) {
		List<Book> bookList = null;
		float low = 0;
		float high = 0;
		switch (priceLevel) {
		case 1:
			low = 0;
			high = 10;
			break;
		case 2:
			low = 10;
			high = 25;
			break;
		case 3:
			low = 25;
			high = 50;
			break;
		case 4:
			low = 50;
			high = 100000;
			break;
		}

		bookList = bookDao.findBookByPrice(low, high);

		return bookList;
	}

	public Book getBookById(long bookId) {
		return bookDao.findBookById(bookId);
	}

}
