package com.niit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String GotoHome(HttpSession session) {

		boolean loggedin=false;
		session.setAttribute("loggedin",loggedin);
		System.out.println("Loggedin");
		
		return "Home";
	}

	@RequestMapping("/Home")
	public String gotoHome() {
		
		
		return "Home";
	}
	@RequestMapping("/Login")
	public String GotoLoginPage() {
		return "Login";
	}
	/*@RequestMapping("/LogOut")
	public String GotoLogoutPage() {
		return "Login";
	}*/
	@RequestMapping("/ThankPage")
	public String GotoThankPage() {
		return "ThankPage";
	}

	@RequestMapping("/Success")
	public String GotoLoginSuccessPage() {
		return "Success";
	}

	@RequestMapping("/ContactUs")
	public String GotoContactPage() {
		return "ContactUs";
	}
	
	@RequestMapping("/AboutUs")
	public String GotoAboutPage() {
		return "AboutUs";
	}

	@RequestMapping("/Footer")
	public String GotoFooterPage() {
		return "Footer";
	}


	
}

