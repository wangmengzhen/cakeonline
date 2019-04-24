package com.wmz.cakeonlineshop.cake.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wmz.cakeonlineshop.cake.service.CakeServiceImpl;
import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.Page;
import com.wmz.cakeonlineshop.log.LogRating;

@Controller
public class CakeController {
	private static Logger logUser = LoggerFactory.getLogger(CakeController.class);
	@Resource 
	private CakeServiceImpl cakeServiceImpl;
	
	/**
	 * products页面分页展示产品（通过给定的查询条件展示）
	 * @param request
	 * @return
	 */
	@RequestMapping("/search")
	public String search(HttpServletRequest request) {
		String typeid=request.getParameter("typeid");
		String pageNum=request.getParameter("pageNum");
		String key=request.getParameter("key");
		Page<Cake> page=cakeServiceImpl.listByTypeOrKey(typeid, key, pageNum, 3);
		request.setAttribute("typeid", typeid);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("key", key);
		request.setAttribute("page", page);
		return "products";
	}
	
	/**
	 * 展示产品详情页
	 * @param request
	 * @return
	 */
	@RequestMapping("/single")
	public String single(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		
		String cakeid=request.getParameter("cakeid");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		logUser.info("------userid:"+email+"，cakeid:"+cakeid+"，now:"+df.format(new Date()));
		Cake cake=cakeServiceImpl.listById(cakeid);
		List<Cake> relatedcakes=cakeServiceImpl.listByStarlevel(4,0,4);
		request.setAttribute("cake", cake);
		request.setAttribute("related", relatedcakes);
		return "single";
	}
	

}
