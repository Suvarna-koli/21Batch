package com.niit.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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

	@RequestMapping(value="/Registration")
	public String GotoRegisterPage() {
		return "Registration";
	}

	@RequestMapping("/login_success")
	public String loginsuccess(HttpSession session) {
		System.out.println("loded successfully");

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		session.setAttribute("uname", username);

		@SuppressWarnings("unchecked")
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		for (GrantedAuthority role : authorities) {
			System.out.println("Role:" + role.getAuthority() + "uname" + username);

			if (role.getAuthority().equals("Role_Admin")) {

				return "AdminHome";
			} else {
				return "ProductPage";
			}
		}
		return "Home";
	}

	@RequestMapping(value = "/SignUp")
	public String addUser(@RequestParam("uname") String uname, @RequestParam("CustName") String CustName,
			@RequestParam("email") String email, @RequestParam("Upswd") String Upswd, @RequestParam("Addr") String Addr,
			@RequestParam("Mobile") String Mobile, Model m) {
		System.out.println("---Add Category Starting-----");

		User user = new User();
		user.setCustName(CustName);
		user.setAddr(Addr);
		user.setEmail(email);
		user.setMobile(Mobile);
		user.setUname(uname);
		user.setUpswd(Upswd);

		userDAO.insertUpdateUser(user);

		List<User> list = userDAO.getUserDetails();
		m.addAttribute("UserDetail", list);

		System.out.println("---User Added----");
		return "Registration";
	}

}
