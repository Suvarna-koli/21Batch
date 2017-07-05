package com.niit.controller;
import java.io.BufferedOutputStream;


import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mobitel.Mobitel.BackEnd.dao.*;
import com.mobitel.Mobitel.BackEnd.model.*;

@Controller
public class ProductController 
{
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SupplierDAO supplierDAO;

	
	
	@RequestMapping(value="/Product")
	public String showProduct(Model m)
	{
		
		
		Product product=new Product();
		
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		m.addAttribute("product",product);
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		
		return "Product";
	}
		
	@RequestMapping(value="/AddProduct")
	public String insertProduct(@ModelAttribute("product") Product product,Model m,
			@RequestParam("pimg") MultipartFile filedet,BindingResult result)
	{
		
	System.out.println("Image uploading...");
		String path="F:\\ShriniwasBatch\\ElectroBuggy\\src\\main\\webapp\\resources\\productImg\\";
		
		String idpath=productDAO.getProdcutId()+".jpg";
		String fileinfo=path+idpath;
		System.out.println("---Product Inserted---");
		
		File f=new File(fileinfo);
		if(!filedet.isEmpty())
		{
			try {

				byte buff[]=filedet.getBytes();
				FileOutputStream fos=new FileOutputStream(f);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buff);
			bs.close();
			fos.close();
			String imgpath="resources/productImg/"+idpath;
			product.setImgpath(imgpath);
			productDAO.insertUpdateProduct(product);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
		else
		{
			System.out.println("File is empty...please a select the file");
		}
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "redirect:/Product";
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
		boolean flag=true;
		m.addAttribute("flag",flag);
		
		
		return "redirect:/Product";
	}
	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
	public String updateProduct(@RequestParam("proid") int proid,@RequestParam("proname") String proname,@RequestParam("prodesc") String prodesc,Model m)
	{
		System.out.println("--Updating the Product----");

		Product product=new Product();
		product.setProid(proid);
	product.setProname(proname);
	product.setProdesc(prodesc);
		productDAO.insertUpdateProduct(product);
		
		List<Product> list=productDAO.getProductDetails();
		m.addAttribute("prodetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "Product";
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
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		
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
