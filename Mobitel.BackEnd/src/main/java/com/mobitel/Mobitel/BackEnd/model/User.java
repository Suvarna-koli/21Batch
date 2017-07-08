package com.mobitel.Mobitel.BackEnd.model;

import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class User {

	@Id
	String username;
	
	boolean enabled;
	String email,CustName,password,role,Mobile,Addr;

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
