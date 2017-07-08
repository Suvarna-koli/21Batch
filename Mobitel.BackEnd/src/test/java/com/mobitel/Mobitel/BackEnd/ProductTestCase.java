package com.mobitel.Mobitel.BackEnd;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mobitel.Mobitel.BackEnd.dao.ProductDAO;
import com.mobitel.Mobitel.BackEnd.model.Product;

public class ProductTestCase {

	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

		context.scan("com.mobitel.Mobitel.BackEnd");

		context.refresh();

		// Inserting a Product Object.
		ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");

		// Insertion TestCase
		
		Product product = new Product();

		product.setProname("Omega SA");
		product.setProdesc("Omega SA Men's Large Dual Dial Analog Digital Quartz lectronic Sport Watch");
		product.setPrice(2399);
		product.setQuantity(25);
	product.setSupid(1);
		product.setCatid(1);
		productDAO.insertUpdateProduct(product);
		System.out.println("Product Inserted");


/*		product.setProname("Apson");
		product.setProdesc("Aposon Men's Large Dual Dial Analog Digital Quartz lectronic Sport Watch");
		product.setPrice(2399);
		product.setQuantity(25);
	product.setSupid(2);
		product.setCatid(2);
		productDAO.insertUpdateProduct(product);
		System.out.println("Product Inserted");
*/
		// Retrieval TestCase

		/*
		 Product product=productDAO.getProduct(3);
		  System.out.println("Product Name:"+product.getProname());
		  System.out.println("Product Description:"+product.getProdesc());
		*/  
		  // Deletion TestCase
		/*
		 * Product product=productDAO.getProduct(2);
		 * productDAO.deleteProduct(product);
		 * System.out.println("The Product Deleted");
		 */

		// Retrieving the Data
		/*
		 * List<Product> list=productDAO.getProductDetails();
		 * 
		 * for(Product product:list) {
		 * 
		 * System.out.println(product.getproid()+":"+product.getproname()+":"+
		 * product.getprodesc()); }
		 */
		// Update the Product
		
	/*	  Product product=productDAO.getProduct(3);
		  product.setProname("Casio Edifice");
		  productDAO.insertUpdateProduct(product);
		  System.out.println("The Product Updated");
	*/	 
	}
}
