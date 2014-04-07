package edu.npu.onlinebook.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.npu.onlinebook.domain.Book;
import edu.npu.onlinebook.services.BookService;

@Controller
public class BookController {
	@Autowired
	BookService bookService;

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@RequestMapping(value = "/searchBook", method = RequestMethod.GET)
	public ModelAndView searchBook(String bookName, String bookType, HttpSession session) {
		ModelAndView modelView;

		List<Book> bookList = bookService.searchBook(bookName, bookType);
		modelView = new ModelAndView("home");
		session.setAttribute("bookList", bookList);
		modelView.addObject("bookList", bookList);
		return modelView;
	}
	
	@RequestMapping(value = "/searchBookByPrice", method = RequestMethod.GET)
	public ModelAndView searchBookByPrice(int priceLevel, HttpSession session) {
		ModelAndView modelView;

		List<Book> bookList = bookService.searchBookByPrice(priceLevel);
		modelView = new ModelAndView("home");
		session.setAttribute("bookList", bookList);
		modelView.addObject("bookList", bookList);
		return modelView;
	}

	@RequestMapping(value = "/showBookDetail", method = RequestMethod.GET)
	public ModelAndView showBookDetail(long bookId, HttpSession session) {
		ModelAndView modelView;

		Book book = bookService.getBookById(bookId);

		modelView = new ModelAndView("bookdetail");
		session.setAttribute("book", book);
		modelView.addObject("book", book);

		return modelView;
	}
	
	@RequestMapping(value = "/showBookCart", method = RequestMethod.GET)
	public ModelAndView showBookCart() {
		ModelAndView modelView;

		modelView = new ModelAndView("shoppingcart");

		return modelView;
	}

}
