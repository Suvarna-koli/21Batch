package com.mobitel.Mobitel.BackEnd.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Supplier {
	@Id
	@GeneratedValue
	int supid;
	
	String supname,supaddr;

	public int getSupid() {
		return supid;
	}

	public void setSupid(int supid) {
		this.supid = supid;
	}

	public String getSupname() {
		return supname;
	}

	public void setSupname(String supname) {
		this.supname = supname;
	}

	public String getSupaddr() {
		return supaddr;
	}

	public void setSupaddr(String supaddr) {
		this.supaddr = supaddr;
	}

}
