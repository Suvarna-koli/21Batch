package com.niit.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobitel.Mobitel.BackEnd.dao.UserDAO;
import com.mobitel.Mobitel.BackEnd.model.User;

@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;

	
	@RequestMapping("/Registration")
	public String GotoRegisterPage() {
		return "Registration";
	}

	@RequestMapping(value="/SignUp",method=RequestMethod.POST)
	public String addUser(@RequestParam("uname") String uname,
			@RequestParam("CustName") String CustName,
			@RequestParam("email") String email,
			@RequestParam("Upswd") String Upswd,
			@RequestParam("Addr") String Addr,
			@RequestParam("Mobile") String Mobile,
			Model m)
	{
		System.out.println("---Add Category Starting-----");
		
		User user=new User();
		user.setCustName(CustName);
		user.setAddr(Addr);
		user.setEmail(email);
	user.setMobile(Mobile);
	user.setUname("suvarnaaa");
	user.setUpswd(Upswd);
	
	userDAO.insertUpdateUser(user);	
		
		List<User> list=userDAO.getUserDetails();
		m.addAttribute("UserDetail", list);
		
		System.out.println("---User Added----");
		return "Registration";
	}
	
}
