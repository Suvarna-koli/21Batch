package com.niit.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.SupplierDAO;
import com.mobitel.Mobitel.BackEnd.model.Supplier;

@Controller
public class SupplierController 
{
	
	
	@Autowired
	SupplierDAO supplierDAO;
	@RequestMapping(value="/Supplier")
	public String showSupplierPage(Model m)
	{
		System.out.println("---Supplier Page Displaying-----");
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addAttribute("supdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/AddSupplier",method=RequestMethod.POST)
	public String addSupplier(@RequestParam("supname") String supname,@RequestParam("supaddr") String supaddr,Model m)
	{
		System.out.println("---Add Supplier Starting-----");
		
		System.out.println(supname+":::"+supaddr);
		
		Supplier supplier=new Supplier();
		supplier.setSupname(supname);
		supplier.setSupaddr(supaddr);
		
		supplierDAO.insertUpdateSupplier(supplier);
		
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addAttribute("supdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		System.out.println("---Supplier Added----");
		return "redirect:/Supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supid}")
	public String deleteSupplier(@PathVariable("supid") int supid,Model m)
	{
		System.out.println("---Supplier Deleted----");
		Supplier supplier=supplierDAO.getSupplier(supid);
		supplierDAO.deleteSupplier(supplier);
		
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addAttribute("supdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "redirect:/Supplier";
	}
	
	@RequestMapping(value="/updateSupplier/{supid}")
	public String getUpdateSupplier(@PathVariable("supid") int supid,Model m)
	{
		System.out.println("--- Getting Supplier Object to be Updated ---");
		
		Supplier supplier=supplierDAO.getSupplier(supid);
		m.addAttribute("supplier",supplier);
		
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addAttribute("supdetail",list);
		
		boolean flag=true;
		m.addAttribute("flag",flag);
		
		return "Supplier";
	}
	
	@RequestMapping(value="/UpdateSupplier",method=RequestMethod.POST)
	public String updateSupplier(@RequestParam("supid") int supid,@RequestParam("supname") String supname,@RequestParam("supaddr") String supaddr,Model m)
	{
		System.out.println("--Updating the Supplier----");

		Supplier supplier=new Supplier();
		supplier.setSupid(supid);
		supplier.setSupname(supname);
		supplier.setSupaddr(supaddr);
		
		supplierDAO.insertUpdateSupplier(supplier);
		
		List<Supplier> list=supplierDAO.getSupplierDetails();
		m.addAttribute("supdetail",list);
		
		boolean flag=false;
		m.addAttribute("flag",flag);
		
		return "redirect:/Supplier";
	}
	
	
}