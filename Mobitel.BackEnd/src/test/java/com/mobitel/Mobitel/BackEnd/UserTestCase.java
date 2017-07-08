package com.mobitel.Mobitel.BackEnd;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mobitel.Mobitel.BackEnd.dao.UserDAO;
import com.mobitel.Mobitel.BackEnd.model.User;

public class UserTestCase {
	public static void main(String arg[])

	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

		context.scan("com.mobitel.Mobitel.BackEnd");

		context.refresh();

		// Inserting a User Object.
		UserDAO userDAO = (UserDAO) context.getBean("userDAO");

		// Insertion TestCase

		User user = new User();
		System.out.println("Inserting value ...");
		user.setUsername("suvarna");
		user.setPassword("suvarna");
		user.setAddr("Pune");
		user.setCustName("Suvarna Koli");
		
		user.setRole("Role_Admin");
		user.setEmail("suarnakoli@gmail.com");
		user.setEnabled(true);
		user.setMobile("8411878524");
		userDAO.insertUpdateUser(user);
		System.out.println("User Inserted");

		userDAO.insertUpdateUser(user);
		System.out.println("User Inserted");

		// Retrieval TestCase

		/*
		 * User user=userDAO.getUser(2);
		 * System.out.println("User Name:"+user.getCatname());
		 * System.out.println("User Description:"+user.getCatdesc());
		 * 
		 */ // Deletion TestCase
		/*
		 * User user=userDAO.getUser(1); userDAO.deleteUser(user);
		 * System.out.println("The User Deleted");
		 */
		// Retrieving the Data
		/*
		 * List<User> list=userDAO.getUserDetails();
		 * 
		 * for(User user:list) {
		 * 
		 * System.out.println(user.getMobile()+":"+user.getRole()+":"+user.
		 * getUname()); }
		 */

		// Update the User
		/*
		 * User user=userDAO.getUser(1); user.setCatname("WifiEnMobile");
		 * userDAO.insertUpdateUser(user);
		 * System.out.println("The User Updated");
		 */
	}
}
