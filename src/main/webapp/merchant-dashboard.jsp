<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@page import="model.*"%>
    <%@page import="dao.*"%>
    <%@page import="imageLoader.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Merchant Dashboard</title>
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/dashboard.css"type="text/css" />
    <link rel="shortcut icon" href="./img/logo/campus-e-stock-high-resolution-logo-white-on-transparent-background.png" type="image/x-icon">
    <!-- material icon -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- Jquery -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" />
    <!-- Fontawesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/* Preloder */
#preloder {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 999999;
  background: #000;
}

.loader {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -13px;
  margin-left: -13px;
  border-radius: 60px;
  animation: loader 0.8s linear infinite;
  -webkit-animation: loader 0.8s linear infinite;
}

@keyframes loader {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
    border: 4px solid #f44336;
    border-left-color: transparent;
  }
  50% {
    -webkit-transform: rotate(180deg);
    transform: rotate(180deg);
    border: 4px solid #673ab7;
    border-left-color: transparent;
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
    border: 4px solid #f44336;
    border-left-color: transparent;
  }
}

@-webkit-keyframes loader {
  0% {
    -webkit-transform: rotate(0deg);
    border: 4px solid #f44336;
    border-left-color: transparent;
  }
  50% {
    -webkit-transform: rotate(180deg);
    border: 4px solid #673ab7;
    border-left-color: transparent;
  }
  100% {
    -webkit-transform: rotate(360deg);
    border: 4px solid #f44336;
    border-left-color: transparent;
  }
}
.container {
  display: grid;
  width: 96%;
  margin: 0 auto;
  gap: 1.8rem;
  grid-template-columns: 12rem auto 16rem;
}
aside .logo img {
  width: 100%;
  height: auto;
}

.alert{
	display: flex;
	flex-direction: row;
	padding: 15px 20px;
	width: 420px;
	position: absolute;
	right: 0px;
	top: 10px;
	border-radius: 4px;
	
	overflow: hidden;
}

.alert.show{
	animation: show_slide 1s ease forwards;
}

@keyframes show_slide{
	0%{
		transform: translateX(100%);
	}
	40%{
		transform: translateX(-10%);
	}
	80%{
		transform: translateX(0%);
	}
	100%{
		transform: translateX(-10px);
	}
}

	
.alert.hide{
	animation: hide_slide 1s ease forwards;
}

@keyframes hide_slide{
	0%{
		transform: translateX(-10px);
	}
	40%{
		transform: translateX(0%);
	}
	80%{
		transform: translateX(-10%);
	}
	100%{
		transform: translateX(100%);
	}
}



.alert-danger{
	border-left: 4px solid #ce8500;
}

.alert-success{
	border-left: 4px solid #014214;
}

.alert-danger{
	background-color: #ffdb9b;
	font-weight: bolder;
}

.alert-success{
	background: #d6fedf;
	font-weight: bolder;
}

.alert .alert-msg{
	padding: 0 20px;
	font-size: 18px;
}

.alert-danger .alert-msg{
	color: #ce8500;
}

.alert-success .alert-msg{
	color: #014214;
}

.alert .close-alert{
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	padding: 20px 18px;
	cursor: pointer;
}

.alert .close-alert:hover{
	opacity: 0.86;
}

.alert-success .close-alert{
	background:  #014214;
}

 .alert-success .close-alert span{
	color: #d6fedf;
	font-size: 22px;
	line-height: 40px;
	user-select: none;
}


.alert-danger .close-alert{
	background-color:  #ce8500;
}

.alert-danger .close-alert span{
	color: #ffdb9b;
	font-size: 22px;
	line-height: 40px;
}
.submit-btn, .del-btn{
	background: #73b0ec;
	padding: 2px 6px;
	color: #fff;
	cursor: pointer;
	border-radius: 4px;
	transition: opacity 300ms ease;
}

.del-btn{
	background: #ff7782;
}

.submit-btn:hover, .del-btn:hover{
	opacity:0.7; 
}

.call_action_popup{
	width: 300px;
	background: #fff;
	border-radius: 6px;
	position: absolute;
	top: 50%;
	left: 40%;
	transition: translate(-50%, -40%) scale(1);
	text-align: center;
	padding: 0 30px 0 30px;
	color: #333;
	box-shadow: 0 2px 8px rgba(0,0,0,0.2);
	transition: 300ms ease;
	visibility: visible;
	transition: transform 0.4s, top 0.4s;
}

.call_action_popup_hide{
	visibility: hidden;
}

.close-call_action_popup{
	visibility: hidden;
	top: 0;
	transition: translate(-20%, -50%) scale(0.1);
}

