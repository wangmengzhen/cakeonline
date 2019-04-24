package com.wmz.cakeonlineshop.cake.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.wmz.cakeonlineshop.entity.Cake;

@Repository
public class CakeDaoImpl {

	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 按照蛋糕星级及给定数量查询
	 * 
	 * @param starlevel
	 *            蛋糕星级
	 * @param first
	 *            第一个
	 * @param num
	 *            数量
	 * @return
	 */
	public List<Cake> findCakeByStarlevel(int starlevel,int start,int num) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cake c where c.starlevel=?0");
		query.setParameter(0, starlevel);
		query.setFirstResult(start);
		query.setMaxResults(num);
		List<Cake> list = query.list();
		System.out.println(list.get(0).getName());
		return list;
	}

	/**
	 * 查询销量最高的前8个蛋糕
	 * 
	 * @return
	 */
	 public List<Object[]> findCakeBySale(){
	 Session session=sessionFactory.getCurrentSession();
	 Query query=session.createQuery("select oi.cake,sum(oi.qty) from OrderItem oi group by oi.cake order by sum(oi.qty) desc");
	 query.setFirstResult(0);
	 query.setMaxResults(8);
	 List<Object[]> list=query.list();
	 return list;
	 }

	/**
	 * 按蛋糕类型查找,此时关键字为空
	 */
	public List<Cake> findCakeByType(int typeid, int pageNum, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select ct.cakes from CakeType ct where ct.id=?0");
		query.setParameter(0, typeid);
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * 按蛋糕类型查找蛋糕数量,此时关键字为空
	 */
	public int countCakeByType(int typeid) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select ct.cakes from CakeType ct where ct.id=?0");
		query.setParameter(0, typeid);
		return query.list().size();
	}

	/**
	 * 通过关键字查询，type为空，
	 * 
	 * @param key
	 * @param pageNum
	 * @param pageSize
	 * @return 蛋糕集合
	 */
	public List<Cake> findCakeByKey(String key, int pageNum, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cake cake where cake.name like ?0");
		query.setParameter(0, "%" + key + "%");
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * 通过关键字查询蛋糕数量，type为空
	 * 
	 * @param key
	 * @param pageNum
	 * @param pageSize
	 * @return 蛋糕的数量
	 */
	public int countCakeByKey(String key) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cake cake where cake.name like ?0");
		query.setParameter(0, "%" + key + "%");
		return query.list().size();
	}
	
	/**
	 * 通过id查询蛋糕
	 * @param id
	 * @return
	 */
	public Cake findById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cake c where c.id=?0");
		query.setParameter(0, id);
		Cake cake = (Cake)query.uniqueResult();
		return cake;
	}


}
