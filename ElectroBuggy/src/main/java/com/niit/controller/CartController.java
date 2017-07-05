package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobitel.Mobitel.BackEnd.dao.CartDAO;
import com.mobitel.Mobitel.BackEnd.model.Cart;

@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO;

	@RequestMapping("/cart")
	public String ShowCartPage(Model m) {
		List<Cart> list = cartDAO.getCartItems("");
		m.addAttribute("cartItems", list);
		return "Cart";
	}

}
