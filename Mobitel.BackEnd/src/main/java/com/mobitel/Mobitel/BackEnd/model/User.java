package com.mobitel.Mobitel.BackEnd.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table
public class User {
	@Id
	@NotEmpty
	@Length(min=5,max=10)
	String username;
	
	boolean enabled=true;
	@NotEmpty
	@Email
	String email;
	@NotEmpty
	String CustName;
	@NotEmpty
	@Length(min=5,max=10)
	String password;
	String role="ROLE_USER";
	@NotEmpty
	@Length(min=10,max=10)
	String Mobile;
	@NotEmpty
	String Addr;

	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCustName() {
		return CustName;
	}
	public void setCustName(String custName) {
		this.CustName = custName;
	}
	
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		this.Mobile = mobile;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		this.Addr = addr;
	}
	
	
}

/*
package com.mobitel.Mobitel.BackEnd.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

@Entity
@Table
public class User {
	@Id
	String username;
	
	boolean enabled;
	@Email
	String email;
	
	String CustName;
	@Length(min=5, max=10, message="Password should be between 5 - 10 characters or number")
	String password;
	String role;
	@Length(min=10, max=10, message="Mobile No should be  10")
	String Mobile;
	String Addr;

	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCustName() {
		return CustName;
	}
	public void setCustName(String custName) {
		this.CustName = custName;
	}
	
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		this.Mobile = mobile;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		this.Addr = addr;
	}
	
	
}
*/