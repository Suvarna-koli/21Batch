package com.mobitel.Mobitel.BackEnd;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mobitel.Mobitel.BackEnd.dao.CartDAO;
import com.mobitel.Mobitel.BackEnd.model.Cart;


public class CartTestCase {
	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

		context.scan("com.mobitel.Mobitel.BackEnd");

		context.refresh();

		// Inserting a Cart Object.
		CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");

		// Insertion TestCase
		
		Cart cart = new Cart();

		cart.setCartid(1001);
		cart.setProid(2);
		cart.setProname("M5 Apson");
		cart.setPrice(1200);
		cart.setQuantity(5);
		cart.setStatus("N");
		cart.setUsername("Radha");
		cartDAO.addToCart(cart);
		System.out.println("Added to cart");
	
		/*//retriving cart details
		List<Cart> list=cartDAO.getCartItems("Radha");
		for(Cart cart:list)
		{
			System.out.println(cart.getCartid()+":::");
			System.out.println(cart.getProid()+":::");
			System.out.println(cart.getProname()+":::");
			System.out.println(cart.getProprice()+":::");
			System.out.println(cart.getProquantity()+":::");
			
		}
		System.out.println("Cart Item displayed:");*/
	
		/*	//Update the Category
				Cart cart=cartDAO.getCartItem(1);
				cart.setProname("M12");
				cartDAO.addToCart(cart);
				System.out.println("The Cart Updated");
	*/			
		
		//Deletion TestCase
				/*Cart cart=cartDAO.getCartItem(2);
				cartDAO.deleteCartItem(cart);
				System.out.println("The Cart Deleted");
				*/
	}
}

