package com.wmz.cakeonlineshop.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_order")
public class Order {
	private int orderId;
	private Timestamp orderTime;
	private User user;
	private Set<OrderItem> orderItems=new HashSet<OrderItem>();
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}	
	public Timestamp getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}
	/**
	 * 订单和用户的多对一映射，通过查找订单可以查到用户
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name="email")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	/**
	 * 订单和订单详情的一对多映射，通过订单可以查询到蛋糕的集合
	 * @return
	 */
	@OneToMany(mappedBy="order",targetEntity=OrderItem.class,cascade= {CascadeType.ALL})
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
}
