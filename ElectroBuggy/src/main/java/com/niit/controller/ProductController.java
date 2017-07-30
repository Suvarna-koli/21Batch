package com.niit.controller;
import java.io.BufferedOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value="/ProductPage")
	public String gotoDisplayPage(Model m)
	{
		List<Product> prolist=productDAO.getProductDetails();
		m.addAttribute("prolist",prolist);
		return "/ProductPage";
	}
	@RequestMapping(value="/ProDescription/{proid}")
	public String gotoDescriptionPage(@PathVariable("proid")int proid,Model m)
	{
		Product product=productDAO.getProduct(proid);
		m.addAttribute("proInfo", product);
		return "ProDescription";
	}
	@RequestMapping(value="/CategoryWise/{catid}")
	public String gotoCatWisePage(@PathVariable("catid")int catid,Model m)
	{
		List<Product> product=productDAO.getProductDetailsByCatId(catid);
		m.addAttribute("prolist", product);
		
		List<Category> category=categoryDAO.getCategoryDetails();
		m.addAttribute("catlist",category);
		return "CategoryWise";
	}
	
	@RequestMapping(value="/Product")
	public String showProduct(Model m)
	{
		
		
		Product product=new Product();
		m.addAttribute("product", product);
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		
		return "Product";
	}
		
	@RequestMapping(value="/AddProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product") Product product,Model m,
			@RequestParam("pimg") MultipartFile filedet)
	{
	 System.out.println("In Add function");
		
	System.out.println("Image uploading...");

	
		String path="F:\\ShriniwasBatch\\ElectroBuggy\\src\\main\\webapp\\resources\\productImg\\";
	
		String idpath=productDAO.getProdcutId()+".jpg";
		
		System.out.println(productDAO.getProdcutId());
		
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

			
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		System.out.println("Product uploaded");
		
		return "redirect:/Product";
	}
	
	
	@RequestMapping(value="/updateProduct/{proid}")
	public String updateProduct(@PathVariable("proid")int proid,Model m)
	{
		
		Product product=productDAO.getProduct(proid);
		m.addAttribute("product",product);
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		boolean flag=true;
		m.addAttribute("flag",flag);
		
		
		return "Product";
	}
	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product") Product product,Model m)
	{
		System.out.println("--Updating the Product----");
		productDAO.insertUpdateProduct(product);
		
		m.addAttribute("product",new Product().getProid());
		m.addAttribute("catlist",this.getCatList());
		m.addAttribute("suplist",this.getSupList());
		
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		
		return "redirect:/Product";
		
	}
	
	@RequestMapping(value="/deleteProduct/{proid}")
	public String deleteProduct(@PathVariable("proid")int proid,Model m)
	{
		
		Product product=productDAO.getProduct(proid);
		productDAO.deleteProduct(product);
		
		Product product1=new Product();
		m.addAttribute("product",product1);
		m.addAttribute("catlist",this.getCatList());

		m.addAttribute("suplist",this.getSupList());
		List<Product> prodlist=productDAO.getProductDetails();
		m.addAttribute("prodlist",prodlist);
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		
		return "redirect:/Product";
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
