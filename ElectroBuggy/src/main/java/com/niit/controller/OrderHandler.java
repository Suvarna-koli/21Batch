package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.webflow.execution.RequestContext;

import com.mobitel.Mobitel.BackEnd.dao.CartDAO;
import com.mobitel.Mobitel.BackEnd.dao.OrderDAO;
import com.mobitel.Mobitel.BackEnd.dao.ProductDAO;
import com.mobitel.Mobitel.BackEnd.dao.UserDAO;
import com.mobitel.Mobitel.BackEnd.model.Cart;
import com.mobitel.Mobitel.BackEnd.model.Order1;
import com.mobitel.Mobitel.BackEnd.model.User;

@Component
public class OrderHandler {
	@Autowired
	CartDAO cartDAO;

	@Autowired
	OrderDAO orderDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
ProductDAO productDAO;


	@Autowired
	HttpSession session;
	

	public void  orderConfirm(RequestContext context)
	{
		
		System.out.println("In order function");
		String username=(String)session.getAttribute("username");
		List<Cart> cartlist=cartDAO.getCartDetails(username);
		User user=userDAO.getUser(username);
		String shipmentaddress=user.getAddr();

	int total=0;
		for(Cart cart:cartlist)
		{
					
			total=total+(cart.getQuantity()*cart.getPrice());
			
		}
		context.getFlowScope().put("shipmentaddress",shipmentaddress);
		context.getFlowScope().put("total", total);
		context.getFlowScope().put("cartlist", cartlist);
	}
	

	
	
}
