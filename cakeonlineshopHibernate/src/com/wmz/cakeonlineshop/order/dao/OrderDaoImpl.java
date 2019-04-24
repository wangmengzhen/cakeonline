package com.wmz.cakeonlineshop.order.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.wmz.cakeonlineshop.entity.Order;

@Repository
public class OrderDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * 将order存入到数据库中
	 * @param order
	 */
	public void insertOrder(Order order) {
		Session session=sessionFactory.getCurrentSession();
		session.save(order);
	}
}
