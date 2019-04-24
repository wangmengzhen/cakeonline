package com.wmz.cakeonlineshop.user.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wmz.cakeonlineshop.entity.User;
import com.wmz.cakeonlineshop.user.dao.UserDaoImpl;
import com.wmz.cakeonlineshop.user.service.UserServiceImpl;
@Controller
public class UserController {
	@Resource
	private UserServiceImpl userServiceImpl;
	@Resource
	private UserDaoImpl userDaoImpl;
	
	/**
	 * 用户点击注册，跳转到该controller
	 * @param request
	 * @param response
	 * @param user
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/register")
	public void register(HttpServletRequest request,HttpServletResponse response,User user) throws ServletException, IOException {
		String queren=request.getParameter("queren");
		int errormsg=-1;
		errormsg=userServiceImpl.admitRegister(user,queren);
		if(errormsg==0) {
			userServiceImpl.addUser(user);
			HttpSession session=request.getSession();
			session.setAttribute("email", user.getEmail());
			session.setMaxInactiveInterval(6000);
			request.getRequestDispatcher("index").forward(request, response);
		}else if(errormsg==1){
			request.setAttribute("errormsg", "email不能为空,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else if(errormsg==2) {
			request.setAttribute("errormsg", "email已被注册,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else if(errormsg==3) {
			request.setAttribute("errormsg", "名字不能为空,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else if(errormsg==4) {
			request.setAttribute("errormsg", "地址不能为空,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else if(errormsg==5) {
			request.setAttribute("errormsg", "电话不能为空,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else if(errormsg==6) {
			request.setAttribute("errormsg", "密码不能为空,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}else {
			request.setAttribute("errormsg", "密码前后不一致,请重新注册");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}
	/**
	 * AJAX检查email是否满足要求
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkemail")
	public void checkEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String email=request.getParameter("email");
		if(userDaoImpl.findByEmail(email)==false&&(email!=null)&&(!(email.equals("")))) {
			response.getWriter().print("0");
		}else if(userDaoImpl.findByEmail(email)==true){
			response.getWriter().print("1");
		}else {
			response.getWriter().print("2");
		}
	}
	
	/**
	 * AJAX检查密码是否符合要求
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkpsd")
	public void checkPsd(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String psd=request.getParameter("psd");
		String queren=request.getParameter("queren");
		if (psd.equals(queren)) {
			response.getWriter().print("ok");
		}else {
			response.getWriter().print("fail");
		}
	}
	
	/**
	 * 用户点击注册，跳转到该controller
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String[] checkbox=null;
		checkbox=request.getParameterValues("checkbox");
		int result=userServiceImpl.admitLogin(email, password, checkbox);
		HttpSession session=request.getSession();
		if(result==0) {
			User user=userDaoImpl.entityFindByEmail(email);
			session.setAttribute("user", user);
			session.setAttribute("email", email);
			request.getRequestDispatcher("index").forward(request, response);
		}else if(result==1) {
			session.setAttribute("email", email);
			request.getRequestDispatcher("index").forward(request, response);
		}else if(result==2) {
			request.setAttribute("loginerror", "密码错误");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}else {
			request.setAttribute("loginerror", "用户不存在");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/**
	 * 用户点击退出登录，跳转到该controller
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/existlogin")
	public void existLogin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.setAttribute("email", null);//清空session的user
		request.getRequestDispatcher("index").forward(request, response);
	}
}