.call_action_popup h2{
	font-size: 20px;
	font-weight: 500px;
	margin: 30px 0 10px;
	background: #ff7782;
	color: #fff;
	position: absolute;
	width: 80%;
	top: -30%;
	border-radius: 5px;
}

.call_action_popup p{
	font-size: 18px;
	margin-top: 20px;
	font-weight: bolder;
	padding: 12px 0px;
}

.call_action_popup_btn{
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px; 
}

.call_action_popup_btn button{
	border: none;
	outline: none;
	cursor: pointer;
	margin: 0 15px;
	padding: 5px;
	width: 120px;
	border-radius: 5px;
	background: #57b952;
	color: #fff;
	font-size: 16px;
	font-weight: 500;
	transition: 300ms ease;
	box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.call_action_popup_btn .cancel-btn{
	background: #ff7782;
}



.call_action_popup button:hover{
	box-shadow: none;
}

/* ================== MEDIA QUERY ================= */

/* ================ Big Tablets & Small Laptops ========= */
@media screen and (max-width: 1200px) {
  .container {
    width: 94%;
    grid-template-columns: 7rem auto 23rem;
  }

  aside .sidebar h3 {
    display: none;
  }

  aside .sidebar a {
    width: 5.6rem;
  }

  aside .sidebar a:last-child {
    position: relative;
    margin-top: 1.8rem;
  }

  aside .logo span {
    display: none;
  }

  main .insights {
    grid-template-columns: 1fr;
    gap: 0;
  }

  main .recent-orders {
    width: 94%;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    margin: 2rem 0 0 8.8rem;
  }

  main .recent-orders table {
    width: 83vw;
    text-align: center;
  }

  main table thead tr th:nth-child(3),
  main table thead tr th:nth-child(4) {
    display: none;
  }

  main table tbody tr td:nth-child(3),
  main table tbody tr td:nth-child(4) {
    display: none;
  }
  
  main table thead tr th:last-child{
  	display: block;
  }
  
  main table tbody tr td:last-child{
  	display:block;
  }
}

/* ================ Small Tablets & Mobile ========= */

@media screen and (max-width: 768px) {
  .container {
    width: 100%;
    grid-template-columns: 1fr;
  }

  aside {
    position: fixed;
    left: -100%;
    background: var(--color-white);
    width: 18rem;
    z-index: 3;
    box-shadow: 1rem 3rem 4rem var(--color-light);
    height: 100vh;
    padding-right: var(--card-padding);
    display: none;
    animation: showMenu 400ms ease forwards;
  }

  aside .logo span {
    display: inline;
  }

  @keyframes showMenu {
    to {
      left: 0;
    }
  }
  aside .logo {
    margin-left: 1rem;
  }

  aside .sidebar h3 {
    display: inline;
  }

  aside .sidebar a {
    width: 100%;
    height: 3.4rem;
  }
  aside .sidebar a:last-child {
    position: absolute;
    bottom: 4rem;
  }

  aside .close {
    display: inline-block;
    cursor: pointer;
  }

  main {
    margin-top: 8rem;
    padding: 0 1rem;
  }

  main .recent-orders {
    position: relative;
    margin: 3rem 0 0 0;
    width: 100%;
  }

  main .recent-orders table {
    width: 100%;
    margin: 0;
  }

  .right {
    width: 94%;
    margin: 0 auto 4rem;
  }

  .right .top {
    position: fixed;
    top: 0;
    left: 0;
    align-items: center;
    padding: 0 0.8rem;
    height: 4.6rem;
    background: var(--color-white);
    width: 100%;
    margin: 0;
    z-index: 2;
    box-shadow: 0 1rem 1rem var(--color-light);
  }

  .right .top .theme-toggler {
    width: 4.4rem;
    position: absolute;
    left: 66%;
  }

  .right .profile .info {
    display: none;
  }

  .right .top button {
    display: inline-block;
    background: transparent;
    cursor: pointer;
    color: var(--color-dark);
    position: absolute;
    left: 1rem;
  }

  .right .top button span {
    font-size: 2rem;
  }

  .right .recent-updates {
    position: relative;
    margin-top: 40rem;
  }
  
  .call_action_popup{
  	left: 15%;
  	top: 70%;
  }
}

</style>


<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
</head>
<body>
<%! String productImage1="", productImage2="", productImage3="";%>
	<%
		HttpSession sessionV = request.getSession();
	
		Vendor vendor = (Vendor)sessionV.getAttribute("vendor");
		
		if (vendor.getVendorId() != null){
			
		}else{
			response.sendRedirect("index.jsp");
		}
		
		
		if(productImage1!=null && productImage1!=null && productImage3!=null){
			Loader loader = new Loader();
			loader.deleteProductImage();
		}
	%>

    <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>
    <%
    	HttpSession session1 = request.getSession();
		MessageReport m1 = (MessageReport) session1.getAttribute("msg");
		if (m1 != null) {
		%>
		<div class="alert alert-<%=m1.getMessageColor()%> show">
			<p class="alert-msg"><%=m1.getMessageContent()%></p>
			<div class="close-alert">
				<span>x</span>
			</div>
		</div>
		
		<%
		}
		session1 = request.getSession(false);
		if(session1!=null){
		    session1.removeAttribute("msg");
		}
		%>
    <div class="container">

        <!-- sidebar section -->
        <aside>
            <div class="top">
                <!-- logo -->
                <div class="logo">  
                    <img src="img/logo/campus-e-stock-high-resolution-logo-color-on-transparent-background.png" alt="" style= "height: 80px;"/>
                </div>

                 <!-- hamburger -->
                <div class="close" id="close-btn">
                    <img src="./img/close-icon.png" class="nav-icon" alt="">
                </div>
            </div>

            <!-- sidebar -->
            <div class="sidebar">
                <a href="/" class="active" >
                    <span class="material-icons">dashboard</span>
                    <h3>Dashboard</h3>
                </a>
                <a href="#analytics">
                    <span class="material-icons">insights</span>
                    <h3>Analytics</h3>
                </a>
                <a href="#messages">
                    <span class="material-icons">mail_outline</span>
                    <h3>Messages</h3>
                    <span class="message-count">20</span>
                <a href="#products">
                    <span class="material-icons">layers</span>
                    <h3>Products</h3>
                </a>
                <a href="#settings">
                    <span class="material-icons">settings</span>
                    <h3>Settings</h3>
                </a>
                <a href="add-product.jsp">
                    <span class="material-icons">add</span>
                    <h3>Add Products</h3>
                </a>
                <a href="Logout">
                    <span class="material-icons">logout</span>
                    <h3>Logout</h3>
                </a>
            </div>  
        </aside>
        <!--end of side bar-->
        <main>
            <h1>Dashboard</h1>
            <div class="date">
                <input type="date" name="date" id="date">
            </div>
            <!-- Insights -->
            <div class="insights">
                <div class="sales">
                    <span class="material-icons">analytics</span>
                    <div class="middle">
                        <div class="left">
                            <h3>Total sales</h3>
                            <h1>&#8358;879,800</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>81%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted">Last 24hrs</small>
                </div><!--End of sales-->
                <div class="expenses">
                    <span class="material-icons">bar_chart</span>
                    <div class="middle">
                        <div class="left">
                            <h3>Total Expenses</h3>
                            <h1>&#8358;79,400</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>21%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted">Last 24hrs</small>
                </div><!--End of expense-->
                <div class="income">
                    <span class="material-icons">stacked_line_chart</span>
                    <div class="middle">
                        <div class="left">
                            <h3>Total Income</h3>
                            <h1>&#8358;800,400</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>79%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted">Last 24hrs</small>
                </div><!--End of income-->
            </div>

            <!-- recent orders -->
            <div class="recent-orders">
                <h2>Recent Orders</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Product Condition</th>
                            <th>Product Category</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        List <Product> product = DAO.getProductByVendorID(vendor.getVendorId());
                        	if(product!=null){
                        		for(Product p:product){
                        			out.println("<tr><td>"+p.getProductId()+"</td><td>"+p.getProductName()+"</td><td>"+p.getProductCondition()+"</td><td>"+p.getProductCategory()+"</td><td>"+p.getProductStatus()+"</td><td><form action='VendorView' method='post'><input type='hidden' name='productID' value='"+p.getProductId()+"'/><button type='submit' class='submit-btn'>View</button></form></td><td><form action='DeleteProduct' name='myform' ><input type='hidden' name='pId' value='"+p.getProductId()+"'/><button type='submit'' class='del-btn'>Delete</button></form></td></tr>");
                        		}
                        		
                        	}else{
                        		out.println("<tr><td colspan='6'> No record available!</td></tr>");
                        	}
                        	
                        %>
                    </tbody>
                </table>
                <div class="show-all">
                    <a href="#show-all">Show All</a>
                </div>
            </div>
        </main>
        <!-- ============= END OF MAIN ===================== -->

        <div class="right">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons">
                        menu
                    </span>
                    </button>
                    <div class="theme-toggler">
                        <span class="material-icons active">
                            light_mode
                        </span>
                        <span class="material-icons">
                            dark_mode
                        </span>
                    </div>
                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>Peters</b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">
                            <img src="./img/profile.png" alt="">
                        </div>
                    </div>
            </div>
            <!-- END OF TOP -->
            <div class="recent-updates">
                <h2>Recent Updates</h2>
                <div class="updates">
                    <div class="update">
                        <div class="profile-photo">
                            <img src="./img/profile2.webp" alt="">
                        </div>
                        <div class="message">
                            <p><b>Mike Tyson</b>: received his order of Night Lion Tech GPS Drone</p>
                            <small class="text-muted">2 Minutes Ago</small>
                        </div>
                    </div>
                    <div class="update">
                        <div class="profile-photo">
                            <img src="./img/profile4.jpg" alt="">
                        </div>
                        <div class="message">
                            <p><b>Mike Tyson</b>: received his order of Night Lion Tech GPS Drone</p>
                            <small class="text-muted">2 Minutes Ago</small>
                        </div>
                    </div>
                    <div class="update">
                        <div class="profile-photo">
                            <img src="./img/profile.png" alt="">
                        </div>
                        <div class="message">
                            <p><b>Mike Tyson</b>: received his order of Night Lion Tech GPS Drone</p>
                            <small class="text-muted">2 Minutes Ago</small>
                        </div>
                    </div>
                </div>
            </div>
            <!--  --------------- END OF RECENT UPDATES -->

            <div class="sales-analytics">
                <h2>Sales Analytics</h2>
                <div class="item online">
                    <div class="icon">
                        <span class="material-icons">
                            shopping_cart
                        </span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>ONLINE ORDERS</h3>
                            <small class="text-muted">Last 24 hours</small>
                        </div>
                        <h5 class="success">+39%</h5>
                        <h3>3849</h3>
                    </div>
                </div>
                <div class="item offline">
                    <div class="icon">
                        <span class="material-icons">
                            local_mall
                        </span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>OFFLINE ORDERS</h3>
                            <small class="text-muted">Last 24 hours</small>
                        </div>
                        <h5 class="danger">-17%</h5>
                        <h3>1100</h3>
                    </div>
                </div>
                <div class="item customers">
                    <div class="icon">
                        <span class="material-icons">
                            person
                        </span>
                    </div>
                    <div class="right">
                        <div class="info">
                            <h3>NEW CUSTOMERS</h3>
                            <small class="text-muted">Last 24 hours</small>
                        </div>
                        <h5 class="success">+25%</h5>
                        <h3>849</h3>
                    </div>
                </div>
                <div class="item add-product">
                    <div>
                        <span class="material-icons">add</span>
                        <h3>Add Product</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="report"></div>
    
     <%
     	HttpSession session2 = request.getSession();
     	
		DeleteProductReport report = (DeleteProductReport) session2.getAttribute("report");
     	
     	String id = (String)session.getAttribute("pid");
		if (report!=null) {
		%>
		<div class="call_action_popup" id="popup">
		<h2><%=report.getMessageTitle() %></h2>
		<p><%=report.getMessageBody() %></p>
		<div class="call_action_popup_btn">
			<form action="ConfirmProductDelete" method="post">
				<input type="hidden" name="productId" value="<%=id %>"/>
				<button type="submit">Yes</button>
			</form>
			<button type="button" class="cancel-btn" onclick="hidePopup()">Cancel</button>
		</div>
	</div>
		
		<%
		}		
		session2 = request.getSession(false);
		if(session2!=null){
		    session2.removeAttribute("report");
		}

		%>
     
	

	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/js/.js"></script>
    
    <script>
    /*--------------------------------------*/
  $(window).on("load", function () {
    $(".loader").fadeOut();
    $("#preloder").delay(200).fadeOut("slow");

  });
    
//LOGIN/REGISTRATION ALERT MESSAGE
  const close = document.querySelector(".close-alert");
   	const alertBox = document.querySelector(".alert");
   	const inputField = document.querySelectorAll(".input-field");
   	const submitBtn = document.querySelector(".submit-btn");
   	

   	close.onclick = ()=>{
   		alertBox.classList.add("hide");
  	}
   	const myTimeout = setTimeout(hideAlert, 5000);
   	
   	function hideAlert(){
   		alertBox.classList.add("hide");
   	}
   	
   	
   	
   	function hidePopup(){document.querySelector('#popup').classList.add('close-call_action_popup');}
   	//window.onload = hidePopup();
    </script>
</body>
</html>