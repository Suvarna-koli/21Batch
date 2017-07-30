package com.niit.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.CartDAO;
import com.mobitel.Mobitel.BackEnd.dao.ProductDAO;
import com.mobitel.Mobitel.BackEnd.model.Cart;
import com.mobitel.Mobitel.BackEnd.model.Product;

@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO;
	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/Cart")
	public String ShowCartPage(Model m, HttpSession session) {
		String username = (String) session.getAttribute("username");

		List<Cart> list = cartDAO.getCartItems(username);
		m.addAttribute("cartlist", list);
		return "Cart";
	}

	@RequestMapping(value = "/addToCart/{proid}", method = RequestMethod.POST)
	public String GotoaddToCart(@PathVariable("proid") int proid, @RequestParam("quantity") int quantity,
			HttpSession session, Model m) {
		System.out.println("adding to the cart");
		String username = (String) session.getAttribute("username");
		Cart cart = cartDAO.checkprodid(username, proid);
		if (cart != null) {
			// is there product is exist or not
			System.out.println("in add if condition");
			quantity = cartDAO.increaseQty(quantity, username, proid);
			System.out.println(cart.getQuantity());
			cart.setQuantity(quantity);
			System.out.println(cart.getQuantity());

			cartDAO.addToCart(cart);
			List<Cart> list = cartDAO.getCartDetails(username);
			m.addAttribute("cartlist", list);
			System.out.println("cart added" + list.size());
			return "Cart";
		} else {
			cart = new Cart();

			System.out.println(username);
			System.out.println(proid);
			// System.out.println(cartid);

			int cartid = cartDAO.getCartId();
			cart.setCartid(cartid);
			cart.setProid(proid);
			cart.setQuantity(quantity);
			cart.setStatus("N");
			cart.setUsername(username);
			/*
			 * Date date=new Date(); cart.setDate(date);
			 */
			cart.setDate(new Date(System.currentTimeMillis()));
			Product product = productDAO.getProduct(proid);
			cart.setProname(product.getProname());
			cart.setPrice(product.getPrice());
			cartDAO.addToCart(cart);

			List<Cart> list = cartDAO.getCartDetails(username);
			m.addAttribute("cartlist", list);
			System.out.println("cart added" + list.size());
			return "Cart";
		}

	}

	@RequestMapping(value = "/update/{cartItemid}", method = RequestMethod.GET)
	public String updateCart(@PathVariable("cartItemid") int cartItemid, @RequestParam("quantity") int quantity,
			HttpSession session, Model m) {

		Cart cart = (Cart) cartDAO.getCartItem(cartItemid);
		int stock = productDAO.getProduct(cart.getProid()).getQuantity();
		if (stock < quantity) {
			System.out.println("!....OUT OD STOCK....!");
		}
		else {
			cart.setQuantity(quantity);
			cartDAO.addToCart(cart);

			String username = (String) session.getAttribute("username");

			List<Cart> list = cartDAO.getCartDetails(username);
			m.addAttribute("cartlist", list);

		}

		return "redirect:/Cart";

	}

	@RequestMapping(value = "/delete/{cartItemid}")
	public String deleteCart(@PathVariable("cartItemid") int cartItemid, HttpSession session, Model m) {

		Cart cart = (Cart) cartDAO.getCartItem(cartItemid);

		cartDAO.deleteCartItem(cart);

		String username = (String) session.getAttribute("username");

		List<Cart> list = cartDAO.getCartDetails(username);
		m.addAttribute("cartlist", list);

		return "redirect:/Cart";

	}

}
