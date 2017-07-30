package com.mobitel.Mobitel.BackEnd;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;


import com.mobitel.Mobitel.BackEnd.dao.*;
import com.mobitel.Mobitel.BackEnd.model.*;

public class OrderTestCase 
{
	public static void main(String arg[])
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		
		context.scan("com.mobitel.Mobitel.BackEnd");
		
		context.refresh();
		
		// Inserting a Order Object.
		OrderDAO orderDAO=(OrderDAO)context.getBean("orderDAO");
		
		//Insertion TestCase
		
		Order1 order=new Order1();
		
		//order.setOrderid(1);
		order.setUsername("radha");
		order.setCartid(1);
		order.setPaymode("CC");
		order.setStatus("N");
		order.setShipmentaddress("pune");
		orderDAO.insertUpdateOrder(order);		
		System.out.println("Order Inserted");
		
		
		//Retrieval TestCase
		
		/*Order order=orderDAO.getOrder(1);
		System.out.println("Order Name:"+order.getUsername());
		System.out.println("Order Description:"+order.getPaymode());
		
		//Deletion TestCase
		Order order=OrderDAO.getOrder(1);
		OrderDAO.deleteOrder(order);
		System.out.println("The Order Deleted");
		*/
		//Retrieving the Data
		
		/*List<Order> list=orderDAO.getOrderDetails("radha");
		
		for(Order order:list)
		{
			System.out.println(order.getOrderid()+":"+order.getUsername());
		}
		*/
		//Update the Order
		/*Order order=orderDAO.getOrder(1);
		order.setUsername("shivaram");
		orderDAO.insertUpdateOrder(order);
		System.out.println("The Order Updated");
		*/
	}
}
