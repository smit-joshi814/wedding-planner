<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Sign up <%=Configurations.name%></title>
<jsp:include page="components/head-imports.jsp" />
</head>
<body class="d-flex flex-column">
	<div class="page page-center">
		<div class="container py-4">
			<div class="text-center mb-4">
				<a href="#" class="navbar-brand navbar-brand-autodark"> <img
					src="<%=Configurations.logo%>" width="110" height="32" alt="Tabler"
					class="navbar-brand-image">
				</a>
			</div>
			<form class="card" action="add-new-bank" method="POST">
				<div class="card-header">
					<h3 class="card-title">Register as Vendor</h3>
				</div>
				<div class="card-body">
					<div class="mb-3">
						<h3 class="fw-light">Basic Info</h3>
					</div>
					<div class="row row-cards">
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">First Name</label> <input
									type="text" class="form-control" maxlength="30"
									placeholder="Name" name="first_name" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Last Name</label> <input
									type="text" class="form-control" maxlength="30"
									placeholder="Name" name="last_name" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Email address</label> <input
									type="email" class="form-control" placeholder="Email"
									name="email" maxlength="30" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Phone Number</label> <input
									type="number" class="form-control" maxlength="13"
									minlength="10" placeholder="Phone" name="phone" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Password</label> <input
									type="password" class="form-control" placeholder="Password"
									maxlength="30" name="password" required>
							</div>
						</div>
					</div>
					<div class="hr text-align-center w-50"></div>
					<div class="mb-3">
						<h2 class="fw-light">Business Details</h2>
					</div>
					<div class="row row-cards">
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Business Name</label> <input
									type="text" class="form-control" name="business_name"
									placeholder="Business Name" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Business Contact</label> <input
									type="number" class="form-control" name="business_contact"
									placeholder="Business Contact" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">GST Number</label> <input
									type="text" class="form-control" name="gst_number"
									placeholder="GST Number" required>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<h3 class="fw-light">Address Details</h3>
					</div>
					<div class="row row-cards">
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<div class="form-label required">State</div>
								<select class="form-select" name="state" required>
									<option selected>Gujarat</option>
									<option>Utter Pradesh</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<div class="form-label required">City</div>
								<select class="form-select" name="city" required>
									<option>Ahmedabad</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Address Line 1</label> <input
									type="text" class="form-control" name="address_line_1"
									placeholder="Address Line 1" required>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="mb-3">
								<label class="form-label required">Address Line 2</label> <input
									type="text" class="form-control" name="address_line_2"
									placeholder="Address Line 2" required>
							</div>
						</div>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div>
						<label class="form-check"> <input type="checkbox"
							class="form-check-input" required /> <span
							class="form-check-label required">Agree the <a
								href="/terms-of-service" tabindex="-1">terms and policy</a>.
						</span>
						</label>
					</div>
					<div>
						<button type="submit" class="btn btn-primary">Create new
							account</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="components/footer-imports.jsp"></jsp:include>

	<script type="text/javascript">
		// Password Box Visibility 
		$(document).ready(function() {
			$("#showPassword").on("click", function() {
				if ($("#password").attr("type") == "password") {
					$("#password").attr("type", "text");
					$("#eye-icon").removeClass("ti-eye");
					$("#eye-icon").addClass("ti-eye-closed");
				} else {
					$("#password").attr("type", "password");
					$("#eye-icon").removeClass("ti-eye-closed");
					$("#eye-icon").addClass("ti-eye");
				}
			});
		});
	</script>
</body>
</html>