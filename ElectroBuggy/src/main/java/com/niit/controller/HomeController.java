package com.niit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String GotoHome() {
		return "Home";
	}

	@RequestMapping("/Home")
	public String gotoHome(HttpSession session) {
session.setAttribute("loggedin", true);
System.out.println("Loggedin");
		return "Home";
	}
	@RequestMapping("/Login")
	public String GotoLoginPage() {
		return "Login";
	}
	

	@RequestMapping("/Success")
	public String GotoLoginSuccessPage() {
		return "Success";
	}

	@RequestMapping("/ContactUs")
	public String GotoContactPage() {
		return "ContactUs";
	}

	@RequestMapping("/Footer")
	public String GotoFooterPage() {
		return "Footer";
	}


	
}

