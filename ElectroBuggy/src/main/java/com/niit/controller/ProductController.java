package com.niit.controller;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mobitel.Mobitel.BackEnd.dao.CategoryDAO;
import com.mobitel.Mobitel.BackEnd.dao.ProductDAO;
import com.mobitel.Mobitel.BackEnd.dao.SupplierDAO;
import com.mobitel.Mobitel.BackEnd.model.Category;
import com.mobitel.Mobitel.BackEnd.model.Product;
import com.mobitel.Mobitel.BackEnd.model.Supplier;

@Controller
public class ProductController 
{
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	
	@RequestMapping("/Product")
	public String showProduct(Model m)
	{
		
		
		Product product=new Product();
		
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		m.addAttribute("product",product);
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		
		return "Product";
	}
	
	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product") Product product,Model m)
	{
		System.out.println("---Product Inserted---");
		productDAO.insertUpdateProduct(product);	
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		return "Product";
	}
	
	@RequestMapping(value="/updateProduct/{prodid}")
	public String updateProduct(@PathVariable("prodid")int prodid,Model m)
	{
		
		Product product=productDAO.getProduct(prodid);
		m.addAttribute("product",product);
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		return "redirect:/Product";
	}
	
	@RequestMapping(value="/deleteProduct/{prodid}")
	public String deleteProduct(@PathVariable("prodid")int prodid,Model m)
	{
		
		Product product=productDAO.getProduct(prodid);
		productDAO.deleteProduct(product);
		
		Product product1=new Product();
		m.addAttribute("product",product1);
		m.addAttribute("catlist",this.getCatList());

		m.addAttribute("suplist",this.getSupList());
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> getCatList()
	{
		List<Category> list=categoryDAO.getCategoryDetails();
		
		LinkedHashMap<Integer,String> catlist=new LinkedHashMap<Integer,String>();
		
		for(Category cat:list)
		{
			catlist.put(cat.getCatid(),cat.getCatname());
		}
		
		return catlist;
	}

	public LinkedHashMap<Integer,String> getSupList()
	{
		List<Supplier> list=supplierDAO.getSupplierDetails();
		
		LinkedHashMap<Integer,String> suplist=new LinkedHashMap<Integer,String>();
		
		for(Supplier sup:list)
		{
			suplist.put(sup.getSupid(),sup.getSupname());
		}
		
		return suplist;
	}
	
	
	
}
