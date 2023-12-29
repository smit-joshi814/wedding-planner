<%@page import="com.wedding.planning.system.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>Sign up <%=Configurations.name%></title>
<jsp:include page="components/head-imports.jsp" />
</head>
<body class=" d-flex flex-column">
	<div class="page page-center">
		<div class="container container-tight py-4">
			<div class="text-center mb-4">
				<a href="#" class="navbar-brand navbar-brand-autodark"> <img
					src="<%=Configurations.logo%>" width="110" height="32" alt="Tabler"
					class="navbar-brand-image">
				</a>
			</div>
			<form class="card card-md" action="/home" method="get"
				autocomplete="off">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Create new account</h2>
					<div class="mb-3">
						<label class="form-label">Name</label> <input type="text"
							class="form-control" placeholder="Enter name" required>
					</div>
					<div class="mb-3">
						<label class="form-label">Email address</label> <input
							type="email" class="form-control" placeholder="Enter email"
							required>
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label>
						<div class="input-group input-group-flat">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" autocomplete="off"
								required> <span class="input-group-text"> <a
								class="link-secondary text-decoration-none" id="showPassword"
								title="Show password" data-bs-toggle="tooltip"> <!-- Download SVG icon from http://tabler-icons.io/i/eye -->
									<i id="eye-icon" class="ti ti-eye icon"></i></a></span>
						</div>
					</div>
					<div class="mb-3">
						<label class="form-check"> <input type="checkbox"
							class="form-check-input" /> <span class="form-check-label">Agree
								the <a href="terms-of-service.jsp" tabindex="-1">terms and
									policy</a>.
						</span>
						</label>
					</div>
					<div class="form-footer">
						<button type="submit" class="btn btn-primary w-100">Create
							new account</button>
					</div>
				</div>
			</form>
			<div class="text-center text-secondary mt-3">
				Already have account? <a href="/sign-in" tabindex="-1">Sign
					in</a>
			</div>
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