<%@page import="com.wedding.planner.repository.VendorRepository"%>
<%@page import="com.wedding.planner.entity.Vendor"%>
<%@page import="com.wedding.planner.enums.UserRole"%>
<%@page import="com.wedding.planner.entity.Users"%>
<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%
Users user = (Users) pageContext.getRequest().getAttribute("currentUser");
Vendor isVendor = (Vendor) pageContext.getRequest().getAttribute("isVendor");
%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Settings | <%=Configurations.name%>
</title>
<jsp:include page="components/head-imports.jsp" />
</head>
<body>
	<div class="page">
		<!-- Navbar -->
		<jsp:include page="components/navbar.jsp" />

		<div class="page-wrapper">
			<!-- Page header -->
			<div class="page-header d-print-none">
				<div class="container-xl">
					<div class="row g-2 align-items-center">
						<div class="col">
							<h2 class="page-title">Account Settings</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="card">
						<div class="row g-0">
							<div class="col-12 col-md-3 border-end">
								<jsp:include page="components/settings-sidebar.jsp" />
							</div>
							<div class="col-12 col-md-9 d-flex flex-column">
								<div class="card-body">
									<h2 class="mb-4">My Account</h2>
									<h3 class="card-title">Profile Details</h3>
									<div class="row align-items-center">
										<div class="col-auto">
											<%
											if (user.getAvatar() != null) {
											%>
											<span class="avatar avatar-xl"
												style="background-image: url(./static/avatars/000m.jpg)"></span>
											<%
											} else {
											%>
											<span class="avatar avatar-xl"><i class="ti ti-user"></i></span>
											<%
											}
											%>
										</div>
										<div class="col-auto">
											<a href="#" class="btn"> Change avatar </a>
										</div>
										<div class="col-auto">
											<a href="#" class="btn btn-ghost-danger"> Delete avatar </a>
										</div>
									</div>
									<h3 class="card-title mt-4"><%=user.getRole().equals(UserRole.ADMIN) ? "Admin" : "Business"%>
										Profile
									</h3>
									<div class="row g-3">
										<div class="col-md">
											<div class="form-label"><%=user.getRole().equals(UserRole.ADMIN) ? "Admin" : "Business"%>
												Name
											</div>
											<input type="text" class="form-control"
												value="<%=user.getFirstName() + " " + user.getLastName()%>">
										</div>
										<sec:authorize access="hasRole('VENDOR')">
											<div class="col-md">
												<div class="form-label">GST ID</div>
												<input type="text" class="form-control"
													value="<%=isVendor.getGstNumber()%>">
											</div>

											<div class="col-md">
												<div class="form-label">Location</div>
												<input type="text" class="form-control"
													value="<%=user.getAddress().get(0).getAddressLine1()%>">
											</div>
										</sec:authorize>
									</div>
									<h3 class="card-title mt-4">Email</h3>
									<p class="card-subtitle">This contact will be shown to
										others publicly, so choose it carefully.</p>
									<div>
										<div class="row g-2">
											<div class="col-auto">
												<input type="text" class="form-control w-auto"
													value="<%=user.getEmail()%>">
											</div>
											<div class="col-auto">
												<a href="#" class="btn"> Change </a>
											</div>
										</div>
									</div>
									<sec:authorize access="hasRole('ADMIN')">
										<h3 class="card-title mt-4">Password</h3>
										<p class="card-subtitle">You can set a permanent password
											if you don't want to use temporary login codes.</p>
										<div>
											<a href="#" class="btn"> Set new password </a>
										</div>
									</sec:authorize>
									<sec:authorize access="hasRole('VENDOR')">
										<h3 class="card-title mt-4">Accept Orders</h3>
										<p class="card-subtitle">accept the Orders for the
											services provided by you</p>
										<div>
											<label class="form-check form-switch form-switch-lg">
												<input class="form-check-input" type="checkbox"
												<%=isVendor.getAcceptOrders() ? "checked" : ""%>> <span
												class="form-check-label form-check-label-on">You're
													currently Accepting Orders</span> <span
												class="form-check-label form-check-label-off">You're
													currently Not Accepting Orders</span>
											</label>
										</div>
									</sec:authorize>
								</div>
								<div class="card-footer bg-transparent mt-auto">
									<div class="btn-list justify-content-end">
										<a href="#" class="btn"> Cancel </a> <a href="#"
											class="btn btn-primary"> Submit </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="components/footer.jsp" />
		</div>

	</div>
	<!-- Libs JS -->
	<!-- Tabler Core -->
	<jsp:include page="components/footer-imports.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {
			$("#my-account").addClass("active");
			$("#settings").addClass("active");
		});
	</script>
</body>
</html>