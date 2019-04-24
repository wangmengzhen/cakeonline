package com.wmz.cakeonlineshop.order.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wmz.cakeonlineshop.entity.Cart;
import com.wmz.cakeonlineshop.entity.Order;
import com.wmz.cakeonlineshop.order.service.OrderServiceImpl;
@Controller
public class OrderController {
	
	@Resource
	private OrderServiceImpl orderServiceImpl;
	
	/**
	 * 点击checkout跳转到该控制器，将订单插入到订单表和订单详情表
	 * @param request
	 * @param response
	 * @param order Order类型的对象
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/order")
	public void checkout(HttpServletRequest request, HttpServletResponse response,Order order) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Object objemail=session.getAttribute("email");
		if(objemail!=null) {
			String email=(String)objemail;
			Object obj=session.getAttribute("cart");		
			Cart cart=null;
			if(obj!=null) {//用户已登录且购物车不为空
				cart=(Cart)obj;
				orderServiceImpl.addOrder(cart, order,email);
				session.setAttribute("cart", null);
				request.setAttribute("cartsuccess", "结算成功");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}else {//购物车为空
				request.setAttribute("carterror", "购物车内无内容");
				request.getRequestDispatcher("error.jsp").forward(request, response);				
			}
		}else {//session未能获取到"email",未登录状态
			request.setAttribute("carterror", "请先登录");
			request.getRequestDispatcher("error.jsp").forward(request, response);				
		}
	}
	
}
