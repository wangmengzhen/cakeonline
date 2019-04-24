package com.wmz.cakeonlineshop.user.dao;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;


import com.wmz.cakeonlineshop.entity.User;

@Repository
public class UserDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * 将user存入到数据库中
	 * @param user
	 */
	public void insertUser(User user) {
		Session session=sessionFactory.getCurrentSession();
		session.save(user);
	}
	
	/**
	 * 判断数据库中有无该用户的email
	 * @param email
	 * @return
	 */
	public Boolean findByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		User u=session.get(User.class, email);
		if(u!=null) {
			return true;
		}
		return false;			
	}
	
	/**
	 * 判断数据库中有无该用户的email,并返回user
	 * @param email
	 * @return User
	 */
	public User entityFindByEmail(String email) {//
		Session session = sessionFactory.getCurrentSession();
		User u=session.get(User.class, email);
		return u;		
	}
	
	/**
	 * 登录时，根据email和password去数据库中查找有无该用户
	 * @param email
	 * @param password
	 * @return
	 */
	public Boolean findByEmailPsd(String email,String password) {
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("from User u where u.email=?0 and u.password=?1");
		q.setParameter(0, email);
		q.setParameter(1, password);
		if(q.list().size()!=0) {
			return true;
		}
		return false;
	}
}
