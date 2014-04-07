package edu.npu.onlinebook.controllers;

import java.util.List;

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

import edu.npu.onlinebook.domain.Order;
import edu.npu.onlinebook.services.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@RequestMapping(value = "/showUserOrders", method = RequestMethod.GET)
	public ModelAndView showUserOrders(long userId, HttpSession session) {
		ModelAndView modelView;
		if (userId == 0) {
			modelView = new ModelAndView("failure");
			return modelView;
		}
		List<Order> orderList = orderService.findOrderByUserId(userId);
		modelView = new ModelAndView("showuserorders");
		session.setAttribute("orderList", orderList);
		modelView.addObject("orderList", orderList);
//		logger.info("orderList.size====" + orderList.size());
		return modelView;
	}

	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public ModelAndView createOrder(@Valid Order order, BindingResult result,
			HttpSession session) {
		ModelAndView modelView;

		if (result.hasErrors()) {
			modelView = new ModelAndView("checkout", "order", order);
			return modelView;
		}
		orderService.addNewOder(order);
		modelView = new ModelAndView("success");
		session.setAttribute("order", order);
		modelView.addObject("order", order);
		modelView.addObject("msg", "Create Order");
		

		return modelView;
	}

	@RequestMapping(value = "/showCheckOut", method = RequestMethod.GET)
	public ModelAndView showBookCart(long userId) {
		ModelAndView modelView;
		if (userId == 0) {
			modelView = new ModelAndView("failure");
			return modelView;
		}
		modelView = new ModelAndView("checkout");

		return modelView;
	}

}
