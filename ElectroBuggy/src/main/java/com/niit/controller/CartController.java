package com.niit.controller;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.*;
import com.mobitel.Mobitel.BackEnd.model.*;

@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO;
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/Cart")
	public String ShowCartPage(Model m,HttpSession session) {
		String username=(String)session.getAttribute("username");
		
		List<Cart> list = cartDAO.getCartItems(username);
		m.addAttribute("cartlist", list);
		return "Cart";
	}
	@RequestMapping(value="/addToCart/{proid}",method=RequestMethod.GET)
	public String GotoaddToCart(@PathVariable("proid")int proid,@RequestParam("quantity") int quantity,HttpSession session,Model m)
	{
	System.out.println("adding to the cart");
		Cart cart=new Cart();
		String username=(String) session.getAttribute("username");
		System.out.println("Radha");
		cart.setCartid(1002);
		cart.setProid(proid);
		cart.setQuantity(quantity);
		cart.setStatus("N");
		cart.setUsername(username);
		Product product=productDAO.getProduct(proid);
		cart.setProname(product.getProname());
		cart.setPrice(product.getPrice());
		cartDAO.addToCart(cart);
		List<Cart> list=cartDAO.getCartDetails(username);
		m.addAttribute("cartlist", list);
		System.out.println("cart added");
		return "Cart";
	}

@RequestMapping(value="/update/{cartItemid}")
public String updateCart(@PathVariable("cartItemid") int cartItemid,@RequestParam("quantity") int quantity,HttpSession session,Model m)
{
	
	Cart cart=(Cart)cartDAO.getCartItem(cartItemid);
	
	cart.setQuantity(quantity);
	cartDAO.addToCart(cart);
	
String username=(String) session.getAttribute("username");
	
	List<Cart> list=cartDAO.getCartDetails(username);
	m.addAttribute("cartlist",list);
	
	
	
	return "Cart";
	
	}




@RequestMapping(value="/delete/{cartItemid}")
public String deleteCart(@PathVariable("cartItemid") int cartItemid,HttpSession session,Model m)
{

	
	Cart cart=(Cart)cartDAO.getCartItem(cartItemid);
	
	cartDAO.deleteCartItem(cart);
	
String username=(String) session.getAttribute("username");
	
	List<Cart> list=cartDAO.getCartDetails(username);
	m.addAttribute("cartlist",list);
	
	
	
	return "Cart";
	
}






}


