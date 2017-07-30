package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.*;
import com.mobitel.Mobitel.BackEnd.model.*;

@Controller
public class CategoryController 
{
	
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@RequestMapping("/Category")
	public String showCategoryPage(Model m)
	{
		System.out.println("---Category Page Displaying-----");
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "Category";
	}
	
	@RequestMapping(value="/AddCategory",method=RequestMethod.POST)
	public String addCategory(@RequestParam("catname") String catname,@RequestParam("catdesc") String catdesc,Model m,HttpSession session)
	{
		System.out.println("---Add Category Starting-----");
		System.out.println(catname+":::"+catdesc);
		
		Category category=new Category();
		category.setCatname(catname);
		category.setCatdesc(catdesc);
		
		categoryDAO.insertUpdateCategory(category);
		
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);

		System.out.println("---Category Added----");
		return "redirect:/Category";
	}
	
	@RequestMapping(value="/deleteCategory/{catid}")
	public String deleteCategory(@PathVariable("catid") int catid,Model m)
	{
		System.out.println("---Category Deleted----");
		boolean flag1=true;
		Category category=categoryDAO.getCategory(catid);
		List<Product>list1=productDAO.getProductDetailsByCatId(catid);
		for(Product product:list1)
		if(productDAO.checkproductid(product.getProid()))
		{
			flag1=true;
		}
		else
		{
			flag1=false;
		}
		if(flag1)
		{
		categoryDAO.deleteCategory(category);
		}
		else
		{
			System.out.println("Can not delete the category");
			m.addAttribute("flag1",flag1);
		}
		Category category1=new Category();
		m.addAttribute("category", category1);
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "redirect:/Category";
	}
	
	@RequestMapping(value="/updateCategory/{catid}")
	public String getUpdateCategory(@PathVariable("catid") int catid,Model m)
	{
		System.out.println("--- Getting Category Object to be Updated ---");
		
		Category category=categoryDAO.getCategory(catid);
		m.addAttribute("category",category);
		
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catdetail",list);
		
		boolean flag=true;
		m.addAttribute("flag",flag);

	//categoryDAO.insertUpdateCategory(category);
		return "/Category";
	}
	
	
	@RequestMapping(value="/UpdateCategory",method=RequestMethod.POST)
	public String updateCategory(@RequestParam("catid") int catid,@RequestParam("catname") String catname,@RequestParam("catdesc") String catdesc,Model m)
	{
		System.out.println("--Updating the Category----");

		Category category=new Category();
		category.setCatid(catid);
		category.setCatname(catname);
		category.setCatdesc(catdesc);
		
		categoryDAO.insertUpdateCategory(category);
		
		List<Category> list=categoryDAO.getCategoryDetails();
		m.addAttribute("catdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "redirect:/Category";
	}
	
	
}