<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 头部 -->
<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="index">Yummy</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="index" class="active">Home</a></li>
						<c:forEach items="${cakeTypes}" var="caketype1">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">${caketype1.name }<b class="caret"></b></a>
									<ul class="dropdown-menu multi-column columns-4" style="width:20px">
										<c:forEach items="${caketype1.childTypes}" var="caketype2">											
												<li class="menu_header"><a href="search?typeid=${caketype2.id }">${caketype2.name }</a></li>
										</c:forEach>
									</ul>
								</li>
						</c:forEach>							
					</ul> 
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								Search
							</button>
						</form>
					</div>	
				</div>
				<c:if test="${empty email }">
					<div class="header-right login">
						<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
						<div id="loginBox">                
							<form id="loginForm" action="login">
								<fieldset id="body">
									<fieldset>
										<label for="email">Email Address</label>
										<input type="text" name="email" id="email1" value="${user.email }">
									</fieldset>
									<fieldset>
										<label for="password">Password</label>
										<input type="password" name="password" id="password" value="${user.password }">
									</fieldset>
									<input type="submit" id="login" value="Sign in" >
									<label for="checkbox"><input type="checkbox" id="checkbox" name="checkbox"> <i>Remember me</i></label>
								</fieldset>
								<p>New User ? <a class="sign" href="account.jsp">Sign Up</a></p>
							</form>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty email }">
					<div class="header-right login">
						<a href="#"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
						<div id="loginBox">                
							<form id="loginForm" action="login">
								<fieldset id="body">
									<fieldset style="widht:30px">
										<label for="email"><a style="color:#F07818">${email }</a></label>
										<label for="email"><a style="color:#F07818" href="existlogin">Exist Login</a></label>
									</fieldset>
								</fieldset>
							</form>
						</div>
					</div>
				</c:if>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
					<div class="cart-box">
						<h4><a href="checkout.jsp">
							<span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>) 
						</a></h4>
						<p><a href="emptycart;javascript:;" class="simpleCart_empty">Empty cart</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->