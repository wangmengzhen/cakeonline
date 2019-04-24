package com.wmz.cakeonlineshop.type.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.wmz.cakeonlineshop.entity.CakeType;

@Repository
public class TypeDaoImpl {
	
	@Resource
	private SessionFactory sessionFactory;
	/** 
	 * 查找全部蛋糕类型
	 * @return List
	 */
	public List<CakeType> findAll(){
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("from CakeType ct where ct.parentType = null");
		return q.list();
	}	
}
