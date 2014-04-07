package edu.npu.onlinebook.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.npu.onlinebook.domain.User;
import edu.npu.onlinebook.services.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public ModelAndView registerForm() {
		ModelAndView modelView;

		modelView = new ModelAndView("register");
		modelView.addObject("user", new User());
		return modelView;
	}

	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public ModelAndView createUser(@Valid User user, BindingResult result,
			HttpSession session) {
		ModelAndView modelView;

		if (result.hasErrors()) {
			modelView = new ModelAndView("registerForm", "user", user);
			return modelView;
		}

		userService.addNewUser(user);
		modelView = new ModelAndView("success");
		session.setAttribute("user", user);
		modelView.addObject("user", user);
		modelView.addObject("msg", "Register ");

		return modelView;
	}

	@RequestMapping(value = "/signInForm", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView modelView;

		modelView = new ModelAndView("signin");
		modelView.addObject("user", new User());
		return modelView;
	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public ModelAndView signOut(HttpSession session) {
		ModelAndView modelView;

		modelView = new ModelAndView("home");
		session.setAttribute("user", new User());
		return modelView;
	}

	@RequestMapping(value = "/processLogin", method = RequestMethod.POST)
	public ModelAndView processLogin(@Valid User user, BindingResult result,
			HttpSession session) {
		ModelAndView modelView;

		if (result.hasErrors()) {
			modelView = new ModelAndView("signin", "user", user);
			return modelView;
		}
		User newUser = userService.login(user.getEmail(), user.getPassword());
		if (newUser == null) {
			modelView = new ModelAndView("signin", "user", user);
			return modelView;
		}
		modelView = new ModelAndView("success");
		session.setAttribute("user", newUser);
		modelView.addObject("user", newUser);
		modelView.addObject("msg", "Sign");

		return modelView;
	}

}
