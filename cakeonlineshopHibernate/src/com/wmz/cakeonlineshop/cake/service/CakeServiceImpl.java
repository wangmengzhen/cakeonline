package com.wmz.cakeonlineshop.cake.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wmz.cakeonlineshop.cake.dao.CakeDaoImpl;
import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.Page;

@Service
@Transactional(readOnly=true)
public class CakeServiceImpl {
	
	@Resource
	private CakeDaoImpl cakeDaoImpl;
	
	/**
	 * 按蛋糕星级查询
	 * @param starlevel
	 * @return list
	 */
	public List<Cake> listByStarlevel(int starlevel,int start,int num){
		return cakeDaoImpl.findCakeByStarlevel(starlevel,start,num);
	}
	
	
	/**
	 * 按蛋糕销量查询前八个蛋糕
	 * @return
	 */
	public List<Object[]> listBySale(){
		return cakeDaoImpl.findCakeBySale();
	}
	/**
	 * 分页查询蛋糕
	 * @param typeid
	 * @param key
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public Page<Cake> listByTypeOrKey(String typeid,String key,String pageNum,int pageSize){
		int num=0;
		if(pageNum==null||pageNum.equals("")) {
			num=1;
		}else {
			num=Integer.parseInt(pageNum);
		}
		List<Cake> list=null;
		int count=0;
		if(typeid==null||typeid.equals("")) {
			if(key!=null&&!(key.equals(""))){//按关键字查询
				list=cakeDaoImpl.findCakeByKey(key, num, pageSize);
				count=cakeDaoImpl.countCakeByKey(key);
			}
		}else {
			if(key==null||key.equals("")) {//按蛋糕类型查询
				list=cakeDaoImpl.findCakeByType(Integer.parseInt(typeid), num, pageSize);
				count=cakeDaoImpl.countCakeByType(Integer.parseInt(typeid));
			}
		}
		Page<Cake> page=new Page<Cake>(pageSize,num);
		page.setList(list);
		page.setTotalCount(count);
		return page;
		
	}
	
	/**
	 * 通过蛋糕id查询蛋糕
	 * @param id
	 * @return
	 */
	public Cake listById(String id) {
		int xid=0;
		if(id!=null&&!(id.equals(""))) {
			xid=Integer.parseInt(id);
		}
		return cakeDaoImpl.findById(xid);
	}
}
