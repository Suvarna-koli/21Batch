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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mobitel.Mobitel.BackEnd.dao.CategoryDAO;
import com.mobitel.Mobitel.BackEnd.dao.ProductDAO;
import com.mobitel.Mobitel.BackEnd.dao.UserDAO;
import com.mobitel.Mobitel.BackEnd.model.Category;
import com.mobitel.Mobitel.BackEnd.model.Product;
import com.mobitel.Mobitel.BackEnd.model.User;

@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value = "/Registration")
	public String GotoRegisterPage() {
		return "Registration";
	}

	@RequestMapping(value = "/User")
	public String GotoUserPage() {
		return "User";
	}

	@RequestMapping("/login_success")
	public String loginsuccess(HttpSession session,Model m) {
		System.out.println("loded successfully");
		boolean loggedIn = true;
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("username", username);
		session.setAttribute("loggedIn", loggedIn);
		System.out.println(username);
		@SuppressWarnings("unchecked")
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		for (GrantedAuthority Role : authorities) {
			System.out.println("Role:" + Role.getAuthority() + "username" + username);

			if (Role.getAuthority().equals("ROLE_ADMIN")) {

				return "Admin";
			} else {
				Product<MultipartFile> product=new Product<MultipartFile>();
				List<Product> prolist=productDAO.getProductDetails();
				m.addAttribute("prolist",prolist);
				return "User";
			}
		}
		return "Home";
	}
	
	@RequestMapping(value="/CategoryWise/{catid}")
	public String gotoCategoryWisePage(@RequestParam("catid") int catid,Model m)
	{
		Category category=categoryDAO.getCategory(catid);
		List<Product> list=productDAO.getProductDetailsByCatId(catid);
		m.addAttribute("prolist", list);
		
		return "CategoryWise";
	}

	@RequestMapping(value = "/SignUp")
	public String addUser(@RequestParam("username") String username, @RequestParam("CustName") String CustName,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("Addr") String Addr, @RequestParam("Mobile") String Mobile, Model m) {
		System.out.println("---Add Category Starting-----");

		User user = new User();
		user.setCustName(CustName);
		user.setAddr(Addr);
		user.setEmail(email);
		user.setMobile(Mobile);
		user.setUsername(username);
		user.setPassword(password);

		userDAO.insertUpdateUser(user);

		List<User> list = userDAO.getUserDetails();
		m.addAttribute("UserDetail", list);

		System.out.println("---User Added----");
		return "Registration";
	}

}
