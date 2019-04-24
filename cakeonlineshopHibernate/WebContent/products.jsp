<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 产品列表页 -->
<title>Products</title>
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
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
	$(function() {
		$('.scroll-pane').jScrollPane();
	});
</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->
	<!--products-->
	<div class="products">
		<div class="container">
			<h2>Our Products</h2>
			<div class="col-md-9 product-model-sec">
				<c:forEach items="${page.list }" var="list">
					<div class="product-grid">
						<a href="single?cakeid=${list.id }">
							<div class="more-product">
								<span> </span>
							</div>
							<div class="product-img b-link-stripe b-animate-go  thickbox">
								<img src="${list.bigimg }" class="img-responsive" alt=""
									width="299px" height="315px">
								<div class="b-wrapper" width="243.5px" height="196.78px">
									<h4 class="b-animate b-from-left  b-delay03">
										<button>View</button>
									</h4>
								</div>
							</div>
						</a>
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<h4>${list.name }</h4>
								<span class="item_price">$${list.price*(100-list.discount)*0.01}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;weight:${list.size }KG</span>
								<div class="ofr">
									<p class="pric1">
										<del>$${list.price }</del>
									</p>
									<p class="disc">[${list.discount }% Off]</p>
								</div>
								<form action="addcartproducts">
									<input type="text" value="${page.pageNum }" name="pageNum" style="display:none">	
									<input type="text" value="${typeid }" name="typeid" style="display:none">	
									<input type="text" value="${key }" name="key" style="display:none">
									<input type="text" value="${list.id }" name="cakeid" style="display:none">
									<input type="text" class="item_quantity" value="1" name="quantity"/>
									<input type="submit" class="item_add items" value="Add">
								 </form>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="col-md-9 product-model-sec">
					共有${page.totalCount}条数据，共${page.totalPageNum }页
					<a href="search?pageNum=${page.prePageNum }&typeid=${typeid}&key=${key}&weight=${weight}">首页</a>
					<a href="search?pageNum=${page.prePageNum }&typeid=${typeid}&key=${key}&weight=${weight}">上一页</a>
					<a href="search?pageNum=${page.nextPageNum }&typeid=${typeid}&key=${key}&weight=${weight}">下一页</a>
					<a href="search?pageNum=${page.totalPageNum }&typeid=${typeid}&key=${key}&weight=${weight}">末页</a>
				</div>
			</div>

			<div class="col-md-3 rsidebar span_1_of_left">
				<section class="sky-form">
				<h4>
					<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Key
				</h4>
				<div class="row row1 scroll-pane">
					<form action="search">
						<input type="text" name="key">
						<button type="submit" class="item_add items">Search</button>
					</form>
				</div>
				</section>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//products-->
	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!--//footer-->
</body>
</html>