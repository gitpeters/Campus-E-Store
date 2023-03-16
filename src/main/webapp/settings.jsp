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
	href="${pageContext.request.contextPath}/css/settings.css"
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


</head>
<body>
	<%
	Vendor vendor = (Vendor) session.getAttribute("vendor");
	Vendor vn = DAO.getVendor(vendor.getVendorEmail());
	%>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%
	HttpSession sn = request.getSession();
	MessageReport m1 = (MessageReport) sn.getAttribute("report");
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
	sn = request.getSession(false);
	if (sn != null) {
	sn.removeAttribute("msg");
	}
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
				</a> <a href="settings.jsp" class="active"> <span
						class="material-icons">settings</span>
						<h3>Settings</h3>
				</a> <a href="TableServlet"> <span class="material-icons">add</span>
						<h3>Add Products</h3>
				</a> <a href="Logout"> <span class="material-icons">logout</span>
						<h3>Logout</h3>
				</a>
			</div>
		</aside>
		<main>
			<div class="sub-nav">
				<ul class="nav" id="nav_bar">
					<li class="nav-links selected"><a href="#bio">Profile</a></li>
					<li class="nav-links"><a href="#security">Security</a></li>
					<li class="nav-links"><a href="#business">Business Name</a></li>
					<li class="nav-links"><a href="#language">Language</a></li>
				</ul>
			</div>
			<div class="setting-content">
				<!-- PROFILE -->
				<section class="profile-section" id="bio">
					<h2>Personal Information</h2>

					<div class="content-body">
						<table class="user-bio">
							<tr>
								<th>Name</th>
								<td><%=vn.getVendorName()%></td>
							</tr>
							<tr>
								<th>Email</th>
								<td><%=vn.getVendorEmail()%></td>
							</tr>
							<tr>
								<th>Matric Number</th>
								<td><%=vn.getVendorMatricNo()%></td>
							</tr>
							<tr>
								<th>Phone Number</th>
								<td><%=vn.getVendorPhone()%></td>
							</tr>


							<tr>
								<th>Brand Name</th>
								<td><%=vn.getVendorBrandName()%></td>
							</tr>
						</table>

						<form class="update-bio-form" action="UpdateBioServlet" method="post">
							<table>
								<tr>
									<th>Name</th>
									<td><input type="text" name=""
										placeholder="<%=vn.getVendorName()%>" readonly /></td>
								</tr>
								<tr>
									<th>Email</th>
									<td><input type="text" name=""
										placeholder="<%=vn.getVendorEmail()%>" readonly /></td>
								</tr>

								<tr>
									<th>Matric Number</th>
									<td><input type="text" name=""
										placeholder="<%=vn.getVendorMatricNo()%>" readonly /></td>
								</tr>
								<tr>
									<th>Phone Number</th>
									<td><input type="text" name="vendor_phone"
										value="<%=vn.getVendorPhone()%>" /></td>
								</tr>

								<tr>
									<th>Brand Name</th>
									<td><input type="text" name="vendor_brand_name"
										value="<%=vn.getVendorBrandName()%>"
										placeholder="Amazon Store" /></td>
								</tr>
							</table>
							<button type="submit" class="update-btn">Save update</button>
						</form>
						<button class="update-btn" id="updateBtn">Update Bio</button>
					</div>
				</section>
				<section class="security-section" id="security">
					<h2>
						Security: <span class="chage-password">Change Password</span>
					</h2>
					<div class="content-body">
						<form action="ChangePasswordServlet" class="security-form" method="post">
							<input type="password" name="old_password"
								placeholder="Enter old password" class="form-control" /> <input
								type="password" name="new_password"
								placeholder="Enter new password" class="form-control" />
							
							<button class="update-btn">Change Password</button>
						</form>
					</div>
				</section>
				<section class="business-section" id="business">
					<h2>
						Business Name: <span class="chage-password">Change Business
							Name</span>
					</h2>
					<div class="content-body">
						<form action="BrandNameServlet" method="post">
							<input type="text" name="vendor_brand_name"
								placeholder="Enter business name" class="form-control" />
							<button class="update-btn">Save Record</button>
						</form>
					</div>
				</section>
				<section class="language-section" id="language">
					<section class="page-not-found">
					<h1>Feature Coming Soon!</h1>
						<!-- img -->
						<img src="./img/419.png" alt="" />
						<!-- text -->
						
						<p>
							Sorry. Change of Language feature is coming soon..
						</p>
					</section>
				</section>
			</div>
		</main>

		<div class="right">
			<div class="top">
				<button id="menu-btn">
					<span class="material-icons"> menu </span>
				</button>
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
		$(window).on("load", function() {
			$(".loader").fadeOut();
			$("#preloder").delay(200).fadeOut("slow");
		});

		var link = document.getElementsByClassName("nav-links");
		var updateBtn = document.getElementById("updateBtn");
		var updateForm = document.querySelector(".update-bio-form");
		var bioInfo = document.querySelector(".user-bio");

		for (var i = 0; i < link.length; i++) {
			link[i].addEventListener("click", function() {
				var currentLink = document.getElementsByClassName("selected");
				currentLink[0].className = currentLink[0].className.replace(
						" selected", "");
				this.className += " selected";
			});
		}

		updateBtn.addEventListener("click", function() {
			updateForm.style.display = "block";
			updateBtn.style.display = "none";
			bioInfo.style.display = "none";
		})
		
		// ALERT MESSAGE
const close = document.querySelector(".close-alert");
 	const alertBox = document.querySelector(".alert");

 	close.onclick = ()=>{
 		alertBox.classList.add("hide");
	}
 	const myTimeout = setTimeout(hideAlert, 5000);
 	
 	function hideAlert(){
 		alertBox.classList.add("hide");
 	}
	</script>
</body>
</html>