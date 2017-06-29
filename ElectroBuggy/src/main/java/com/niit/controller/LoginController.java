package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@RequestMapping("/login")
	public String gotoLogin(@RequestParam("uname") String uname,@RequestParam("passwd") String passwd)
	{
		if(uname.equals("suvarna") && passwd.equals("suvarna"))
	
		{
			return "Admin";
					
		}
		else
		{
			return"Failure";
		}
	}
}
