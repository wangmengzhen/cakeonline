package com.wmz.cakeonlineshop.log;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogRating {
	private static Logger log = LoggerFactory.getLogger(LogRating.class);
	
	@RequestMapping("/logRating")
	public void checkEmail(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		
		String cakeid=request.getParameter("cakeid");
		String star=request.getParameter("star");
		log.info("------email:"+email+",cakeid:"+cakeid+",star:"+star);
	}
	
}
