package com.wmz.cakeonlineshop.entity;

import java.util.HashMap;

public class Cart {//购物车
	private HashMap<Integer,CartItem> container=new HashMap<Integer,CartItem>();//HashMap,key为蛋糕id，value为CartItem类对象

	public HashMap<Integer, CartItem> getContainer() {
		return container;
	}

	public void setContainer(HashMap<Integer, CartItem> container) {
		this.container = container;
	}
}
