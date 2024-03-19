<%@page import="com.wedding.planner.entity.Vendor"%>
<%@page import="java.util.List"%>
<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<Vendor> vendorList = (List<Vendor>) request.getAttribute("vendorList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Vendors | <%=Configurations.NAME%></title>
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
							<h2 class="page-title">Vendors</h2>
							<div class="text-secondary mt-1">1-3 of 413 vendors</div>
						</div>
						<!-- Page title actions -->
						<div class="col-auto ms-auto d-print-none">
							<div class="d-flex">
								<input type="search"
									class="form-control d-inline-block w-9 me-3"
									placeholder="Search vendor " /> <a href="#"
									class="btn btn-primary"> <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
									<i class="ti ti-search icon"></i> New Vendor
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="row row-cards">
						<%
						for (Vendor vendor : vendorList) {
						%>
						<div class="col-md-6 col-lg-3">
							<div class="card">
								<div class="card-body p-4 text-center">
									<span class="avatar avatar-xl mb-3 rounded"
										style="background-image: url(<%=vendor.getUser().getAvatar() != null ? vendor.getUser().getAvatar().getUrl() : Configurations.LOGO_COMPACT%>)"></span>
									<h3 class="m-0 mb-1">
										<a href="vendor?vendor=<%=vendor.getVendorId()%>"><%=vendor.getUser().getFirstName() + " " + vendor.getUser().getLastName()%></a>
									</h3>
									<div class="text-secondary"><%=vendor.getBusinessName()%></div>
									<div class="mt-3">
										<span class="badge bg-purple-lt">Vendor</span>
									</div>
								</div>
								<div class="d-flex">
									<%
									if (vendor.getApproved().equals(false)) {
									%>
									<a href="vendor/approve/<%=vendor.getVendorId()%>" class="card-btn">Approve &nbsp;<i
										class="ti ti-checks icon"></i></a>
									<%
									} else {
									%>
									<a href="mailto:<%=vendor.getUser().getEmail()%>"
										class="card-btn"> <i class="ti ti-mail icon"></i>&nbsp;
										Email
									</a> <a href="tel:<%=vendor.getBusinessContact()%>"
										class="card-btn"> <i class="ti ti-phone icon"></i>&nbsp;
										Call
									</a>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
					<div class="d-flex mt-4">
						<ul class="pagination ms-auto">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true"> <!-- Download SVG icon from http://tabler-icons.io/i/chevron-left -->
									<i class="ti ti-chevron-left icon"></i> prev
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item "><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">
									next <!-- Download SVG icon from http://tabler-icons.io/i/chevron-right -->
									<i class="ti ti-chevron-right icon"></i>
							</a></li>
						</ul>
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
			$("#vendors").addClass("active");
		});
	</script>

</body>

</html>