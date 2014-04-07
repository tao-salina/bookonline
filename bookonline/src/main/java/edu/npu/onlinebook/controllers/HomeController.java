package edu.npu.onlinebook.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.npu.onlinebook.domain.Book;
import edu.npu.onlinebook.services.BookService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	BookService bookService;

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public ModelAndView home(String userId, String lastName, HttpSession session) {
		ModelAndView modelView;
		List<Book> bookList = bookService.searchBook("", "all");
		modelView = new ModelAndView("home");
		session.setAttribute("bookList", bookList);
		session.setAttribute("userId",userId );
		session.setAttribute("lastName", lastName);
		modelView.addObject("bookList", bookList);
		return modelView;
	}

}
