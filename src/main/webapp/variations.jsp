<%@page import="com.wedding.planning.system.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Variations | <%=Configurations.name%></title>

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
							<div class="page-pretitle">Manage</div>
							<h2 class="page-title">Variations</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="row g-5">
						<div class="col-xl-4">
							<form class="card">
								<div class="card-header">
									<h3 class="card-title">Add Variation</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Variation Name</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Variation Name" required />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required">Select Service
											Category</label> <select type="text" class="form-select"
											id="select-service-category" required>
											<option value>Select Service</option>
											<option value="2">Elon Musk</option>
										
										</select>
									</div>
								</div>
								<div class="card-footer text-end">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
						<div class="col-xl-4">
							<form class="card">
								<div class="card-header">
									<h3 class="card-title">Add Variation Option</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Select Variation</label> <select
											type="text" class="form-select" id="select-variation"
											required>
											<option value>Select Variation</option>
											<option value="2">Elon Musk</option>
											
										</select>
									</div>
									<div class="mb-3">
										<div class="form-label required">Variation Options</div>
										<select type="text" class="form-select" id="select-states"
											multiple required>
											<option value>Select Variation Options</option>
											<option value="AL">Alabama</option>
											
										</select>
									</div>
									<!-- Will be Included Dynamically-->
									<div class="mb-3">
										<label class="form-label required">Other</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Variation Option Name" required />
										</div>
									</div>

								</div>
								<div class="card-footer text-end">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>

					<div class="col-md-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div id="table-default" class="table-responsive">
									<table class="table">
										<thead>
											<tr>
											  <th><button class="table-sort" data-sort="sort-id">Id</button></th>
											  <th><button class="table-sort" data-sort="sort-Vname">Variation Name</button></th>
											  <th><button class="table-sort" data-sort="sort-Voption">Variation Option</button></th>
											  <th><button class="table-sort" data-sort="sort-category">Category</button></th>
											  <th><button class="table-sort" data-sort="sort-actions">Actions</button></th>
											</tr>
										  </thead>
										<tbody class="table-tbody">
											<tr>
												<td class="sort-id" class="text-secondary">1</td>
					  
												<td class="sort-Vname">
												  <div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
					  
												<td class="sort-Voption">
												  <div class="d-flex py-1 align-items-center">
													<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
												<td class="sort-category">
													<div class="d-flex py-1 align-items-center">
													  <div class="flex-fill">
														<div class="font-weight-medium">&nbsp;</div>
													  </div>
													</div>
												  </td>
					  
												<td class="sort-actions">
												  <div class="btn-list flex-nowrap">
													<a href="#" class="btn"> Edit </a>
													<a href="#" class="btn"> Delete </a>
												  </div>
												</td>
											  </tr>
											  <tr>
												<td class="sort-id" class="text-secondary">2</td>
					  
												<td class="sort-Vname">
												  <div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
					  
												<td class="sort-Voption">
												  <div class="d-flex py-1 align-items-center">
													<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
												<td class="sort-category">
													<div class="d-flex py-1 align-items-center">
													  <div class="flex-fill">
														<div class="font-weight-medium">&nbsp;</div>
													  </div>
													</div>
												  </td>
					  
												<td class="sort-actions">
												  <div class="btn-list flex-nowrap">
													<a href="#" class="btn"> Edit </a>
													<a href="#" class="btn"> Delete </a>
												  </div>
												</td>
											  </tr>
											  <tr>
												<td class="sort-id" class="text-secondary">3</td>
					  
												<td class="sort-Vname">
												  <div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
					  
												<td class="sort-Voption">
												  <div class="d-flex py-1 align-items-center">
													<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
												<td class="sort-category">
													<div class="d-flex py-1 align-items-center">
													  <div class="flex-fill">
														<div class="font-weight-medium">&nbsp;</div>
													  </div>
													</div>
												  </td>
					  
												<td class="sort-actions">
												  <div class="btn-list flex-nowrap">
													<a href="#" class="btn"> Edit </a>
													<a href="#" class="btn"> Delete </a>
												  </div>
												</td>
											  </tr>
											  <tr>
												<td class="sort-id" class="text-secondary">4</td>
					  
												<td class="sort-Vname">
												  <div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
					  
												<td class="sort-Voption">
												  <div class="d-flex py-1 align-items-center">
													<div class="flex-fill">
													  <div class="font-weight-medium">&nbsp;</div>
													</div>
												  </div>
												</td>
												<td class="sort-category">
													<div class="d-flex py-1 align-items-center">
													  <div class="flex-fill">
														<div class="font-weight-medium">&nbsp;</div>
													  </div>
													</div>
												  </td>
					  
												<td class="sort-actions">
												  <div class="btn-list flex-nowrap">
													<a href="#" class="btn"> Edit </a>
													<a href="#" class="btn"> Delete </a>
												  </div>
												</td>
											  </tr>
										
										
										</tbody>
										<tfoot>
											
												<tr>
												  <th><button class="table-sort" data-sort="sort-id">Id</button></th>
												  <th><button class="table-sort" data-sort="sort-Vname">Variation Name</button></th>
												  <th><button class="table-sort" data-sort="sort-Voption">Variation Option</button></th>
												  <th><button class="table-sort" data-sort="sort-category">Category</button></th>
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

	<script>
		// @formatter:off
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var el;
							window.TomSelect
									&& new TomSelect(
											(el = document
													.getElementById("select-service-category")),
											{
												copyClassesToDropdown : false,
												dropdownParent : "body",
												controlInput : "<input>",
												render : {
													item : function(data,
															escape) {
														if (data.customProperties) {
															return ('<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ "</span>"
																	+ escape(data.text) + "</div>");
														}
														return "<div>"
																+ escape(data.text)
																+ "</div>";
													},
													option : function(data,
															escape) {
														if (data.customProperties) {
															return ('<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ "</span>"
																	+ escape(data.text) + "</div>");
														}
														return "<div>"
																+ escape(data.text)
																+ "</div>";
													},
												},
											});
						});
		// @formatter:on
	</script>
	<script>
		// @formatter:off
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var el;
							window.TomSelect
									&& (new TomSelect(
											el = document
													.getElementById('select-states'),
											{
												copyClassesToDropdown : false,
												dropdownParent : 'body',
												controlInput : '<input>',
												render : {
													item : function(data,
															escape) {
														if (data.customProperties) {
															return '<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ '</span>'
																	+ escape(data.text)
																	+ '</div>';
														}
														return '<div>'
																+ escape(data.text)
																+ '</div>';
													},
													option : function(data,
															escape) {
														if (data.customProperties) {
															return '<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ '</span>'
																	+ escape(data.text)
																	+ '</div>';
														}
														return '<div>'
																+ escape(data.text)
																+ '</div>';
													},
												},
											}));
						});
		// @formatter:on
	</script>
	<script>
		// @formatter:off
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var el;
							window.TomSelect
									&& new TomSelect(
											(el = document
													.getElementById("select-variation")),
											{
												copyClassesToDropdown : false,
												dropdownParent : "body",
												controlInput : "<input>",
												render : {
													item : function(data,
															escape) {
														if (data.customProperties) {
															return ('<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ "</span>"
																	+ escape(data.text) + "</div>");
														}
														return "<div>"
																+ escape(data.text)
																+ "</div>";
													},
													option : function(data,
															escape) {
														if (data.customProperties) {
															return ('<div><span class="dropdown-item-indicator">'
																	+ data.customProperties
																	+ "</span>"
																	+ escape(data.text) + "</div>");
														}
														return "<div>"
																+ escape(data.text)
																+ "</div>";
													},
												},
											});
						});
		// @formatter:on
	</script>
	


<script>
	document.addEventListener("DOMContentLoaded", function () {
	  const list = new List("table-default", {
		sortClass: "table-sort",
		listClass: "table-tbody",
		valueNames: ["sort-id", "sort-Vname", "sort-Voption","sort-category", "sort-action"],
	  });
	});
  </script>

<script type="text/javascript">
	$(document).ready(function () {
	  $("#nav-manage").addClass("active");
	  $("#variations").addClass("active");
	});
  </script>

</body>

</html>