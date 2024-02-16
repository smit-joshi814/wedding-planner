<%@page import="com.wedding.planner.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Forgot password | <%=Configurations.name%></title>
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
			<form class="card card-md" action="#" method="get" autocomplete="off">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Forgot password</h2>
					<p class="text-secondary mb-4">Enter your email address and
						your password will be reset and emailed to you.</p>
					<div class="mb-3">
						<label class="form-label">Email address</label> <input
							type="email" class="form-control" placeholder="Enter email" required>
					</div>
					<div class="form-footer">
						<button type="submit" class="btn btn-primary w-100"> <!-- Download SVG icon from http://tabler-icons.io/i/mail -->
							<i class="ti icon ti-mail"></i> Send me new password
						</button>
					</div>
				</div>
			</form>
			<div class="text-center text-secondary mt-3">
				Forget it, <a href="/sign-in">send me back</a> to the sign in
				screen.
			</div>
		</div>
	</div>
	<jsp:include page="components/footer-imports.jsp" />
</body>
</html>