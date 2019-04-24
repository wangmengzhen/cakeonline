<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Account</title>
<!-- 注册页 -->
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="js/simpleCart.min.js"> </script>
<!-- cart -->
<script type="text/javascript" src="static/jquery/1.8.1/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
function checkEmail() {//检查email是否符合要求
	var email = document.getElementById("email").value;
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("Post", "checkemail?email=" + email, true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var res = xmlhttp.responseText;
				if (res == "0") {
					document.getElementById("msg").innerHTML = "该邮箱可用";
				} else if (res == "1") {
					document.getElementById("msg").innerHTML = "该邮箱已被注册";
				} else {
					document.getElementById("msg").innerHTML = "该邮箱不能为空";
				}
			}
		}
	}
	function checkName(obj) {//检查name是否符合要求
		if (obj.length == 0) {
			document.getElementById("namemsg").innerHTML = "用户名不能为空！";
		} else {
			document.getElementById("namemsg").innerHTML = "用户名可用!";
		}
	}
	function checkAddress(obj) {//检查address是否符合要求
		if (obj.length == 0) {
			document.getElementById("addressmsg").innerHTML = "地址不能为空！";
		} else {
			document.getElementById("addressmsg").innerHTML = "地址正确!";
		}
	}
	function checkPhone(obj) {//检查phone是否符合要求
		if (obj.length == 0) {
			document.getElementById("phonemsg").innerHTML = "电话不能为空！";
		} else {
			document.getElementById("phonemsg").innerHTML = "电话正确!";
		}
	}
	function checkPsd() {//检查密码是否符合要求
		var psd = document.getElementById("psd").value;
		var queren = document.getElementById("queren").value;
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("Post", "checkpsd?psd=" + psd + "&queren=" + queren, true);
		xmlhttp.send();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var res = xmlhttp.responseText;
				if (res == "ok") {
					document.getElementById("psdmsg").innerHTML = "密码前后一致!";
				} else {
					document.getElementById("psdmsg").innerHTML = "密码前后不一致，请重新输入!";
				}
			}
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<!--//header-->
	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="register" method="get"> 
					<div class="register-top-grid">
						<h3>Personal information</h3>
						<div class="input">
							<span id="errormsg">${errormsg }</span>
							<span>Email Address<label>*</label></span>
							<input type="text" name="email" id="email" onblur="checkEmail()"> 
							<span id="msg"></span>
						</div>
						<div class="input">
							<span>Nick Name<label>*</label></span>
							<input type="text" name="name" id="name" onblur="checkName(this.value)"> 
							<span id="namemsg"></span>
						</div>
						<div class="input">
							<span>Address<label>*</label></span>
							<input type="text" name="address" id="address" onblur="checkAddress(this.value)" > 
							<span id="addressmsg"></span>
						</div>
						<div class="input">
							<span>Phone<label>*</label></span>
							<input type="text" name="phone" id="phone" onblur="checkPhone(this.value)"> 
							<span id="phonemsg"></span>
						</div>
						<a class="news-letter" href="#">
							<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label>
						</a>
						<div class="clearfix"> </div>
					</div>
				    <div class="register-bottom-grid">
						<h3>Login information</h3>
						<div class="input">
							<span>Password<label>*</label></span>
							<input type="password" name="password" id="psd">
						</div>
						<div class="input">
							<span>Confirm Password<label>*</label></span>
							<input type="password" name="queren" id="queren" onblur="checkPsd()">
							<span id="psdmsg"></span>
						 </div>
						 <div class="clearfix"> </div>
						<div class="register-but">				   
						   <input type="submit" value="submit">
						   <div class="clearfix"> </div>
						</div>
					</div>
				</form>
			</div>
	    </div>
	</div>
	<!--//account-->
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<!--//footer-->
	
</body>
</html>