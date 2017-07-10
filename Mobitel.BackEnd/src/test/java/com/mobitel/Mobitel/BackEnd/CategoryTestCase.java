package com.mobitel.Mobitel.BackEnd;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mobitel.Mobitel.BackEnd.dao.CategoryDAO;
import com.mobitel.Mobitel.BackEnd.model.Category;



public class CategoryTestCase 
{
	public static void main(String arg[])
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		
		context.scan("com.mobitel.Mobitel.BackEnd");
		
		context.refresh();
		
		// Inserting a Category Object.
		CategoryDAO categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
		
		//Insertion TestCase
		
		Category category=new Category();
		
		category.setCatname("Kid's Wrist Watch");
		category.setCatdesc("In this Category we provide Kid's Digital Sports Watch,Quartz Analog Roman Numeral Watch Waterproof,Casual Fashion Wristwatch,Stainless Steel Case watch etc.");

		categoryDAO.insertUpdateCategory(category);		
		System.out.println("Category Inserted");
		
		//Retrieval TestCase
		
		/*Category category=categoryDAO.getCategory(2);
		System.out.println("Category Name:"+category.getCatname());
		System.out.println("Category Description:"+category.getCatdesc());
		*/
		//Deletion TestCase
		/*Category category=categoryDAO.getCategory(1);
		categoryDAO.deleteCategory(category);
		System.out.println("The Category Deleted");
		*/
		//Retrieving the Data
		
	/*	List<Category> list=categoryDAO.getCategoryDetails();
		
		for(Category category:list)
		{
	
			System.out.println(category.getCatid()+":"+category.getCatname()+":"+category.getCatdesc());
		}*/
		
		//Update the Category
		/*Category category=categoryDAO.getCategory(1);
		category.setCatname("WifiEnMobile");
		categoryDAO.insertUpdateCategory(category);
		System.out.println("The Category Updated");
		*/
	}
}



