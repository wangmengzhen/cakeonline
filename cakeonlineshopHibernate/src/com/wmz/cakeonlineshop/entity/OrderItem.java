package com.wmz.cakeonlineshop.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 订单详情类
 * @author lenovo
 *
 */
@Entity
@Table(name="tbl_orderdetail")
public class OrderItem {
	private int id;
	private Order order;
	private Cake cake;
	private int qty;//蛋糕数量
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * 订单和订单详情的多对一
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name="orderid")
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	/**
	 * orderItem和cake一对一关系
	 * @return
	 */
	@ManyToOne
	@JoinColumn(name="cakeid")
	public Cake getCake() {
		return cake;
	}
	public void setCake(Cake cake) {
		this.cake = cake;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
		
	
	
}
