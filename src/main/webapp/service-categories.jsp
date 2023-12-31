<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.wedding.planning.system.model.ServiceCategories"%>
<%@page import="java.util.List"%>
<%@page import="com.wedding.planning.system.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Service categories | <%=Configurations.name%>
</title>
<jsp:include page="components/head-imports.jsp" />
</head>

<body>
	<div class="page">
		<jsp:include page="components/navbar.jsp" />

		<div class="page-wrapper">
			<!-- Page header -->
			<div class="page-header d-print-none">
				<div class="container-xl">
					<div class="row g-2 align-items-center">
						<div class="col">
							<div class="page-pretitle">Manage</div>
							<h2 class="page-title">Service Categories</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="col-md-6">
						<form class="card" id="add-service-category">
							<div class="card-header">
								<h3 class="card-title">Add Service Category</h3>
							</div>
							<div class="card-body">
								<div class="mb-3">
									<label class="form-label required">Service Category
										Name</label>
									<div>
										<input type="text" name="serviceCategoryName"
											class="form-control" placeholder="Enter Service Category"
											required />
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label required">Service Category
										Icon</label>
									<div>
										<input type="file" name="serviceCategoryIcon" accept="image/*"
											class="form-control" placeholder="Upload Icon" required />
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label">Status</label>
									<div class="d-flex justify-content-around">
										<label class="form-check"> <input
											class="form-check-input" name="isActive" value="1"
											type="radio" checked required /> <span
											class="form-check-label">Active</span>
										</label> <label class="form-check"> <input
											class="form-check-input" name="isActive" value="0"
											type="radio" required /> <span class="form-check-label">In
												Active</span>
										</label>
									</div>
								</div>
							</div>
							<div class="card-footer d-flex justify-content-between">
								<div class="d-none">
									<div id="add-service-category-msg"
										class="alert alert-important alert-dismissible" role="alert">
										<div class="d-flex">
											<i class="ti-check ti icon"></i>
											<div></div>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<button type="submit" class="btn btn-primary">Submit</button> 
									<div id="spinner-on-submit" class="d-none spinner-border spinner-border text-secondary ms-4" role="status"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div id="table-default" class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th><button class="table-sort" data-sort="sort-id">Id</button></th>
												<th><button class="table-sort" data-sort="sort-name">Category
														Name</button></th>
												<th><button class="table-sort" data-sort="sort-status">Status</button></th>
												<th><button class="table-sort" data-sort="sort-actions">Actions</button></th>
											</tr>
										</thead>
										<tbody class="table-tbody">
											<%
											List<ServiceCategories> categories = (List<ServiceCategories>) request.getAttribute("serviceCategories");
											for (ServiceCategories category : categories) {
											%>
											<tr>
												<td class="sort-id" class="text-secondary"><%=category.getServiceCategoryId()%></td>
												<td class="sort-name">
													<div class="d-flex py-1 align-items-center">
														<span class="avatar me-2"
															style="background-image: url(<%=category.getServiceCategoryIcon()%>)"></span>
														<div class="flex-fill">
															<div class="font-weight-medium"><%=category.getServiceCategoryName()%></div>
														</div>
													</div>
												</td>

												<td class="sort-status">
													<div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
															<div class="font-weight-medium">
																<span
																	class="badge <%=category.isActive() ? "bg-success" : "bg-danger"%> me-1"></span>&nbsp;<%=category.isActive() ? "Active" : "Deactive"%>
															</div>
														</div>
													</div>
												</td>

												<td class="sort-actions">
													<div class="btn-list flex-nowrap">
														<button
															data-id="<%=category.getServiceCategoryId()%>"
															class="btn edit-service-category">Edit</button>
														<button
															data-id="<%=category.getServiceCategoryId()%>"
															class="btn delete-service-category">Delete</button>
													</div>
												</td>
											</tr>
											<%
											}
											%>
										</tbody>
										<tfoot>
											<tr>
												<th><button class="table-sort" data-sort="sort-id">Id</button></th>
												<th><button class="table-sort" data-sort="sort-name">Category
														Name</button></th>
												<th><button class="table-sort" data-sort="sort-status">Status</button></th>
												<th><button class="table-sort" data-sort="sort-actions">Actions</button></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="components/footer.jsp" />
		</div>
	</div>
	<jsp:include page="components/footer-imports.jsp" />

	<!-- FILE SPECIFIC IMPORTS -->
	<script src="resources/js/api/manage/service-categories.js"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const list = new List("table-default", {
				sortClass : "table-sort",
				listClass : "table-tbody",
				valueNames : [ "sort-id", "sort-name", "sort-status",
						"sort-action" ],
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#nav-manage").addClass("active");
			$("#service-categories").addClass("active");
		});
	</script>
</body>
</html>