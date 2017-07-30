package com.mobitel.Mobitel.BackEnd.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mobitel.Mobitel.BackEnd.model.Cart;

@Repository("cartDAO")

public class CartDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	public CartDAO(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public void addToCart(Cart cartitem)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(cartitem);
		
	}
	public Cart getCartItem(int cartItemid)
	{
		Session session=sessionFactory.openSession();
		Cart cart=(Cart)session.get(Cart.class,cartItemid);
		session.close();
		return cart;
	}
	@Transactional
	public void deleteCartItem(Cart cart)
	{
		sessionFactory.getCurrentSession().delete(cart);
	}
	
	@Transactional
	public void updatecart(Cart cart)
	{
		sessionFactory.getCurrentSession().update(cart);
	}

	public List<Cart> getCartItems(String username)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where username='"+username+"'");
	//	query.setParameter("username", username);
		@SuppressWarnings("Unchacked")
		List<Cart> list=query.list();
		session.close();
		return list;
		
		
	}
	

	public int getCartId() {
		//System.out.println("get max cart with id record...");
		Session session = sessionFactory.openSession();
		String maxid = "select max(cartid) from Cart";
		Query query = session.createQuery(maxid);
		int cartid = (int) query.list().size();
		System.out.println(cartid);
		return cartid + 1;
	}
	public List<Cart> getCartDetails(String username)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where username=:username");
		query.setParameter("username", username);
		List<Cart> list=query.list();
		session.close();
		return list;
	}
	
	
	
	public int getCartid(String username)						//get cart id 
	 {
		 	Session session=sessionFactory.openSession();
			Query query1=session.createQuery("select cartid from Cart where username='"+username+"'");
			if(query1!=null)
			{
			int cartid=(int) query1.list().get(0);
			System.out.println(cartid);
			return cartid;
			}
			else
			{
			Query query2=session.createQuery("select max(cartid) from Cart");
			int cartid=(int)query2.list().get(0);
			return cartid+1;	
			}
	 }
	 public Cart checkprodid(String username,int proid)
	 {
		 Session session=sessionFactory.openSession();
		 Query query2=session.createQuery("from Cart where username='"+username+"' and proid="+proid);

		 if(query2.list().size()!=0)
		 {
			 Cart cart=(Cart)query2.list().get(0);
			 return cart;
		 }
		return null;
		
	 }
	 
	 public int  increaseQty(int quantity,String username,int proid)
	 {
		 Session session=sessionFactory.openSession();
		 Query query2=session.createQuery("select quantity from Cart where username='"+username+"' and proid="+proid);
		 System.out.println(query2.list().size());
		  int quantity1=quantity+(int)query2.list().get(0);
		  
		  return quantity1;	 
	 }
	
}
