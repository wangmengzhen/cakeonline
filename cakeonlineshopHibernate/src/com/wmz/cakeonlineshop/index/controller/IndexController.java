package com.wmz.cakeonlineshop.index.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wmz.cakeonlineshop.cake.service.CakeServiceImpl;
import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.CakeType;
import com.wmz.cakeonlineshop.type.service.TypeServiceImpl;

@Controller
public class IndexController {
	@Resource
	private TypeServiceImpl typeServiceImpl;
	@Resource
	private CakeServiceImpl cakeServiceImpl;
	
	/**
	 * 展示首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		List<CakeType> listforNav=typeServiceImpl.list();
		request.getServletContext().setAttribute("cakeTypes", listforNav);//显示导航条
		
		List<Cake> listforStarlevel=cakeServiceImpl.listByStarlevel(5,0,2);
		request.setAttribute("cakes5", listforStarlevel);//显示五星级蛋糕
		
		List<Object[]> listforSale=cakeServiceImpl.listBySale();
		request.setAttribute("cakes", listforSale);//展示销量前八的蛋糕
		return "index";
	}
}
