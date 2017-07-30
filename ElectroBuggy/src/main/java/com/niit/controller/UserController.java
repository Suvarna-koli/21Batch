package com.niit.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String GotoRegisterPage(Model m) {
		m.addAttribute("user", new User());
		return "Registration";
	}

	
	@RequestMapping(value = "/User")
	public String GotoUserPage() { 
		return "User";
	}
	@RequestMapping(value = "/LogOut")
	public String GotoLogOutPage(HttpSession session,Model m) {
	
		boolean loggedin=(boolean)session.getAttribute("loggedin");
		if(loggedin)
		{
			loggedin=false;
			session.setAttribute("loggedin", loggedin);
		}
		return "Login";
	}
	@RequestMapping(value = "/getPassword")
	public String GotoGetPasswordPage() {
		return "getPassword";
	}

	@RequestMapping("/login_success")
	public String loginsuccess(HttpSession session,Model m) {
		System.out.println("loded successfully");
		boolean loggedin = true;
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("username", username);
		session.setAttribute("loggedin", loggedin);
		System.out.println(username);
		@SuppressWarnings("unchecked")
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities();
		for (GrantedAuthority Role : authorities) {
			System.out.println("Role:" + Role.getAuthority() + "username" + username);
			 String srole=Role.getAuthority();
			  session.setAttribute("srole",srole);
						if (Role.getAuthority().equals("ROLE_ADMIN")) {
				
				return "Admin";
			} else {
				Product<MultipartFile> product=new Product<MultipartFile>();
				List<Product> prolist=productDAO.getProductDetails();
				m.addAttribute("prolist",prolist);
				
				Category category=new Category();
				List<Category> catlist=categoryDAO.getCategoryDetails();
				m.addAttribute("catlist",catlist);
				
				
				return "User";
			}
		}
		return "Failure";
	}


	
	
	@RequestMapping(value = "/SignUp")
	
	public String adduser(@Valid @ModelAttribute("user") User user,BindingResult result)
	{
		if(result.hasErrors())
		{
			return "Registration";
		}
		userDAO.insertUpdateUser(user);
		

		return "Login";
	}

}
