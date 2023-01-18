
<%@page import="model.MessageReport"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="imageLoader.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="E-Campus Store" />
<meta name="keywords" content="E-Campus, store, ecommerce, jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="shortcut icon" href="./img/favicon.png" type="image/x-icon" />
<title>Campus E-store || Home</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet" />

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/elegant-icons.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nice-select.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signup.css"
	type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

body{
	overflow-x: hidden;
}
/* LOGIN/SIGN MODAL, MOBILE & LARGE SCREEN RESPONSIVENESS */

/* Medium Device = 1200px */
@media only screen and (min-width: 1200px) {
	.main {
		transform: scale(1);
		left: 50%;
		margin-top: -200px;
	}
}
/* Tablet Device = 768px */
@media only screen and (min-width: 768px) and (max-width: 991px) {
	.main {
		margin-top: -200px;
		left: 0;
		transform: scale(0.79);
	}
}
/* Wide Mobile = 480px */
@media only screen and (max-width: 767px) {
	.main {
		transform: scale(0.69);
		margin-top: -200px;
		/* top: -10%; */
		left: -17%;
	}
}

/* Small Device > 320px */
@media only screen and (max-width: 479px) {
	.main {
		transform: scale(0.45);
		margin-top: -200px;
		/* top: -10%; */
		left: -52%;
	}
}
/* Small Device = 320px */
@media only screen and (max-width: 360px) {
	.main {
		transform: scale(0.43);
		margin-top: -200px;
		/* top: -10%; */
		left: -60%;
	}
}

.header__top__right__auth, .header__cart__price {
	cursor: pointer;
	transition: transform 300ms ease;
}

.header__top__right__auth:hover, .header__cart__price:hover {
	transform: scale(1.08);
}

.header__top__right__auth:hover span {
	color: #7fad39;
}

.form_input {
	padding-left: 20px;
}

.form-title {
	line-height: 1;
	margin: 15px 0;
}

.a-container .button {
	margin-top: 20px;
}

.inputfile {
	width: 0.1px;
	height: 0.1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
}

.inputfile+label {
	margin-top: 10px;
	max-width: 100%;
	height: 40px;
	border-radius: 10px;
	font-size: 1rem;
	/* 20px */
	font-weight: 500;
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
	display: inline-block;
	overflow: hidden;
	padding: 0.625rem 1.25rem;
	/* 10px 20px */
}

.no-js .inputfile+label {
	display: none;
}

.inputfile:focus+label, .inputfile.has-focus+label {
	outline: 1px dotted #7fad39;
	outline: -webkit-focus-ring-color auto 5px;
}

.inputfile+label * {
	/* pointer-events: none; */
	/* in case of FastClick lib use */
	
}

.inputfile+label svg {
	width: 1em;
	height: 1em;
	vertical-align: middle;
	fill: currentColor;
	margin-top: -0.25em;
	/* 4px */
	margin-right: 0.25em;
	/* 4px */
}

.inputfile-2+label {
	color: #7fad39;
	border: 2px solid #7fad39;
}

.inputfile-2:focus+label, .inputfile-2.has-focus+label, .inputfile-2+label:hover
	{
	color: #722040;
}
/* ===========  LOGIN/REGISTRATION ALERT MESSAGE ====================== */
.alert {
	display: flex;
	flex-direction: row;
	padding: 15px 20px;
	width: 420px;
	position: absolute;
	right: 0px;
	top: 10px;
	border-radius: 4px;
	overflow: hidden;
	z-index: 999;
}

.alert.show {
	animation: show_slide 1s ease forwards;
}

@
keyframes show_slide { 0%{
	transform: translateX(100%);
}

40


%
{
transform


:


translateX
(


-10
%


)
;


}
80


%
{
transform


:


translateX
(


0
%


)
;


}
100


%
{
transform


:


translateX
(


-10px


)
;


}
}
.alert.hide {
	animation: hide_slide 1s ease forwards;
}

