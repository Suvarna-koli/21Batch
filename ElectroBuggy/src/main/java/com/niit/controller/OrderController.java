package com.niit.controller;

import java.util.List;




import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.*;
import com.mobitel.Mobitel.BackEnd.model.*;

@Controller
public class OrderController {
	@Autowired
	CartDAO cartDAO;

	@Autowired
	OrderDAO orderDAO;


	
	@RequestMapping(value="/payment")
	public String payment(@RequestParam("paymode") String paymode,@RequestParam("grandtotal") int grandtotal,@RequestParam("shipmentaddress") String shipmentaddress,Model m,HttpSession session)
	{
		
		String username=(String) session.getAttribute("username");
		Order1 order=new Order1();
		order.setPaymode(paymode);
		order.setShipmentaddress(shipmentaddress);
		order.setUsername(username);
		order.setStatus("Y");
		order.setGrandtotal(grandtotal);
		System.out.println(order.getGrandtotal());
		orderDAO.insertUpdateOrder(order);	
		
		
		List<Cart> cartlist=cartDAO.getCartDetails(username);
		m.addAttribute("cartlist", cartlist);
		
		List<Order1> ordlist=orderDAO.getOrderDetails(username);
		m.addAttribute("orderlist", ordlist);
		List<Cart>  list2=cartDAO.getCartDetails(username);
		for(Cart cart:list2)
		{
			cartDAO.deleteCartItem(cart);
		}
		
		
		return "payment";
		
	}
	
	
}
