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
	@Autowired// singleton
	SessionFactory sessionFactory;

	public ProductDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertUpdateProduct(Product product) {
		System.out.println("inserting and Updating the record...");
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);

		// System.out.println("Updated the record...");
	}

	public int getProdcutId() {
		//System.out.println("get max product with id record...");
		Session session = sessionFactory.openSession();
		String maxid = "select max(proid) from Product";
		Query query = session.createQuery(maxid);
		int proid = (int) query.list().size();
		System.out.println(proid);
		return proid + 1;
	}

	public Product getProduct(int proid) {
		//specific product
		Session session = sessionFactory.openSession();
		Product product = (Product) session.get(Product.class, proid);

		session.close();
		return product;
	}

	@Transactional
	public void deleteProduct(Product product) {
		sessionFactory.getCurrentSession().delete(product);
	}

	public List<Product> getProductDetails() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		session.close();
		return list;
	}

	public List<Product> getProductDetailsByCatId(int catid) {
		//product by category
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product where catid=:catid");
		query.setParameter("catid", catid);
		List<Product> list = query.list();
		session.close();
		return list;
	}
	public boolean checkproductid(int proid)
	{
		
		Session session=sessionFactory.openSession();
		Query query2=session.createQuery("from Cart where proid="+proid);
		if(query2.list().isEmpty())
		{
		return true;
		}
		else
		{
		return false;
		}
	}
	
	/*public int reduceprod(int proid,int quantity)
	{
		
		Session session=sessionFactory.openSession();
		 Query query2=session.createQuery("select quantity from Product where proid="+proid);
		int newqty=(int)query2.list().get(0)- prodqty;
		
		System.out.println(newqty);
		session.close();
		return newqty;
	}*/

}
