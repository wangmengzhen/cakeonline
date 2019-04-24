<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Checkout</title>
<!-- 结算页 -->
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
function changecount(iid,cnt){
	var a=$('#'+cnt);console.log(a.val());
	$.get("changecount",{id:iid,count:a.val()},
			function(data){
	});
}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp" %>
	<!--//header-->
	<!--cart-items-->
	<div class="cart-items">
		<div class="container">
			<h2>My Shopping Cart</h2>
			<c:forEach items="${cart.container.values() }" var="cartcake">
			<div class="cart-header">
				<div class="cart-sec simpleCart_shelfItem">
					<div class="cart-item cyc">
						 <img src="${cartcake.cake.bigimg }" class="img-responsive" alt="">
					</div>
					<div class="cart-item-info">
						<h3><a href="listcake">${cartcake.cake.name }</a><span>Pickup time:</span></h3>
						<ul class="qty">
							<li><p>Tag:${cartcake.cake.tag }</p></li>
							<li><p>Size:${cartcake.cake.size }kg</p></li>
						</ul>
						<form style="margin-top:10px">
							Quantity:<input type="number" id="qty${cartcake.cake.id }" name="quantity" value="${cartcake.qty }" class="form-control input-small"  onblur="changecount(${cartcake.cake.id },'qty${cartcake.cake.id }')" style="width:80px;height=40px">
						</form>
						<div class="delivery">
							<p>Price : $${cartcake.cake.price*(100-cartcake.cake.discount)*0.01}</p>
							<span>Add Cart time:${cartcake.time }</span>
							<div class="clearfix"></div>
						</div>	
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			</c:forEach>			 
		</div>
		<div class="container">
			<c:if test="${empty email }">
				<div class="item_add items"><a href="order;javascript:;" style="color:#333">Check Out</a></div>			
			</c:if>
			<c:if test="${not empty email }">
				<div class="item_add items"><a href="order;javascript:;" class="simpleCart_empty" style="color:#333">Check Out</a></div>			
			</c:if>
		</div>
	</div>
	<!--//checkout-->	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<!--//footer-->
</body>
</html>