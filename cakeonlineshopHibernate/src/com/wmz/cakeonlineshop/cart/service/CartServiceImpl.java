package com.wmz.cakeonlineshop.cart.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.Cart;
import com.wmz.cakeonlineshop.entity.CartItem;

@Service
@Transactional(readOnly=true)
public class CartServiceImpl {
	
	/**
	 * 向购物车里添加蛋糕
	 * @param cart
	 * @param cake
	 * @param sqty
	 */
	public void add(Cart cart,Cake cake,String sqty) {
		int qty=0;
		if(sqty!=null&&!(sqty.equals(""))) {
			qty=Integer.parseInt(sqty);
		}
		if(cart.getContainer().containsKey(cake.getId())==true) {//购物车里有这个蛋糕
			int count=cart.getContainer().get(cake.getId()).getQty()+qty;
			cart.getContainer().get(cake.getId()).setQty(count);
		}else {//购物车里没有这个蛋糕
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			CartItem cartItem=new CartItem();
			cartItem.setCake(cake);
			cartItem.setQty(qty);
			cartItem.setTime(df.format(new Date()));
			cart.getContainer().put(cake.getId(), cartItem);
		}
	}
	
	/**
	 * 改变购物车里蛋糕的数量
	 * @param cart
	 * @param cake
	 * @param sqty
	 */
	public void change(Cart cart,Cake cake,String sqty) {
		int qty=0;
		if(sqty!=null&&!(sqty.equals(""))) {
			qty=Integer.parseInt(sqty);
		}
		if(cart.getContainer().containsKey(cake.getId())==true) {
			cart.getContainer().get(cake.getId()).setQty(qty);
		}else {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			CartItem cartItem=new CartItem();
			cartItem.setCake(cake);
			cartItem.setQty(qty);
			cartItem.setTime(df.format(new Date()));
			cart.getContainer().put(cake.getId(), cartItem);
		}
	}
	
}
