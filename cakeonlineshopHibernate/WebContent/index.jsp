<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 首页 -->
<title>Cake OnlineShop</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">	
</script>
<!-- cart -->
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->
	<!--banner-->
	<div class="banner">
		<div class="container">
			<h2 class="hdng">
				Yummy <span>Cakes</span> for u
			</h2>
			<p>Our best cakes make your day special</p>
			<a href="single?cakeid=5">SHOP NOW</a>
			<div class="banner-text">
				<img src="images/2.png" alt="" />
			</div>
		</div>
	</div>
	<!--//banner-->
	<div class="copyrights">
		Collect from <a href="http://www.cssmoban.com/"></a>
	</div>
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
				<div class="col-md-8 gallery-grid glry-one">
					<a href="single?cakeid=${cakes5[0].id}"><img
						src="${cakes5[0].bigimg }" class="img-responsive" alt="" />
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="single?cakeid=${cakes5[0].id}">SHOP NOW</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p>${cakes5[0].name }</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$${cakes5[0].price }</h5>
							</div>
							<div class="rating">
								<c:forEach begin="1" end="${cakes5[1].starlevel }">
									<span>★</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4 gallery-grid glry-two">
					<a href="single?cakeid=${cakes5[1].id}"><img
						src="${cakes5[1].bigimg }" class="img-responsive" alt="" />
						<div class="gallery-info galrr-info-two">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="single?cakeid=${cakes5[0].id}">SHOP NOW</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p>${cakes5[1].name }</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$${cakes5[1].price }</h5>
							</div>
							<div class="rating">
								<c:forEach begin="1" end="${cakes5[1].starlevel }">
									<span>★</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<c:forEach items="${cakes }" var="cake">
					<div class="col-md-3 gallery-grid ">
						<a href="single?cakeid=${cake[0].id}"><img
							src="${cake[0].bigimg }" class="img-responsive" alt="" />
							<div class="gallery-info">
								<p>
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
									view
								</p>
								<a class="shop" href="single?cakeid=${cake[0].id}">SHOP NOW</a>
								<div class="clearfix"></div>
							</div> </a>
						<div class="galy-info">
							<p>${cake[0].name }</p>
							<div class="galry">
								<div class="prices">
									<h5 class="item_price">$${cake[0].price }</h5>
								</div>
								<div class="rating">
									<c:forEach begin="1" end="${cakes5[1].starlevel }">
										<span>★</span>
									</c:forEach>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!--//gallery-->
	<!--subscribe-->
	<div class="subscribe">
		<div class="container">
			<h3>Newsletter</h3>
			<form>
				<input type="text" class="text" value="Email"
					onFocus="this.value = '';"
					onBlur="if (this.value == '') {this.value = 'Email';}"> <input
					type="submit" value="Subscribe">
			</form>
		</div>
	</div>
	<!--//subscribe-->
	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!--//footer-->
</body>
</html>