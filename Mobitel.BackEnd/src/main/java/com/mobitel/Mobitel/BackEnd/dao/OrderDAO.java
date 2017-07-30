package com.mobitel.Mobitel.BackEnd.dao;

import java.util.List;



import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mobitel.Mobitel.BackEnd.model.Order1;

@Repository("orderDAO")

public class OrderDAO {

	
	@Autowired
	SessionFactory sessionFactory;
	
	public OrderDAO(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertUpdateOrder(Order1 order)
	{
		Session session=sessionFactory.getCurrentSession();
		System.out.println("####in save ");
		session.saveOrUpdate(order);
		
	}
	
	public Order1 getOrder(int orderid)
	{
		Session session=sessionFactory.openSession();
		Order1 order=(Order1)session.get(Order1.class,orderid);
	
		return order;
	}

	@Transactional
	public void deleteOrder(Order1 order)
	{
		sessionFactory.getCurrentSession().delete(order);
	}
	
	public List<Order1> getOrderDetails(String username)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Order1  where username=:username");
		query.setParameter("username", username);
		@SuppressWarnings("unchecked")
		List<Order1> list=query.list();
		session.close();
		return list;
	}

	
	
	
	
}