@
keyframes hide_slide { 0%{
	transform: translateX(-10px);
}

40


%
{
transform


:


translateX
(


0
%


)
;


}
80


%
{
transform


:


translateX
(


-10
%


)
;


}
100


%
{
transform


:


translateX
(


100
%


)
;


}
}
.alert-danger {
	border-left: 4px solid #ce8500;
}

.alert-success {
	border-left: 4px solid #014214;
}

.alert-danger {
	background-color: #ffdb9b;
	font-weight: bolder;
}

.alert-success {
	background: #d6fedf;
	font-weight: bolder;
}

.alert .alert-msg {
	padding: 0 20px;
	font-size: 18px;
}

.alert-danger .alert-msg {
	color: #ce8500;
}

.alert-success .alert-msg {
	color: #014214;
}

.alert .close-alert {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	padding: 20px 18px;
	cursor: pointer;
}

.alert .close-alert:hover {
	opacity: 0.86;
}

.alert-success .close-alert {
	background: #014214;
}

.alert-success .close-alert span {
	color: #d6fedf;
	font-size: 22px;
	line-height: 40px;
	user-select: none;
}

.alert-danger .close-alert {
	background-color: #ce8500;
}

.alert-danger .close-alert span {
	color: #ffdb9b;
	font-size: 22px;
	line-height: 40px;
}

.login{
	text-decoration: underline;
	color: #1058cc;
	font-weight: bold;
	cursor: pointer;
	z-index: 9999;
	font-size: 12px;
	margin-left: -15px;
}

