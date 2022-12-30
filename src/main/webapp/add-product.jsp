<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@page import="model.*"%>
    <%@page import="dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet"href="${pageContext.request.contextPath}/css/dashboard.css"type="text/css" />
    <link rel="shortcut icon" href="./img/estock1.png" type="image/x-icon">
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

.product{
	display: flex-row;
	
}

.product .product-samples {
  margin-top: 2rem;
}

.product .product-samples h2 {
  margin-bottom: 0.8rem;
}

.product .product-samples .item {
  background: var(--color-white);
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 0.7rem;
  padding: 1.4rem var(--card-padding);
  border-radius: var(--border-radius-3);
  box-shadow: var(--box-shadow);
  transition: all 300ms ease;
}

.product .product-samples .item:hover {
  box-shadow: none;
}

.product .product-samples{
	margin-top: 2rem;
	display: flex;
	justify-content: space-around;
}

.product .product-samples .add-product {
  background: transparent;
  border: 2px dashed var(--color-primary);
  color: var(--color-primary);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}
.product .product-samples .add-product div {
  display: flex;
  align-items: center;
  gap: 0.6rem;
}

.product .product-samples .add-product div h3 {
  font-weight: 600;
}

.product .product-details{
	display: flex;
	justify-content: space-around;
	margin-top: 2rem;
}

.product .product-details .product-info{
	width: 20rem;
	border:  2px solid var(--color-primary);
	outline: var(--color-primary);
	padding: 1rem;
	margin: 1rem;
}

.product .product-details .product-info:focus{
	border:  inset var(--color-primary);
}

.product .imagePreview .productImage img{
	max-width: 20rem;
    max-height: 20rem;
    object-fit: contain;
    border: none;
    outline: none;
}

.product .imagePreview{
	display: flex;
	justify-content: space-around;
	border: none;
    outline: none;
}

.product form .product-samples img{
	max-width: 20rem;
    max-height: 20rem;
    object-fit: contain;
    border: none;
    outline: none;
}

.product form .button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #04AA6D;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.product form .button:hover {background-color: #3e8e41}

.product form .button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>
<%! String vendorId, vendorName, vendorEmail, vendorMatricNo, vendorPassword, vendorBrandName, vendorSchoolId; %>
	<%
	/* ArrayList <Vendor> vendor = new ArrayList <Vendor>();
	vendor = (ArrayList<Vendor>)session.getAttribute("vendor");
		
		for (Vendor vn: vendor){
			vendorId = vn.getVendorId();
			vendorName = vn.getVendorName();
			vendorEmail = vn.getVendorEmail();
			vendorMatricNo = vn.getVendorMatricNo();
		} */
		
		vendorId = (String)session.getAttribute("vendor");
		
		if (vendorId != null){
			
		}else{
			response.sendRedirect("index.jsp");
		}
		
	%>
    <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>
    <div class="container">

        <!-- sidebar section -->
        <aside>
            <div class="top">
                <!-- logo -->
                <div class="logo">  
                    <img src="img/logo.png" id="logo" alt="logo">
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
                <a href="#add_product">
                    <span class="material-icons">add</span>
                    <h3>Add Products</h3>
                </a>
                <a href="#logout">
                    <span class="material-icons">logout</span>
                    <h3>Logout</h3>
                </a>
            </div>  
        </aside>
        <!--end of side bar-->
        <main>
        	<div class="product">
        		<form action="AddProduct" method="post" enctype="multipart/form-data">
        		<h2>Product Information</h2>
        		<div class="product-details">
        			
		        		<input type="text" id="productName" class="product-info" name="productName" placeholder="Product Name" required>
		        	   	<input type="text" id="productAmount" class="product-info" name="productAmount" placeholder="Product Amount" required>
		        	   	<input type="hidden" id="VendorId" name="VendorId" value="<%=vendorId %>">
		        	   	<input type="hidden" id="productStatus" name="productStatus" value="Available">
		        	   	<select id="productCondition" name="productCondition" class="product-info" required>
		        	   		<option value="">Product Condition</option>
		        	   		<option value="New">New</option>
		        	   		<option value="Fairly Used">Fairly Used</option>
		        	   		<option value="Used">Used</option>
		        	   		<option value="Bad">Bad</option>
		        	   	</select>
		        	   	<textarea rows="1" cols="" placeholder="Search Keywords" class="product-info" name="searchKeyword"></textarea>
		        	   	<textarea rows="1" cols="" placeholder="Product Description" class="product-info" name="productDescription"></textarea>
	        		
        		</div>
        		
        		<div class="product-samples">
        			<div>
	        			<div class="item add-product" onclick="productImage1()">
		                    <div class="complete">
		                        <span class="material-icons">add</span>
		                        <h3>Add Product Image</h3>
		                        <input type="file" class="image" hidden name="productImage1" id="image1" accept="image/*" onchange="loadFile1(event)">
		                    </div>
	                	</div>
	                	<img id="output1"/>
                	</div>
                	
                	<div>
	        			<div class="item add-product" onclick="productImage2()">
		                    <div class="complete">
		                        <span class="material-icons">add</span>
		                        <h3>Add Product Image</h3>
		                        <input type="file" class="image" hidden name="productImage2" id="image2" accept="image/*" onchange="loadFile2(event)">
		                    </div>
	                	</div>
	                	<img id="output2"/>
                	</div>
                	
                	<div>
	        			<div class="item add-product" onclick="productImage3()">
		                    <div class="complete">
		                        <span class="material-icons">add</span>
		                        <h3>Add Product Image</h3>
		                        <input type="file" class="image" hidden name="productImage3" id="image3" accept="image/*" onchange="loadFile3(event)">
		                    </div>
	                	</div>
	                	<img id="output3"/>
                	</div>
                	<button type="submit" class="button">SUbmit</button>
                	</form>
        		</div>
        		
        		<!-- <div class="imagePreview">
        			<div class="productImage">
        				<img id="output1"/>
        			</div>
        			<div class="productImage">
        				<img id="output2"/>
        			</div>
        			<div class="productImage">
        				<img id="output3"/>
        			</div>
        		</div> -->
        	</div>
           
           
            <!-- recent orders -->
            <div class="recent-orders">
                <h2>Recent Products</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Product Number</th>
                            <th>Payment</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
                        <tr>
                            <td>Cow meat (5kilos)</td>
                            <td>8993</td>
                            <td>Due</td>
                            <td class="warning">Pending</td>
                            <td class="primary">Details</td>
                        </tr>
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
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/js/.js"></script>
    <script src="${pageContext.request.contextPath}/js/productImageSamples.js"></script>
    
    <script>
    /*------------------
   --------------------*/
  $(window).on("load", function () {
    $(".loader").fadeOut();
    $("#preloder").delay(200).fadeOut("slow");

  });
    </script>
</body>
</html>