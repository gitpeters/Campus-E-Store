<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Merchant Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/add-product.css"
	type="text/css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css"
	type="text/css" />
<link rel="shortcut icon" href="./img/logo/favicon.PNG"
	type="image/x-icon">
<!-- material icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Jquery -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	type="text/css" />
<!-- Fontawesome icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


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

@
keyframes loader { 0% {
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg);
	border: 4px solid #f44336;
	border-left-color: transparent;
}

50






%
{
-webkit-transform






:






rotate




(






180deg






)




;
transform






:






rotate




(






180deg






)




;
border






:






4px






solid






#673ab7




;
border-left-color






:






transparent




;
}
100






%
{
-webkit-transform






:






rotate




(






360deg






)




;
transform






:






rotate




(






360deg






)




;
border






:






4px






solid






#f44336




;
border-left-color






:






transparent




;
}
}
@
-webkit-keyframes loader { 0% {
	-webkit-transform: rotate(0deg);
	border: 4px solid #f44336;
	border-left-color: transparent;
}

50






%
{
-webkit-transform






:






rotate




(






180deg






)




;
border






:






4px






solid






#673ab7




;
border-left-color






:






transparent




;
}
100






%
{
-webkit-transform






:






rotate




(






360deg






)




;
border






:






4px






solid






#f44336




;
border-left-color






:






transparent




;
}
}
aside .logo img {
	width: 100%;
	height: auto;
}

.btn-primary, .btn-danger {
	background: #73b0ec;
	padding: 2px 6px;
	color: #fff;
	cursor: pointer;
	border-radius: 4px;
	transition: opacity 300ms ease;
}

.btn-danger {
	background: #ff7782;
}

.btn-primary:hover, .btn-danger:hover {
	opacity: 0.7;
}

.show-all {
	display: flex;
	padding-bottom: 2rem;
}

.list-page-number {
	display: flex;
}

.pageNumber {
	font-size: 16px;
	color: #fff;
	width: 50px;
	background: #57b952;
	padding: 2px 5px;
	border-radius: 8px;
	margin: 0 auto;
}

