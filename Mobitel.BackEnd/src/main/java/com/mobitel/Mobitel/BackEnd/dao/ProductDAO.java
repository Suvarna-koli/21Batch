package com.mobitel.Mobitel.BackEnd.dao;

import java.util.List;



import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mobitel.Mobitel.BackEnd.model.Product;


@Repository("productDAO")
public class ProductDAO {

	int proid;
	@Autowired
	SessionFactory sessionFactory;
	
	public ProductDAO(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	
	@Transactional
	public void insertUpdateProduct(Product product)
	{
		//System.out.println("Updating the record...");
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);

		//System.out.println("Updated the record...");
	}
	public int getProdcutId()
	{
		Session session=sessionFactory.openSession();
		String maxid="select max(proid) from Product";
		Query query=session.createQuery(maxid);
		int proid=(int)query.list().size();
		System.out.println(proid);
		return proid+1;
	}
	public Product getProduct(int proid)
	{
		Session session=sessionFactory.openSession();
		Product product=(Product)session.get(Product.class,proid);
		
		session.close();
		return product;
	}
	
	@Transactional
	public void deleteProduct(Product product)
	{
		sessionFactory.getCurrentSession().delete(product);
	}
	
	public List<Product> getProductDetails()
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product");
		List<Product> list=query.list();
		session.close();
		return list;
	}
	public List<Product> getProductDetailsByCatId(int catid)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product where catid=:catid");
		query.setParameter("catid", catid);
		List<Product> list=query.list();
		session.close();
		return list;
	}
	
}

