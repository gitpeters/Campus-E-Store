
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
<link rel="shortcut icon"
	href="./img/logo/favicon.PNG"
	type="image/x-icon" />
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
	href="${pageContext.request.contextPath}/css/product-filter-style.css"
	type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
body {
	overflow-x: hidden;
}
/* LOGIN/SIGN MODAL, MOBILE & LARGE SCREEN RESPONSIVENESS */


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

@keyframes show_slide { 0%{
		transform: translateX(100%);
	}
	40%{
		transform:translateX(-10%);
	}
	80%{
		transform:translateX(0%);
	}
	100%{
		transform:translateX(-10px);
	}
}
	.alert.hide {
		animation: hide_slide 1s ease forwards;
	}
	
@keyframes hide_slide { 0%{
		transform: translateX(-10px);
	}
	40%{
	transform:translateX(0%);
	}
	80%{
	transform:translateX(-10%);
	}
	100%{
	transform:translateX(100%);
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

.login {
	text-decoration: underline;
	color: #1058cc;
	font-weight: bold;
	cursor: pointer;
	z-index: 9999;
	font-size: 12px;
	margin-left: -15px;
}

.hero__categories ul li a:hover {
	color: #7fad39;
}

/* ======= SEARCH DROP =========*/
.search-result-container {
	position: absolute;
	top: 47px;
	width: 55%;
	border: none;
	/*background: linear-gradient(to bottom, rgba(2, 8, 15, 0), #192133 90%);*/
	background: #fff;
	box-shadow: 0 2rem 3rem rgba(132, 139, 200, 0.18);
	border-radius: 0 0 6px 6px;
	z-index: 2;
}

.search-result-container .search-result {
	width: 100%;
	padding: 0px;
	list-style: none;
	opacity: 0;
	pointer-events: none;
}

.search-result-container.active .search-result {
	padding: 20px;
	opacity: 1;
	pointer-events: auto;
}

.search-result-container .search-result li {
	font-size: 16px;
	width: 100%;
	border-bottom: 1px solid #f5f5f5;
	padding: 4px;
	display: none;
}

.search-result-container .search-result li a {
	text-decoration: none;
	font-size: 16px;
	color: #192133;
}

.search-result-container.active .search-result li {
	display: block;
}

.search-result-container .search-result li:hover {
	background: #f5f5f5;
}
</style>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>

</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%
	HttpSession sn = request.getSession();
	MessageReport m1 = (MessageReport) sn.getAttribute("msg");
	if (m1 != null) {
	%>
	<div class="alert alert-<%=m1.getMessageColor()%> show">
		<p class="alert-msg"><%=m1.getMessageContent()%></p>
		<p class="login" onclick="signupToggle()">Proceed to login</p>
		<div class="close-alert">
			<span>x</span>
		</div>
	</div>

	<%
	}
	sn = request.getSession(false);
	if (sn != null) {
	sn.removeAttribute("msg");
	}
	%>
	<div class="body-container" id="body-container">
		<!-- Humberger Begin -->
		<div class="humberger__menu__overlay"></div>
		<div class="humberger__menu__wrapper">
			<div class="humberger__menu__logo">
				<a href="#"><img
					src="./img/logo/projectLogo.PNG"
					alt="" /></a>
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
							<a href="#"><img
								src="img/logo/projectLogo.PNG"
								alt="" style="height: 50px;" /></a>
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
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Supermarket</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Health & Beauty">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Health
											& Beauty</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Home & Office">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Home
											& Office</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Phones & Tablets">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Phones
											& Tablets</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Computing">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Computing</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Electronics">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Electronic</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Fashion">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Fashion</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Baby Products">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Baby
											Products</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Gaming">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Gaming</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Automobile">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Automobile</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Jewelries">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Jewelries</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Accessories">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Accessories</button>
									</form>
								</li>
								<li>
									<form method="post" action="ProductCategory">
										<input type="hidden" name="category" value="Others">
										<button type="submit"
											style="border: none; outline: none; background: none; margin: 5px;">Others</button>
									</form>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="hero__search">
							<div class="hero__search__form">
								<form action="#" id="searchForm" style="position: relative;">
									<!-- <div class="hero__search__categories">
                    All Categories
                    <span class="arrow_carrot-down"></span>
                  </div> -->
									<input type="text" placeholder="What do yo u need?"
										id="productSearch" name="searchTerm" onkeyup="search()" />

									<button type="submit" class="site-btn">SEARCH</button>
								</form>

							</div>
							<div class="search-result-container">
								<ul class="search-result">
									<li class="result-item"></li>
								</ul>
							</div>
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
						<%!String productName, productId, filePath, imageName, prodId, productCategory; double productAmount; int index;%>
						<%
						Loader ld = new Loader();
						DAO dao = new DAO();
						ArrayList<File> image = new ArrayList<File>();
						ArrayList <String> productIds = new ArrayList <String>();
						ArrayList<Product> pr = new ArrayList<Product>();
						ld.deleteImageInIndex();
						ld.imageSample();
						final File generalDirectory = new File(
								"C:\\Users\\Depittaz\\Desktop\\Online_Marketplace\\Campus-E-Store-1\\src\\main\\webapp\\img").getAbsoluteFile();
						String filePath = generalDirectory + "\\allImage\\";
						File dir = new File(filePath).getAbsoluteFile();
						File[] dirListing = dir.listFiles();
						if (dirListing != null) {
							for (File fl : dirListing) {
								image.add(fl);
							}
							Collections.shuffle(image);
							pr.addAll(dao.getAllProductDetails());
							Collections.shuffle(pr);
							for(File imageIndex : image){
								imageName = imageIndex.getName();
								for(Product details: pr){
									if(imageName.substring(0, 9).equals(details.getProductId())){
										productName = details.getProductName();
										productAmount = details.getProductAmount();
										productCategory = details.getProductCategory();
										productId = details.getProductId();
						%>
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/allImage/<%=imageName%>">
								<h5>
									<a href="ProductDetails?productId=<%=prodId%>"><%=productName%>
									</a>
								</h5>
							</div>
						</div>
						<%
									}
								}
							}
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
				<div class="row featured__filter products-content"
					id="product-lists">

					<%
					
					if (dirListing != null) {
						for (File fl : dirListing) {
							image.add(fl);
						}
						Collections.shuffle(image);
						Collections.shuffle(pr);
						for(File imageIndex : image){
							imageName = imageIndex.getName();
							for(Product details: pr){
								if(imageName.substring(0, 9).equals(details.getProductId())){
									productName = details.getProductName();
									productAmount = details.getProductAmount();
									productCategory = details.getProductCategory();
									productId = details.getProductId();
									if(productCategory.equalsIgnoreCase("Phones & Tablets") || productCategory.equalsIgnoreCase("Fashion") || productCategory.equalsIgnoreCase("Supermarket") || productCategory.equalsIgnoreCase("Jewelries")){
										if (productCategory.equals("Phones & Tablets")) {
											productCategory = "Phones";
										}
					%>

					<div
						class="col-lg-3 col-md-4 col-sm-6 mix product_items <%=productCategory%>">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="img/allImage/<%=imageName%>">

								<ul class="featured__item__pic__hover">
									<li><a href="ProductDetails?productId=<%=productId%>"><i
											class="fa-solid fa-paper-plane"></i></a></li>
								</ul>
							</div>

							<div class="featured__item__text">
								<h6>
									<a href="ProductDetails?productId=<%=productId%>"><%=productName%></a>
								</h6>
								<h5>
									&#8358;<span class="amount"><%=productAmount%></span>
								</h5>
							</div>
						</div>
					</div>
					<%
									}
								}
							}
						}
					} 
					%>

				</div>
				<!-- Product pagination -->
				<div class="product_pagination">
					<!--  		
             <li class="page-item previous-page disable"><a href="#" class="page_link"><i class="fa fa-long-arrow-left"></i></a></li>
             <li class="page-item current-page selected-page"><a href="#" class="page_link">1</a></li>
              <li class="page-item dots"><a href="#" class="page_link">...</a></li>
              <li class="page-item current-page"><a href="#" class="page_link">5</a></li>
              <li class="page-item current-page"><a href="#" class="page_link">6</a></li>
              
              <li class="page-item current-page"><a href="#" class="page_link">10</a></li>
              <li class="page-item next-page"><a href="#" class="page_link"><i class="fa fa-long-arrow-right"></i></a></li>
               -->
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

								<%
									for (int rept = 1; rept <= 5; rept++) {
								%>
								<div class="latest-prdouct__slider__item">
								<%
								if (dirListing != null) {
								    for (File fl : dirListing) {
								        image.add(fl);
								    }
								    Collections.shuffle(image);
								    pr.clear();
									pr.addAll(dao.filterImage1());
								    Collections.shuffle(pr);
								    int uniqueImageCount = 0; // initialize count to 0
								    for (File imageIndex : image) {
								        if (uniqueImageCount >= 3) { // print only 3 unique images
								            break;
								        }
								        imageName = imageIndex.getName();
								        for (Product details : pr) {
								            if (imageName.substring(0, 9).equals(details.getProductId())) {
								                productName = details.getProductName();
								                productAmount = details.getProductAmount();
								                productCategory = details.getProductCategory();
								                productId = details.getProductId();
								                %><a href="ProductDetails?productId=<%=productId%>" class="latest-product__item">
								                    <div class="latest-product__item__pic">
								                        <img src="img/allImage/<%=imageName%>" alt="" />
								                    </div>
								                    <div class="latest-product__item__text">
								                        <h6><%=productName%></h6>
								                        <span>&#8358;<%=productAmount%></span>
								                    </div>
								                </a>
								                <% 
								                uniqueImageCount++; // increment count for each unique image
								                break; // break out of the loop once a unique image is found
								            }
								        }
								    }
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

								<%
									for (int rept = 1; rept <= 5; rept++) {
								%>
								<div class="latest-prdouct__slider__item">
									<%
									if (dirListing != null) {
									    for (File fl : dirListing) {
									        image.add(fl);
									    }
									    Collections.shuffle(image);
									    pr.clear();
										pr.addAll(dao.filterImage2());
									    Collections.shuffle(pr);
									    int uniqueImageCount = 0; // initialize count to 0
									    for (File imageIndex : image) {
									        if (uniqueImageCount >= 3) { // print only 3 unique images
									            break;
									        }
									        imageName = imageIndex.getName();
									        for (Product details : pr) {
									            if (imageName.substring(0, 9).equals(details.getProductId())) {
									                productName = details.getProductName();
									                productAmount = details.getProductAmount();
									                productCategory = details.getProductCategory();
									                productId = details.getProductId();
									                %><a href="ProductDetails?productId=<%=productId%>" class="latest-product__item">
									                    <div class="latest-product__item__pic">
									                        <img src="img/allImage/<%=imageName%>" alt="" />
									                    </div>
									                    <div class="latest-product__item__text">
									                        <h6><%=productName%></h6>
									                        <span>&#8358;<%=productAmount%></span>
									                    </div>
									                </a>
									                <% 
									                uniqueImageCount++; // increment count for each unique image
									                break; // break out of the loop once a unique image is found
									            }
									        }
									    }
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

								<%
									for (int rept = 1; rept <= 5; rept++) {
								%>
								<div class="latest-prdouct__slider__item">
									<%
									if (dirListing != null) {
									    for (File fl : dirListing) {
									        image.add(fl);
									    }
									    Collections.shuffle(image);
									    pr.clear();
										pr.addAll(dao.filterImage3());
									    Collections.shuffle(pr);
									    int uniqueImageCount = 0; // initialize count to 0
									    for (File imageIndex : image) {
									        if (uniqueImageCount >= 3) { // print only 3 unique images
									            break;
									        }
									        imageName = imageIndex.getName();
									        for (Product details : pr) {
									            if (imageName.substring(0, 9).equals(details.getProductId())) {
									                productName = details.getProductName();
									                productAmount = details.getProductAmount();
									                productCategory = details.getProductCategory();
									                productId = details.getProductId();
									                %><a href="ProductDetails?productId=<%=productId%>" class="latest-product__item">
									                    <div class="latest-product__item__pic">
									                        <img src="img/allImage/<%=imageName%>" alt="" />
									                    </div>
									                    <div class="latest-product__item__text">
									                        <h6><%=productName%></h6>
									                        <span>&#8358;<%=productAmount%></span>
									                    </div>
									                </a>
									                <% 
									                uniqueImageCount++; // increment count for each unique image
									                break; // break out of the loop once a unique image is found
									            }
									        }
									    }
									}
									%>
								</div>
								<%
								}
								%>

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
								<a href="./index.jsp"> <img src="img/logo/projectLogo.PNG" alt="" style="height:80px;"/></a>
							</div>
							<ul>
								<li>Address: 4 Phase 3, After The Und St., Gwagwalada FCT.</li>
								<li>Phone: +08136793904, 08036770752</li>
								<li>Email: oniokikijesu04@gmail.com</li>
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

			<form action="AuthenticateServlet" method="post" class="modal-form" id="b-form">
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
				<a href="#" class="logo_link"> <img src="img/logo/projectLogo.PNG" alt="" style="height:80px;"/>
				</a>
				<h2 class="switch_title title click" id="click-me">Welcome Back
					!</h2>
				<p class="switch_description description">To keep connected with
					us please login with your email & password</p>
				<button class="switch_button button switch-btn">SIGN IN</button>
			</div>

			<div class="switch_container is-hidden" id="switch-c2">
				<a href="#" class="logo_link"> <img src="img/logo/projectLogo.PNG" alt="" style="height:80px;"/>
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
	<script src="${pageContext.request.contextPath}/js/product-filter.js"></script>
	<script src="${pageContext.request.contextPath}/js/ajax.js"></script>

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
    
 // Product Pagination Control

    function getPageList(totalPages, page, maxLength){
    	function range(start, end){
    		return Array.from(Array(end - start + 1), (_, i)=> i + start);
    	}
    	
    	var sideWidth = maxLength < 9 ? 1 : 2;
    	var leftWidth = (maxLength - sideWidth * 2 -3) >> 1;
    	var rightWidth = (maxLength - sideWidth * 2 -3) >> 1;
    	
    	if(totalPages <= maxLength){
    		return range(1, totalPages)
    	}
    	
    	if(page <= maxLength - sideWidth - 1 - rightWidth){
    		return range(1, maxLength - sideWidth -1).concat(0, range(totalPages - sideWidth + 1, totalPages));
    	}
    	
    	if(page >= totalPages -sideWidth - 1 - rightWidth){
    		return range(1, sideWidth).concat(0, range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages));
    	}
    	
    	return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
    }

    $(function(){
    	var numberOfItems = $(".products-content .product_items").length;
    	var limitPerPage = 8; //How many card items visible per a page
    	var totalPages = Math.ceil(numberOfItems / limitPerPage)
    	var paginationSize = 5; //How many page elements visible in the pagination
    	var currentPage;
    	
    	
    	function showPage(whichPage){
    		if(whichPage < 1 || whichPage > totalPages) return false;
    		
    		currentPage = whichPage;
    		
    		$(".products-content .product_items").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();
    		
    		$(".product_pagination li").slice(1, -1).remove();
    		
    		getPageList(totalPages, currentPage, paginationSize).forEach(item =>{
    			$("<li>").addClass("page-item").addClass(item ? "current-page" : "dots").toggleClass("selected-page", item === currentPage).append($("<a>").addClass("page_link")
    			.attr({href: "javascript:void(0)"}).text(item || "...")).insertBefore(".next-page");
    		});
    		
    		$(".previous-page").toggleClass("disable", currentPage ===1);
    		$(".next-page").toggleClass("disable", currentPage ===totalPages);
    		
    		return true;
    	}
    	
    	$(".product_pagination").append(
    		$("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page_link").attr({
    			href: "javascript:void(0)"}).text("").addClass("fa fa-long-arrow-left")),
    		$("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page_link").attr({
    			href: "javascript:void(0)"}).text("").addClass("fa fa-long-arrow-right"))
    	);
    	
    	$(".products-content").show();
    	showPage(1);
    	
    	$(document).on("click", ".product_pagination li.current-page:not(.selected-page)", function(){
    		return showPage(+$(this).text());
    	});
    	
    	$(".next-page").on("click", function(){
    		return showPage(currentPage + 1);
    	});
    	
    	$(".previous-page").on("click", function(){
    		return showPage(currentPage - 1);
    	});
    });
     	
    </script>
</body>
</html>