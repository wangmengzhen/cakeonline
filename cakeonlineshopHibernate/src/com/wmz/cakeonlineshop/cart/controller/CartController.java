package com.wmz.cakeonlineshop.cart.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.wmz.cakeonlineshop.cake.service.CakeServiceImpl;
import com.wmz.cakeonlineshop.cart.service.CartServiceImpl;
import com.wmz.cakeonlineshop.entity.Cake;
import com.wmz.cakeonlineshop.entity.Cart;

@Controller
public class CartController {
	@Resource
	private CartServiceImpl cartServiceImpl;
	@Resource
	private CakeServiceImpl cakeServiceImpl;
	
	/**
	 * 在products页面添加购物车
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addcartproducts")
	public void addCartproducts(HttpServletRequest request,HttpServletResponse response) {
		String cakeid=request.getParameter("cakeid");
		String qty=request.getParameter("quantity");
		String typeid=request.getParameter("typeid");
		String key=request.getParameter("key");
		String pageNum=request.getParameter("pageNum");
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("cart");
		Cart cart=null;
		if(obj!=null) {
			cart=(Cart)obj;
		}else {
			cart=new Cart();				
		}
		cartServiceImpl.add(cart,cakeServiceImpl.listById(cakeid), qty);
		session.setAttribute("cart", cart);	
		request.setAttribute("cakeid", cakeid);
		request.setAttribute("typeid", typeid);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("key", key);
		try {
			request.getRequestDispatcher("search").forward(request, response);//跳转到控制器
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 在single页面添加购物车
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addcartsingle")
	public void addcartsingle(HttpServletRequest request,HttpServletResponse response) {
		String cakeid=request.getParameter("cakeid");
		String qty=request.getParameter("quantity");
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("cart");
		Cart cart=null;
		if(obj!=null) {
			cart=(Cart)obj;
		}else {
			cart=new Cart();				
		}
		cartServiceImpl.add(cart,cakeServiceImpl.listById(cakeid), qty);
		session.setAttribute("cart", cart);	
		request.setAttribute("cakeid", cakeid);
		try {
			request.getRequestDispatcher("single").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 用AJAX实现改变购物车内蛋糕数量
	 * @param request
	 */
	@RequestMapping("/changecount")
	public void changecount(HttpServletRequest request) {
		String id=request.getParameter("id");
		String count=request.getParameter("count");
		Cake cake=cakeServiceImpl.listById(id);
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("cart");
		Cart cart=(Cart) obj;
		cartServiceImpl.change(cart, cake, count);
		session.setAttribute("cart", cart);
	}
	
	/**
	 * 清空购物车
	 * @param request
	 * @return
	 */
	@RequestMapping("/emptycart")
	public String emptyCart(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("cart", null);
		return "checkout";
	}
	
}
