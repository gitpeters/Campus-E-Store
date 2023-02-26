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
<link rel="shortcut icon" href="./img/logo/campus-e-stock-high-resolution-logo-white-on-transparent-background.png" type="image/x-icon" />
<title>Campus E-store || Blog</title>

<!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/signup.css"type="text/css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/* LOGIN/SIGN MODAL, MOBILE & LARGE SCREEN RESPONSIVENESS */

/* Medium Device = 1200px */
@media only screen and (min-width: 1200px){
  .main {
    transform: scale(1);
    left: 18%; 
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

.header__top__right__auth, .header__cart__price{
	cursor: pointer;
	transition: transform 300ms ease;
}
.header__top__right__auth:hover, .header__cart__price:hover{
	transform: scale(1.08);
}
.header__top__right__auth:hover span{
	color: #7fad39;
}

.form_input{
	padding-left: 20px;
}

.form-title{
	line-height: 1;
	margin: 15px 0;
}

.a-container .button{
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

.inputfile + label {
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

.no-js .inputfile + label {
    display: none;
}

.inputfile:focus + label,
.inputfile.has-focus + label {
    outline: 1px dotted #7fad39;
    outline: -webkit-focus-ring-color auto 5px;
}

.inputfile + label * {
    /* pointer-events: none; */
    /* in case of FastClick lib use */
}

.inputfile + label svg {
    width: 1em;
    height: 1em;
    vertical-align: middle;
    fill: currentColor;
    margin-top: -0.25em;
    /* 4px */
    margin-right: 0.25em;
    /* 4px */
}


.inputfile-2 + label {
    color: #7fad39;
    border: 2px solid #7fad39;
}

.inputfile-2:focus + label,
.inputfile-2.has-focus + label,
.inputfile-2 + label:hover {
    color: #722040;
}

</style>
</head>
<body>

 <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>
<div class="body-container" id="body-container">
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
      <div class="humberger__menu__logo">
        <a href="#"><img src="img/logo/campus-e-stock-high-resolution-logo-color-on-transparent-background.png" alt="" style= "height: 80px;"/></a>
      </div>
      <div class="humberger__menu__cart">

      </div>
      <div class="humberger__menu__widget">

        <div class="header__top__right__auth">
          <span onclick="signupToggle()"><i class="fa-solid fa-user"></i> Login</span>
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
         <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
         <a href="#"><i class="fa-brands fa-twitter"></i></a>
         <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
         <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
      </div>
      <div class="humberger__menu__contact">
        <ul>
          <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
          <li>Free Shipping for all Order of &#8358;10,000</li>
        </ul>
      </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
      <div class="header__top">
        <div class="container">
          <div class="row">
            <div class="col-lg-8">
              <div class="header__top__left">
                <ul>
                  <!-- <li><i class="fa fa-envelope"></i> hello@colorlib.com</li> -->
                  <marquee><li>Free Shipping for all Order of &#8358;10,000</li></marquee>
                </ul>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="header__top__right">
                <div class="header__top__right__social">
			         <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
			         <a href="#"><i class="fa-brands fa-twitter"></i></a>
			         <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
			         <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
                </div>
  
                <div class="header__top__right__auth">
                 <span onclick="signupToggle()"><i class="fa-solid fa-user"></i> Login</span>
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
              <a href="#"><img src="img/logo/campus-e-stock-high-resolution-logo-color-on-transparent-background.png" alt="" /></a>
            </div>
          </div>
          <div class="col-lg-6">
            <nav class="header__menu">
              <ul>
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./shop.jsp">Shop</a></li>

                <li class="active"><a href="./blog.jsp">Blog</a></li>
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
    <section class="hero hero-normal">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="hero__categories">
              <div class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span>All departments</span>
              </div>
              <ul>
                <li><a href="#">Fresh Meat</a></li>
                <li><a href="#">Vegetables</a></li>
                <li><a href="#">Fruit & Nut Gifts</a></li>
                <li><a href="#">Fresh Berries</a></li>
                <li><a href="#">Ocean Foods</a></li>
                <li><a href="#">Butter & Eggs</a></li>
                <li><a href="#">Fastfood</a></li>
                <li><a href="#">Fresh Onion</a></li>
                <li><a href="#">Papayaya & Crisps</a></li>
                <li><a href="#">Oatmeal</a></li>
                <li><a href="#">Fresh Bananas</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="hero__search">
              <div class="hero__search__form">
                <form action="#">

                  <input type="text" placeholder="What do yo u need?" />
                  <button type="submit" class="site-btn">SEARCH</button>
                </form>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>Blog</h2>
              <div class="breadcrumb__option">
                <a href="./index.jsp">Home</a>
                <span>Blog</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-5">
            <div class="blog__sidebar">
              <div class="blog__sidebar__search">
                <form action="#">
                  <input type="text" placeholder="Search..." />
                  <button type="submit">
                    <span class="icon_search"></span>
                  </button>
                </form>
              </div>
              <div class="blog__sidebar__item">
                <h4>Categories</h4>
                <ul>
                  <li><a href="#">All</a></li>
                  <li><a href="#">Beauty (20)</a></li>
                  <li><a href="#">Food (5)</a></li>
                  <li><a href="#">Life Style (9)</a></li>
                  <li><a href="#">Travel (10)</a></li>
                </ul>
              </div>
              <div class="blog__sidebar__item">
                <h4>Recent News</h4>
                <div class="blog__sidebar__recent">
                  <a href="#" class="blog__sidebar__recent__item">
                    <div class="blog__sidebar__recent__item__pic">
                      <img src="img/blog/sidebar/sr-1.jpg" alt="" />
                    </div>
                    <div class="blog__sidebar__recent__item__text">
                      <h6>
                        09 Kinds Of Vegetables<br />
                        Protect The Liver
                      </h6>
                      <span>MAR 05, 2019</span>
                    </div>
                  </a>
                  <a href="#" class="blog__sidebar__recent__item">
                    <div class="blog__sidebar__recent__item__pic">
                      <img src="img/blog/sidebar/sr-2.jpg" alt="" />
                    </div>
                    <div class="blog__sidebar__recent__item__text">
                      <h6>
                        Tips You To Balance<br />
                        Nutrition Meal Day
                      </h6>
                      <span>MAR 05, 2019</span>
                    </div>
                  </a>
                  <a href="#" class="blog__sidebar__recent__item">
                    <div class="blog__sidebar__recent__item__pic">
                      <img src="img/blog/sidebar/sr-3.jpg" alt="" />
                    </div>
                    <div class="blog__sidebar__recent__item__text">
                      <h6>
                        4 Principles Help You Lose <br />Weight With Vegetables
                      </h6>
                      <span>MAR 05, 2019</span>
                    </div>
                  </a>
                </div>
              </div>
              <div class="blog__sidebar__item">
                <h4>Search By</h4>
                <div class="blog__sidebar__item__tags">
                  <a href="#">Apple</a>
                  <a href="#">Beauty</a>
                  <a href="#">Vegetables</a>
                  <a href="#">Fruit</a>
                  <a href="#">Healthy Food</a>
                  <a href="#">Lifestyle</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-8 col-md-7">
            <div class="row">
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-2.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-3.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5><a href="#">Visit the clean farm in the US</a></h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-1.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5><a href="#">Cooking tips make cooking simple</a></h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-4.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5><a href="#">Cooking tips make cooking simple</a></h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-4.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5>
                      <a href="#"
                        >The Moment You Need To Remove Garlic From The Menu</a
                      >
                    </h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="blog__item">
                  <div class="blog__item__pic">
                    <img src="img/blog/blog-6.jpg" alt="" />
                  </div>
                  <div class="blog__item__text">
                    <ul>
                      <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                      <li><i class="fa fa-comment-o"></i> 5</li>
                    </ul>
                    <h5><a href="#">Cooking tips make cooking simple</a></h5>
                    <p>
                      Sed quia non numquam modi tempora indunt ut labore et
                      dolore magnam aliquam quaerat
                    </p>
                    <a href="#" class="blog__btn"
                      >READ MORE <span class="arrow_right"></span
                    ></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="product__pagination blog__pagination">
                  <a href="#">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
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
              <p>
                Get E-mail updates about our latest shop and special offers.
              </p>
              <form action="#">
                <input type="text" placeholder="Enter your mail" />
                <button type="submit" class="site-btn">Subscribe</button>
              </form>
              <div class="footer__widget__social">
                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-pinterest-p"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="footer__copyright">
              <div class="footer__copyright__text">
                <p>
                  
                  Copyright &copy;
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  All rights reserved | This project is made with
                  <i class="fa fa-heart" aria-hidden="true"></i> by
                  <a href="https://colorlib.com" target="_blank">18283177</a>
                
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
			<form action="SaveUserServlet" class="modal-form" id="a-form" enctype="multipart/form-data">
			<div class="close-modal" onclick="signupToggle()">Close</div>
				<h2 class="form-title title">Create Account</h2>
				<div class="form_icons"></div>
				
				<input type="text" class="form_input" placeholder="Name" required name="name" /> 
				<input type="email" class="form_input" placeholder="Email" required name="email"/> 
				<input type="text" class="form_input" placeholder="Student ID Number" required  name="student_id"/>
				<input type="password" class="form_input" placeholder="Password" required name="password"/>
				<input type="text" class="form_input" placeholder="Phone Number" required name="phone" />
				<div class="box">
					<input type="file" name="student_id_card" id="file-2" class="inputfile inputfile-2" data-multiple-caption="{count} files selected" multiple />
					<label for="file-2"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Upload Student ID Card&hellip;</span></label>
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
				<span class="form_span">or use your email account</span> 
				<input type="email" class="form_input" placeholder="Email" required name="username"/> 
				<input	type="password" class="form_input" placeholder="Password" required name="password"/>
				<a href="#" class="form_link">Forgot your password?</a>
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
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
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
    </script>
</body>
</html>