<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 产品详情页 -->
<title>single</title>
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
<script src="js/imagezoom.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
<!-- FlexSlider -->
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<script type="text/javascript"
	src="static/jquery/1.8.1/jquery-1.8.1.min.js"></script>
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>
<script type="text/javascript">
	window.onload = function() {

		var oStar = document.getElementById("star");
		var aLi = oStar.getElementsByTagName("li");
		var oUl = oStar.getElementsByTagName("ul")[0];
		var oSpan = oStar.getElementsByTagName("span")[1];
		var i = iScore = iStar = 0;
		var aMsg = [ "1星", "2星", "3星", "4星", "5星" ]

		for (i = 1; i <= aLi.length; i++) {
			aLi[i - 1].index = i;

			//鼠标移过显示分数
			aLi[i - 1].onmouseover = function() {
				fnPoint(this.index);
			};

			//鼠标离开后恢复上次评分
			aLi[i - 1].onmouseout = function() {
				fnPoint();
			};

			//点击后进行评分处理
			aLi[i - 1].onclick = function() {
				iStar = this.index;
				console.log(iStar);
				var cakeid = document.getElementById("cakeid").value;
				if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.open("Post", "logRating?cakeid=" + cakeid + "&star="
						+ iStar, true);
				xmlhttp.send();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						console.log("success");
					}
				}
			}
		}

		//评分处理
		function fnPoint(iArg) {
			//分数赋值
			iScore = iArg || iStar;
			for (i = 0; i < aLi.length; i++)
				aLi[i].className = i < iScore ? "on" : "";
		}

	};
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->
	<!--//single-page-->
	<div class="single">
		<div class="container">
			<div class="single-grids">
				<div class="col-md-4 single-grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${cake.img1 }">
								<div class="thumb-image">
									<img src="${cake.img1 }" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="${cake.img2 }">
								<div class="thumb-image">
									<img src="${cake.img2 }" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="${cake.img3 }">
								<div class="thumb-image">
									<img src="${cake.img3 }" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 single-grid simpleCart_shelfItem">
					<input type="hidden" id="cakeid" value=${cake.id }>
					<h3>${cake.name }</h3>
					<p>${cake.description }</p>
					<ul class="size">
						<h3>Size</h3>
						<li>${cake.size }kg</li>
					</ul>
					<ul class="size">
						<h3>Star Level</h3>

					</ul>
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">$${cake.price }</h5>
						</div>
						<div class="rating">
							<div id="star">
								<ul>
									<li><a href="javascript:;">1</a></li>
									<li><a href="javascript:;">2</a></li>
									<li><a href="javascript:;">3</a></li>
									<li><a href="javascript:;">4</a></li>
									<li><a href="javascript:;">5</a></li>
								</ul>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<p class="qty">Qty :</p>
					<form action="addcartsingle">
						<input min="1" type="number" id="quantity" name="quantity"
							value="1" class="form-control input-small"> <input
							type="text" value="${cake.id }" name="cakeid"
							style="display: none">
						<div class="btn_form">
							<input type="submit" class="add-cart item_add"
								value="ADD TO CART">
							<!--<a href="addcartsingle?cakeid=${cake.id }&qty=1" class="add-cart item_add">ADD TO CART</a>-->
						</div>
						<div class="tag">
							<p>
								Category : <a href="#"> Cakes</a>
							</p>
							<p>
								Tag : <a href="#"> ${cake.tag } </a>
							</p>
						</div>
					</form>
				</div>
				<div class="col-md-4 single-grid1">
					<h2>Account</h2>
					<ul>
						<li><a href="#">Offers</a></li>
						<li><a href="products.html">New products</a></li>
						<li><a href="account.html">Register</a></li>
						<li><a href="account.html">Forgot Your Password</a></li>
						<li><a href="account.html">My account</a></li>
						<li><a href="contact.html">Address</a></li>
						<li><a href="checkout.html.html">wishlist</a></li>
						<li><a href="checkout.html.html">Order history</a></li>
						<li><a href="#">Downloads</a></li>
						<li><a href="#">Reward points</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> Description </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">
								additional information </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> reviews
								(5) </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour"> help </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">Anim pariatur cliche reprehenderit,
							enim eiusmod high life accusamus terry richardson ad squid. 3
							wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat
							craft beer farm-to-table, raw denim aesthetic synth nesciunt you
							probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//collapse -->
	<!--related-products-->
	<div class="related-products">
		<div class="container">
			<h3>Related Products</h3>
			<div class="product-model-sec single-product-grids">
				<c:forEach items="${related }" var="relatedcake">
					<div class="product-grid single-product">
						<a href="single.jsp?cakeid=${relatedcake.id }">
							<div class="more-product">
								<span> </span>
							</div>
							<div class="product-img b-link-stripe b-animate-go  thickbox">
								<img src="${relatedcake.bigimg }" class="img-responsive" alt="">
								<div class="b-wrapper">
									<h4 class="b-animate b-from-left  b-delay03">
										<button>View</button>
									</h4>
								</div>
							</div>
						</a>
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<h4>${relatedcake.name }</h4>
								<span class="item_price">$${relatedcake.price }</span>
								<div class="ofr">
									<p class="pric1">
										<del>$${relatedcake.price*(100-list.discount)*0.01}</del>
									</p>
									<p class="disc">[${relatedcake.discount }% Off]</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--related-products-->
	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!--//footer-->
</body>
</html>