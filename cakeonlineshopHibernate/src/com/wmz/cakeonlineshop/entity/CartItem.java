package com.wmz.cakeonlineshop.entity;

public class CartItem {//包含蛋糕，蛋糕数量，加入购物车时间的购物车
	private Cake cake;
	private int qty;
	private String time;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
