package com.mobitel.Mobitel.BackEnd;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mobitel.Mobitel.BackEnd.dao.SupplierDAO;
import com.mobitel.Mobitel.BackEnd.model.Supplier;

public class SupplierTestCase 
{
	public static void main(String arg[])
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		
		context.scan("com.mobitel.Mobitel.BackEnd");
		
		context.refresh();
		
		// Inserting a Supplier Object.
		SupplierDAO supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
		
		//Insertion TestCase
		/*
		Supplier supplier=new Supplier();
		
		supplier.setSupname("SBK Supplier");
		supplier.setSupaddr("Pune");
		supplierDAO.insertUpdateSupplier(supplier);		
		System.out.println("Supplier Inserted");
		*/
		//Retrieval TestCase
		
	/*	Supplier supplier=supplierDAO.getSupplier(2);
		System.out.println("Supplier Name:"+supplier.getsupname());
		System.out.println("Supplier Description:"+supplier.getsupdesc());
		
	*/	//Deletion TestCase
		/*Supplier supplier=supplierDAO.getSupplier(2);
		supplierDAO.deleteSupplier(supplier);
		System.out.println("The Supplier Deleted");*/
		
		//Retrieving the Data
		/*
		List<Supplier> list=supplierDAO.getSupplierDetails();
		
		for(Supplier supplier:list)
		{
	
			System.out.println(supplier.getCatid()+":"+supplier.getCatname()+":"+supplier.getCatdesc());
		}
	*/	
		//Update the Supplier
		/*Supplier supplier=supplierDAO.getSupplier(1);
		supplier.setSupname("SBK Supplier");
		supplierDAO.insertUpdateSupplier(supplier);
		System.out.println("The Supplier Updated");
		*/
	}
}



