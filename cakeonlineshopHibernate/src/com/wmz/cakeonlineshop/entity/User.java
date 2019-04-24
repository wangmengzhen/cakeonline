package com.wmz.cakeonlineshop.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
/*
 * 用户类
 */

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_user")
/**
 * 用户类
 * @author lenovo
 *
 */
public class User {
	private String email;
	private String name;
	private String address;
	private String phone;
	private String password;
	private Timestamp registertime;
	private Set<Order> orders=new HashSet<Order>();
	
	
	@Id
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Timestamp registertime) {
		this.registertime = registertime;
	}
	
	/**
	 * 用户和订单的一对多映射
	 * @return
	 */
	@OneToMany(mappedBy="user",targetEntity=Order.class,cascade=CascadeType.ALL)
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}