.hero__categories ul li a:hover{
	color: #7fad39;
}
</style>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%
		MessageReport m1 = (MessageReport) session.getAttribute("msg");
		if (m1 != null) {
		%>
		<div class="alert alert-<%=m1.getMessageColor()%> show">
			<p class="alert-msg"><%=m1.getMessageContent()%></p>
			<p class="login" onclick="signupToggle()">Proceed to login </p>
			<div class="close-alert">
				<span>x</span>
			</div>
		</div>
		
		<%
		}
		%>
	<div class="body-container" id="body-container">
		<!-- Humberger Begin -->
		<div class="humberger__menu__overlay"></div>
		<div class="humberger__menu__wrapper">
			<div class="humberger__menu__logo">
				<a href="#"><img src="./img/logo.png" alt="" /></a>
			</div>

			<div class="humberger__menu__widget">

				<div class="header__top__right__auth">
					<span onclick="signupToggle()"><i class="fa-solid fa-user"></i>
						Login</span>
				</div>
			</div>
			<nav class="humberger__menu__nav mobile-menu">
				<ul>
					<li class="active"><a href="./index.jsp">Home</a></li>
					<li><a href="./shop.jsp">Shop</a></li>
					<li><a href="./blog.jsp">Blog</a></li>
					<li><a href="./contact.jsp">Contact</a></li>

				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
			<div class="header__top__right__social">
				<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-twitter"></i></a> <a href="#"><i
					class="fa fa-linkedin"></i></a> <a href="#"><i
					class="fa fa-pinterest-p"></i></a>
			</div>
			<div class="humberger__menu__contact">
				<ul>
					<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
					<li>Free Shipping for all Order of &#8358;10,000.00</li>
				</ul>
			</div>
		</div>
		<!-- Humberger End -->

		<!-- Header Section Begin -->
		<header class="header">
			<div class="header__top">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="header__top__left">
								<ul>
									<!-- <li><i class="fa fa-envelope"></i> sadiqaminu6@gmail.com</li> -->
									<marquee>
										<li>Free Shipping for all Order of &#8358;10,000.00</li>
									</marquee>
								</ul>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="header__top__right">
								<div class="header__top__right__social">
									<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
										href="#"><i class="fa-brands fa-twitter"></i></a> <a href="#"><i
										class="fa-brands fa-linkedin-in"></i></a> <a href="#"><i
										class="fa-brands fa-pinterest-p"></i></a>
								</div>
								<div class="header__top__right__auth">
									<span onclick="signupToggle()"><i
										class="fa-solid fa-user"></i> Login</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="header__logo">
							<a href="./index.html"><img src="img/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-lg-6">
						<nav class="header__menu">
							<ul>
								<li class="active"><a href="./index.jsp">Home</a></li>
								<li><a href="./shop.jsp">Shop</a></li>
								<li><a href="./blog.jsp">Blog</a></li>
								<li><a href="./contact.jsp">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-lg-3">
						<div class="header__cart">
							<div class="header__cart__price">
								<span onclick="signupToggle()">Want to Sell?</span>
							</div>
						</div>
					</div>
				</div>
				<div class="humberger__open">
					<i class="fa fa-bars"></i>
				</div>
			</div>
		</header>
		<!-- Header Section End -->

		<!-- Hero Section Begin -->
		<section class="hero">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="hero__categories">
							<div class="hero__categories__all">
								<i class="fa fa-bars"></i> <span>All departments</span>
							</div>
							<ul>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Supermarket">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Supermarket</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Health & Beauty">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Health & Beauty</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Home & Office">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Home & Office</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Phones & Tablets">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Phones & Tablets</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Computing">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Computing</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Electronic">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Electronic</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Fashion">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Fashion</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Baby Products">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Baby Products</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Gaming">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Gaming</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Automobile">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Automobile</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Jewelries">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Jewelries</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Accessories">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Accessories</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Others">
										<button type="submit" style="border:none; outline:none; background:none; margin:5px;">Others</button>
									</form>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="hero__search">
							<div class="hero__search__form">
								<form action="#">
									<!-- <div class="hero__search__categories">
                    All Categories
                    <span class="arrow_carrot-down"></span>
                  </div> -->
									<input type="text" placeholder="What do yo u need?" />
									
									<button type="submit" class="site-btn">SEARCH</button>
								</form>
							</div>
							<!-- <div class="hero__search__phone">
                <div class="hero__search__phone__icon">
                  <i class="fa fa-phone"></i>
                </div>
                <div class="hero__search__phone__text">
                  <h5>+2348143055218</h5>
                  <span> 24/7 Customer Services</span>
                </div>
              </div> -->
						</div>
						<div class="hero__item set-bg" data-setbg="img/hero/men.png">
							<div class="hero__text">
								<a href="#" class="primary-btn">SHOP NOW</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Hero Section End -->

		<!-- Categories Section Begin -->
		<section class="categories">
			<div class="container">
				<div class="row">
					<div class="categories__slider owl-carousel">
					<%! String productName, productId, filePath;
						double productAmount; %>
					<%
						Loader ld = new Loader();
						Random rand = new Random();
						ArrayList <File> image = new ArrayList <File>();
						ld.deleteImageInIndex();
						ld.imageSample();
						String filePath = "C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\allImage\\";
						File dir = new File(filePath).getAbsoluteFile();
						File [] dirListing = dir.listFiles();
						if(dirListing != null){
							for (File fl: dirListing){
								image.add(fl);
							}
							Collections.shuffle(image);
							for(File imageIndex: image){				
								
								String imageName = imageIndex.getName();
								String prodId = imageName.substring(0, 9);
								DAO dao = new DAO();
								ArrayList <Product> pr = (ArrayList<Product>)DAO.getProductDetailsWithList(prodId);
								for(Product details: pr){
									productName = details.getProductName();
									productAmount = details.getProductAmount();
								}
					%>
								<div class="col-lg-3">
									<div class="categories__item set-bg"
										data-setbg="img/allImage/<%=imageName %>">
											<h5><a href="ProductDetails?productId=<%=prodId %>"><%=productName %>
											</a></h5>
									</div>
								</div>
					<%
							}
						}else{
							System.out.println("Image File is empty!");
						}
														
					%>
					</div>
				</div>
			</div>
		</section>
		<!-- Categories Section End -->

		<!-- Featured Section Begin -->
		<section class="featured spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Featured Product</h2>
						</div>
						<div class="featured__controls">
							<ul>
								<li class="active" data-filter="*">All</li>
								<li data-filter=".Phones">Phone & Accessories</li>
								<li data-filter=".Jewelries">Jewelries</li>
								<li data-filter=".Fashion">Fashion</li>
								<li data-filter=".Supermarket">Supermarkets</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row featured__filter">
				
				<%! String productID ="", prodName="", productCategory="", productStatus ="", productDescription ="", productCondition="", productImage1="", productImage2="", productImage3="", path=""; 
				double productAmt =0.0;%>
				
				<%		
					Loader ld2 = new Loader();
					ld2.featuredProducts();
					ArrayList <File> featuredImage = new ArrayList <File>();
					String featured = "C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\featuredProduct\\";
					File dir2 = new File(featured).getAbsoluteFile();
					dirListing = dir2.listFiles();
					 if(dirListing != null){
						 for (File fl: dirListing){
							 featuredImage.add(fl);
							}
							Collections.shuffle(featuredImage);
							for(File imageIndex: featuredImage){	
							 String imageName = imageIndex.getName();
							 productID = imageName.substring(0, 9);
							 
							 List <Product> product = (List <Product>)DAO.getProductDetailsWithList(productID);
								for(Product p:product){
				
									productID = p.getProductId();
									prodName = p.getProductName();
									productCategory = p.getProductCategory();
									productCondition = p.getProductCondition();
									productStatus = p.getProductStatus();
									productAmt = p.getProductAmount();
									productDescription = p.getProductDescription();
								}
								if(productCategory.equals("Phones & Tablets")){
									productCategory = "Phones";
								}
				%>

					<div class="col-lg-3 col-md-4 col-sm-6 mix <%=productCategory %>">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="img/product/featuredProduct/<%= imageName %>">
								<ul class="featured__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="featured__item__text">
								<h6>
									<a href="ProductDetails?productId=<%=productID %>"><%=prodName %></a>
								</h6>
								<h5>&#8358;<%= productAmt%></h5>
							</div>
						</div>
					</div>
				<%
					 }
			        }else{
						System.out.println("Image File is empty!");
					}
				%>
					
				</div>
			</div>
		</section>
		<!-- Featured Section End -->

		<!-- Banner Begin -->
		<div class="banner">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="banner__pic">
							<img src="img/banner/banner-1.jpg" alt="" />
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="banner__pic">
							<img src="img/banner/banner-2.jpg" alt="" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Banner End -->

		<!-- Latest Product Section Begin -->
		<section class="latest-product spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="latest-product__text">
							<h4>Latest Products</h4>
							<div class="latest-product__slider owl-carousel">
								
								<%! String productID1 ="", prodName1 ="", productCategory1 ="", productStatus1 ="", productDescription1 ="", productCondition1 ="", path3 =""; 
								double productAmt1 =0.0;%>
								
								<%	
								for(int rept = 1; rept <= 3; rept++){
									
								%>
									<div class="latest-prdouct__slider__item">
								<%
									Loader filter1 = new Loader();
									int count = 0;
									filter1.filteredImage1();
									ArrayList <File> filterImage1 = new ArrayList <File>();
									File dir3 = new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter1\\").getAbsoluteFile();
									dirListing = dir3.listFiles();
									 if(dirListing != null){
										 for (File fl: dirListing){
											 filterImage1.add(fl);
											}
												Collections.shuffle(filterImage1);
												for(File imageIndex: filterImage1){	
													if(filterImage1.indexOf(imageIndex) < 3){
													 String imageName = imageIndex.getName();
													 productID1 = imageName.substring(0, 9);
													 
													 List <Product> product = (List <Product>)DAO.getProductDetailsWithList(productID1);
														for(Product p:product){
										
															productID1 = p.getProductId();
															prodName1 = p.getProductName();
															productCategory1 = p.getProductCategory();
															productCondition1 = p.getProductCondition();
															productStatus1 = p.getProductStatus();
															productAmt1 = p.getProductAmount();
															productDescription1 = p.getProductDescription();
														}
														
								%>
									<a href="ProductDetails?productId=<%=productID1 %>" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/product/filter1/<%= imageName %>" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6><%= prodName1 %></h6>
											<span>&#8358;<%= productAmt1 %></span>
										</div>
									</a> 
								<%
													}
										 }
							        }else{
										System.out.println("Image File is empty!");
									}
									 
								%>
								</div>
								<%
								}
								%>
								
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="latest-product__text">
							<h4>Top Rated Products</h4>
							<div class="latest-product__slider owl-carousel">
							
							<%! String productID2 ="", prodName2 ="", productCategory2 ="", productStatus2 ="", productDescription2 ="", productCondition2 ="", path4 =""; 
								double productAmt2 =0.0;%>
								
								<%	
								for(int rept = 1; rept <= 3; rept++){
									
								%>
									<div class="latest-prdouct__slider__item">
								<%
									Loader filter2 = new Loader();
									int count = 0;
									filter2.filteredImage2();
									ArrayList <File> filterImage2 = new ArrayList <File>();
									File dir4 = new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter2\\").getAbsoluteFile();
									dirListing = dir4.listFiles();
									 if(dirListing != null){
										 for (File fl: dirListing){
											 filterImage2.add(fl);
											}
												Collections.shuffle(filterImage2);
												for(File imageIndex: filterImage2){	
													if(filterImage2.indexOf(imageIndex) < 3){
													 String imageName = imageIndex.getName();
													 productID2 = imageName.substring(0, 9);
													 
													 List <Product> product = (List <Product>)DAO.getProductDetailsWithList(productID2);
														for(Product p:product){
										
															productID2 = p.getProductId();
															prodName2 = p.getProductName();
															productCategory2 = p.getProductCategory();
															productCondition2 = p.getProductCondition();
															productStatus2 = p.getProductStatus();
															productAmt2 = p.getProductAmount();
															productDescription2 = p.getProductDescription();
														}
														
								%>
									<a href="ProductDetails?productId=<%=productID2 %>" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/product/filter1/<%= imageName %>" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6><%= prodName2 %></h6>
											<span>&#8358;<%= productAmt2 %></span>
										</div>
									</a> 
								<%
													}
										 }
							        }else{
										System.out.println("Image File is empty!");
									}
									 
								%>
								</div>
								<%
								}
								%>
								
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="latest-product__text">
							<h4>Review Products</h4>
							<div class="latest-product__slider owl-carousel">
								<%! String productID3 ="", prodName3 ="", productCategory3 ="", productStatus3 ="", productDescription3 ="", productCondition3 ="", path5 =""; 
								double productAmt3 =0.0;%>
								
								<%	
								for(int rept = 1; rept <= 3; rept++){
									
								%>
									<div class="latest-prdouct__slider__item">
								<%
									Loader filter3 = new Loader();
									int count = 0;
									filter3.filteredImage3();
									ArrayList <File> filterImage3 = new ArrayList <File>();
									File dir5 = new File("C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img\\product\\filter3\\").getAbsoluteFile();
									dirListing = dir5.listFiles();
									 if(dirListing != null){
										 for (File fl: dirListing){
											 filterImage3.add(fl);
											}
												Collections.shuffle(filterImage3);
												for(File imageIndex: filterImage3){	
													if(filterImage3.indexOf(imageIndex) < 3){
													 String imageName = imageIndex.getName();
													 productID3 = imageName.substring(0, 9);
													 
													 List <Product> product = (List <Product>)DAO.getProductDetailsWithList(productID3);
														for(Product p:product){
										
															productID3 = p.getProductId();
															prodName3 = p.getProductName();
															productCategory3 = p.getProductCategory();
															productCondition3 = p.getProductCondition();
															productStatus3 = p.getProductStatus();
															productAmt3 = p.getProductAmount();
															productDescription3 = p.getProductDescription();
														}
														
								%>
									<a href="ProductDetails?productId=<%=productID3 %>" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/product/filter1/<%= imageName %>" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6><%= prodName3 %></h6>
											<span>&#8358;<%= productAmt3 %></span>
										</div>
									</a> 
								<%
													}
										 }
							        }else{
										System.out.println("Image File is empty!");
									}
									 
								%>
								</div>
								<%
								}
								%>
								<!-- <div class="latest-prdouct__slider__item">
									<a href="#" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/latest-product/lp-1.jpg" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6>Crab Pool Security</h6>
											<span>&#8358;10,000.00</span>
										</div>
									</a> <a href="#" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/latest-product/lp-2.jpg" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6>Crab Pool Security</h6>
											<span>&#8358;10,000.00</span>
										</div>
									</a> <a href="#" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="img/latest-product/lp-3.jpg" alt="" />
										</div>
										<div class="latest-product__item__text">
											<h6>Crab Pool Security</h6>
											<span>&#8358;10,000.00</span>
										</div>
									</a>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Latest Product Section End -->

		<!-- Blog Section Begin -->
		<section class="from-blog spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title from-blog__title">
							<h2>From The Blog</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-1.jpg" alt="" />
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Cooking tips make cooking simple</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="" />
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">6 ways to prepare breakfast for 30</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img src="img/blog/blog-3.jpg" alt="" />
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Visit the clean farm in the US</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Blog Section End -->

		<!-- Footer Section Begin -->
		<footer class="footer spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer__about">
							<div class="footer__about__logo">
								<a href="./index.html"><img src="img/logo.png" alt="" /></a>
							</div>
							<ul>
								<li>Address: 60-49 Road 11378 New York</li>
								<li>Phone: +65 11.188.888</li>
								<li>Email: hello@colorlib.com</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
						<div class="footer__widget">
							<h6>Useful Links</h6>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">About Our Shop</a></li>
								<li><a href="#">Secure Shopping</a></li>
								<li><a href="#">Delivery infomation</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Our Sitemap</a></li>
							</ul>
							<ul>
								<li><a href="#">Who We Are</a></li>
								<li><a href="#">Our Services</a></li>
								<li><a href="#">Projects</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">Innovation</a></li>
								<li><a href="#">Testimonials</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="footer__widget">
							<h6>Join Our Newsletter Now</h6>
							<p>Get E-mail updates about our latest shop and special
								offers.</p>
							<form action="#">
								<input type="text" placeholder="Enter your mail" />
								<button type="submit" class="site-btn">Subscribe</button>
							</form>
							<div class="footer__widget__social">
								<a href="#"><i class="fa-brands fa-facebook-f"></i></a> <a
									href="#"><i class="fa-brands fa-instagram"></i></a> <a href="#"><i
									class="fa-brands fa-twitter"></i></a> <a href="#"><i
									class="fa-brands fa-pinterest-p"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer__copyright">
							<div class="footer__copyright__text">
								<p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
                    document.write(new Date().getFullYear());
                  </script>
									All rights reserved | This Project is with <i
										class="fa fa-heart" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">18283177</a>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
							<div class="footer__copyright__payment">
								<img src="img/payment-item.png" alt="" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- Footer Section End -->
	<div class="main">
		<!-- SIGN UP SECTION -->
		<div class="modal-container a-container" id="a-container">
			<form action="SaveUserServlet" method="post" class="modal-form"
				id="a-form" enctype="multipart/form-data">
				<div class="close-modal" onclick="signupToggle()">Close</div>
				<h2 class="form-title title">Create Account</h2>
				<div class="form_icons"></div>

				<input type="text" class="form_input" placeholder="Name" required
					name="name" /> <input type="email" class="form_input"
					placeholder="Email" required name="email" /> <input type="text"
					class="form_input" placeholder="Student ID Number" required
					name="student_id" /> <input type="password" class="form_input"
					placeholder="Password" required name="password" /> <input
					type="text" class="form_input" placeholder="Phone Number" required
					name="phone" />
				<div class="box">
					<input type="file" name="student_id_card" id="file-2"
						class="inputfile inputfile-2"
						data-multiple-caption="{count} files selected" multiple /> <label
						for="file-2"><svg xmlns="http://www.w3.org/2000/svg"
							width="20" height="17" viewBox="0 0 20 17">
							<path
								d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
						<span>Upload Student ID Card&hellip;</span></label>
				</div>
				<button type="submit" class="form_button button submit">
					SIGN UP</button>
			</form>
		</div>
		<!-- login section -->
		<div class="modal-container b-container" id="b-container">

			<form action="AuthenticateServlet" class="modal-form" id="b-form">
				<div class="close-modal" onclick="signupToggle()">Close</div>
				<h2 class="form_title title">Sign in to dashboard</h2>
				<div class="form_icons"></div>
				<span class="form_span">or use your email account</span> <input
					type="email" class="form_input" placeholder="Email" required
					name="username" /> <input type="password" class="form_input"
					placeholder="Password" required name="password" /> <a href="#"
					class="form_link">Forgot your password?</a>
				<button type="submit" class="form_button button submit">
					SIGN IN</button>
			</form>
		</div>

		<div class="switch" id="switch-cnt">
			<div class="switch_circle"></div>
			<div class="switch_circle switch_circle-t"></div>

			<div class="switch_container" id="switch-c1">
				<a href="#" class="logo_link"> <img src="img/logo.png" alt="" />
				</a>
				<h2 class="switch_title title click" id="click-me">Welcome Back
					!</h2>
				<p class="switch_description description">To keep connected with
					us please login with your email & password</p>
				<button class="switch_button button switch-btn">SIGN IN</button>
			</div>

			<div class="switch_container is-hidden" id="switch-c2">
				<a href="#" class="logo_link"> <img src="img/logo.png" alt="" />
				</a>
				<h2 class="switch_title title">Hello Friend !</h2>
				<p class="switch_description description">Enter your personal
					details and start journey with us</p>
				<button class="switch_button button switch-btn">SIGN UP</button>
			</div>
		</div>
	</div>

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/signup.js"></script>

	<script type="text/javascript">
    ( function ( document, window, index )
    		{
    			var inputs = document.querySelectorAll( '.inputfile' );
    			Array.prototype.forEach.call( inputs, function( input )
    			{
    				var label	 = input.nextElementSibling,
    					labelVal = label.innerHTML;

    				input.addEventListener( 'change', function( e )
    				{
    					var fileName = '';
    					if( this.files && this.files.length > 1 )
    						fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
    					else
    						fileName = e.target.value.split( '\\' ).pop();

    					if( fileName )
    						label.querySelector( 'span' ).innerHTML = fileName;
    					else
    						label.innerHTML = labelVal;
    				});

    				// Firefox bug fix
    				input.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
    				input.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });
    			});
    		}( document, window, 0 ));
    
 // LOGIN/REGISTRATION ALERT MESSAGE
   /* const closeBtn = document.querySelector(".close-alert");
     	const alertBox = document.querySelector(".alert");
     	const inputField = document.querySelectorAll(".input-field");
     	const submitBtn = document.querySelector(".submit-btn");
     	

     	closeBtn.onclick = ()=>{
     		alertBox.classList.add("hide");
    	}
     	const myTimeout = setTimeout(hideAlert, 5000);
     	
     	function hideAlert(){
     		alertBox.classList.add("hide");
     	}*/
    </script>
</body>
</html>