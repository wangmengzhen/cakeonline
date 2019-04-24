package com.wmz.cakeonlineshop.order.service;

import java.sql.Timestamp;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.Cart;
import com.wmz.cakeonlineshop.entity.CartItem;
import com.wmz.cakeonlineshop.entity.Order;
import com.wmz.cakeonlineshop.entity.OrderItem;
import com.wmz.cakeonlineshop.order.dao.OrderDaoImpl;
import com.wmz.cakeonlineshop.user.dao.UserDaoImpl;

@Service
@Transactional(readOnly=false)
public class OrderServiceImpl {
	@Resource 
	private OrderDaoImpl orderDaoImpl;
	@Resource
	private UserDaoImpl userDaoImpl;
	
	/**
	 * 向order表中插入数据，并级联插入到tbl_orderdetail表
	 * @param cart
	 * @param order
	 * @param email
	 */
	public void addOrder(Cart cart,Order order,String email) {
		java.util.Date date = new java.util.Date();          // 获取一个Date对象
        Timestamp timeStamp = new Timestamp(date.getTime());     //   讲日期时间转换为数据库中的timestamp类型
		order.setOrderTime(timeStamp);
		order.setUser(userDaoImpl.entityFindByEmail(email));
		
		Set<OrderItem> orderItems=order.getOrderItems();
		for (CartItem cartItem : cart.getContainer().values()) {//遍历cartItem将数据插入到orderItem中
			OrderItem orderItem=new OrderItem();
			Cake cake=cartItem.getCake();
			int qty=cartItem.getQty();
			
			orderItem.setOrder(order);
			orderItem.setCake(cake);
			orderItem.setQty(qty);
			orderItems.add(orderItem);
		}	
		order.setOrderItems(orderItems);
		orderDaoImpl.insertOrder(order);
	}
}