.pagination{
	margin-top: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.pagination li{
	margin: 0 20px;
	font-size: 18px;
	font-weight: 500;
}

.pagination li a:hover, .pagination li a:active{
	color: #57b952;
}

.pagination li a.active{
	color: #57b952;
}
</style>

</head>
<body>
	<%
	Vendor vendor = (Vendor) session.getAttribute("vendor");
	if (vendor.getVendorId() != null) {
	} else {
		response.sendRedirect("index.jsp");

	}
	%>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%
	HttpSession session1 = request.getSession();
	MessageReport m1 = (MessageReport) session1.getAttribute("report");
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
	/* session1 = request.getSession(false);
	if(session1!=null){
	    session1.removeAttribute("report");
	} */
	%>
	<div class="container">

		<!-- sidebar section -->
		<aside>
			<div class="top">
				<!-- logo -->
				<div class="logo" style="margin: 0 auto;">
					<img src="img/logo/projectLogo.PNG" style="height: 60px;" alt=""
						style="height: 80px;" />
				</div>

				<!-- hamburger -->
				<div class="close" id="close-btn">
					<img src="./img/close-icon.png" class="nav-icon" alt="">
				</div>
			</div>

			<!-- sidebar -->
			<div class="sidebar">
				<a href="merchant-dashboard.jsp"> <span class="material-icons">dashboard</span>
					<h3>Dashboard</h3>
				</a> <a href="#analytics"> <span class="material-icons">insights</span>
					<h3>Analytics</h3>
				</a> <a href="#messages"> <span class="material-icons">mail_outline</span>
					<h3>Messages</h3> <span class="message-count">20</span> <a
					href="#products"> <span class="material-icons">layers</span>
						<h3>Products</h3>
				</a> <a href="settings.jsp"> <span class="material-icons">settings</span>
						<h3>Settings</h3>
				</a> <a href="TableServlet" class="active"> <span
						class="material-icons">add</span>
						<h3>Add Products</h3>
				</a> <a href="Logout"> <span class="material-icons">logout</span>
						<h3>Logout</h3>
				</a>
			</div>
		</aside>
		<!--end of side bar-->
		<main>
			<h1>ADD PRODUCT</h1>
			<div class="date">
				<input type="date" name="date" id="date">
			</div>
			<!-- Products -->
			<div class="products">

				<!-- Product information -->
				<div>
					<h2 class="title">Product Information</h2>
					<form action="AddProduct" method="post"
						enctype="multipart/form-data">
						<div class="product-details">
							<input type="text" id="productName" class="product-info"
								name="productName" placeholder="Product Name" required /> <input
								type="text" id="productAmount" class="product-info"
								name="productAmount" placeholder="Product Amount" required /> <input
								type="hidden" id="VendorId" name="VendorId"
								value="<%=vendor.getVendorId()%>" /> <input type="hidden"
								id="productStatus" name="productStatus" value="Available" /> <select
								id="productCondition" name="productCondition"
								class="product-info" required>
								<option value="">Product Condition</option>
								<option value="New">New</option>
								<option value="Fairly Used">Fairly Used</option>
								<option value="Used">Used</option>
								<option value="Bad">Bad</option>
							</select>
							<textarea rows="1" cols="" placeholder="Search Keywords"
								class="product-info" name="searchKeyword"></textarea>
							<textarea rows="1" cols="" placeholder="Product Description"
								class="product-info" name="productDescription"></textarea>
							<!-- Product Category -->
							<div class="product-category-container">
								<div class="category-select-btn">
									<p class="btn-text" id="displaySelect">Select Product
										Category</p>
									<span class="arrow-down"><i
										class="fa-solid fa-chevron-down"></i></span>
								</div>

								<ul class="list-items categories">
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Supermarket">
										<p class="item-text">Supermarket</p></li>
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Health & Beauty">
										<p class="item-text">Health & Beauty</p></li>
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Home & Office">
										<p class="item-text">Home & Office</p></li>
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Phones & Tablets">
										<p class="item-text">Phones & Tablets</p></li>
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Computing">
										<p class="item-text">Computing</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" class="items categoryItem" id="item1"
										value="Electronics">
										<p class="item-text">Electronics</p></li>
									<li class="item"><input type="checkbox"
										name="productcategory" class="items categoryItem" id="item1"
										value="Fashion">
										<p class="item-text">Fashion</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="Baby Products"
										class="categoryItem">
										<p class="item-text">Baby Products</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="Gaming"
										class="categoryItem">
										<p class="item-text">Gaming</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="Automobile"
										class="categoryItem">
										<p class="item-text">Automobile</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="Jewelries"
										class="categoryItem">
										<p class="item-text">Jewelries</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="Accessories"
										class="categoryItem">
										<p class="item-text">Accessories</p></li>
									<li class="item"><input type='checkbox'
										name="productcategory" id="item1" value="others"
										class="categoryItem">
										<p class="item-text">Others</p></li>
								</ul>
							</div>

						</div>
						<!-- end of product information -->

						<!-- Product sample -->
						<div class="product-samples">
							<div>
								<div class="item add-product" onclick="productImage1()">
									<div class="complete">
										<span class="material-icons">add</span>
										<h3>Add Product Image (Main Image)</h3>
										<input type="file" class="image" hidden name="productImage1"
											id="image1" accept="image/*" onchange="loadFile1(event)" />
									</div>
								</div>
								<div class="product-sample-img">
									<img id="output1" />
								</div>
							</div>

							<div>
								<div class="item add-product" onclick="productImage2()">
									<div class="complete">
										<span class="material-icons">add</span>
										<h3>Add Product Image</h3>
										<input type="file" class="image" hidden name="productImage2"
											id="image2" accept="image/*" onchange="loadFile2(event)" />
									</div>
								</div>
								<div class="product-sample-img">
									<img id="output2" />
								</div>
							</div>

							<div>
								<div class="item add-product" onclick="productImage3()">
									<div class="complete">
										<span class="material-icons">add</span>
										<h3>Add Product Image</h3>
										<input type="file" class="image" hidden name="productImage3"
											id="image3" accept="image/*" onchange="loadFile3(event)" />
									</div>
								</div>
								<div class="product-sample-img">
									<img id="output3" />
								</div>
							</div>
						</div>

						<div class="submit-btn">
							<button type="submit" class="button">Submit</button>
						</div>
					</form>
				</div>
			</div>
			<!--End of Products -->
			<div></div>
			<!-- recent orders -->
			<div class="recent-orders table-responsive">
				<h2>Recent Orders</h2>
				<table id="invesment-history" class="table" style="width: 100%">
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

						<c:forEach var="product" items="${productLists}">
							<tr>
								<td>${product.getProductId()}</td>
								<td>${product.getProductName()}</td>
								<td>${product.getProductCondition()}</td>
								<td>${product.getProductCategory()}</td>
								<td>${product.getProductStatus()}</td>
								<td>
									<form action='VendorView' method='post'>
										<input type='hidden' name='productID'
											value='${product.getProductId()}' />
										<button type='submit' class='btn-primary'>View</button>
									</form>
								</td>
								<td>
								<td><form action='DeleteProduct' name='myform'>
										<input type='hidden' name='pId'
											value='${product.getProductId()}' />
										<button type='submit' class='btn-danger'>Delete</button>
									</form></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<ul class="pagination">
					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="TableServlet?page=${currentPage - 1}">Previous</a>
						</li>
					</c:if>

					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="page-item"><a class="page-link active"> ${i}
										<span class="sr-only">(current)</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="TableServlet?page=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt noOfPages}">
						<li class="page-item"><a class="page-link"
							href="TableServlet?page=${currentPage + 1}">Next</a>
						</li>
					</c:if>
				</ul>
				
				<br />
				<br />
				
			</div>
		</main>
		<!-- ============= END OF MAIN ===================== -->

		<div class="right">
			<div class="top">
				<button id="menu-btn">
					<span class="material-icons"> menu </span>
				</button>
				<div class="theme-toggler">
					<span class="material-icons active"> light_mode </span> <span
						class="material-icons"> dark_mode </span>
				</div>
				<div class="profile">
					<div class="info">
						<p>
							Hey, <b>Peters</b>
						</p>
						<small class="text-muted">Admin</small>
					</div>
					<div class="profile-photo">
						<img src="./img/profile.png" alt="">
					</div>
				</div>
			</div>
			<!-- END OF TOP -->
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/productImageSamples.js"></script>

	<script>
    /*------------------
   --------------------*/
  $(window).on("load", function () {
    $(".loader").fadeOut();
    $("#preloder").delay(200).fadeOut("slow");
  });
       
    </script>
	<script type="text/javascript">
    //Product category display
    const productCategorySelectBtn = document.querySelector(".category-select-btn"),
        productCategoryItem = document.querySelectorAll("#item1");
    productCategorySelectBtn.addEventListener("click", ()=>{
    	productCategorySelectBtn.classList.toggle("open");
    })
    productCategoryItem.forEach((items)=> {
    	items.addEventListener("click", ()=>{
	    	productCategorySelectBtn.classList.remove("open");
	    	productCategorySelectBtn.classList.toggle("close");
	    	console.log(items.value);
	    	document.getElementById("displaySelect").innerHTML=	items.value;
	    	
	    })
    })
    
   
    
    // LOGIN/REGISTRATION ALERT MESSAGE
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
    </script>

	<!--table pagination initialization-->
	<script
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
	
</body>
</html>