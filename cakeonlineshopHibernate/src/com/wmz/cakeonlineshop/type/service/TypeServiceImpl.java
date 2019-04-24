package com.wmz.cakeonlineshop.type.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wmz.cakeonlineshop.entity.CakeType;
import com.wmz.cakeonlineshop.type.dao.TypeDaoImpl;

@Service
@Transactional(readOnly=true)
public class TypeServiceImpl {
	
	@Resource
	private TypeDaoImpl typeDaoImpl;
	/**
	 * 查找全部类型的蛋糕
	 * @return
	 */
	public List<CakeType> list(){
		return typeDaoImpl.findAll();
	}

}
