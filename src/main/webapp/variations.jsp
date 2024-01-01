<%@page import="java.util.Iterator"%>
<%@page import="com.wedding.planning.system.model.VariationOption"%>
<%@page import="com.wedding.planning.system.model.Variation"%>
<%@page import="java.util.List"%>
<%@page import="com.wedding.planning.system.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Variations | <%=Configurations.name%>
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
							<form class="card" id="add-variation">
								<div class="card-header">
									<h3 class="card-title">Add Variation</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Variation Name</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Variation Name" id="variation-name"
												name="variation-name" required />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required">Select Service
											Category</label> <select type="text" class="form-select"
											id="service-category" name="service-category" required>
											<option value>Select Service Category</option>
										</select>
									</div>
								</div>
								<div class="card-footer d-flex justify-content-between">
									<div class="d-none">
										<div id="add-variation-msg"
											class="alert alert-important alert-dismissible" role="alert">
											<div class="d-flex">
												<i class="ti-check ti icon"></i>
												<div></div>
											</div>
										</div>
									</div>
									<div class="d-flex align-items-center">
										<button type="submit" class="btn btn-primary">Submit</button>
										<div
											class="d-none spinner-show spinner-border spinner-border text-secondary ms-4"
											role="status"></div>
									</div>
								</div>
							</form>
						</div>
						<div class="col-xl-4">
							<form class="card" id="add-variation-option">
								<div class="card-header">
									<h3 class="card-title">Add Variation Option</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Select Variation</label> <select
											type="text" class="form-select" id="variations-select"
											name="variations-select" required>
											<option value>Select Variation</option>
										</select>
									</div>
									<div class="mb-3">
										<label class="form-label required">Variation Option</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Variation Option Name"
												id="variation-option-name" name="variation-option-name"
												required />
										</div>
									</div>
								</div>
								<div class="card-footer d-flex justify-content-between">
									<div class="d-none">
										<div id="add-variation-option-msg"
											class="alert alert-important alert-dismissible" role="alert">
											<div class="d-flex">
												<i class="ti-check ti icon"></i>
												<div></div>
											</div>
										</div>
									</div>
									<div class="d-flex align-items-center">
										<button type="submit" class="btn btn-primary">Submit</button>
										<div
											class="d-none spinner-show spinner-border spinner-border text-secondary ms-4"
											role="status"></div>
									</div>
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
												<th><button class="table-sort" data-sort="sort-id">Id</button>
												</th>
												<th><button class="table-sort" data-sort="sort-Vname">Variation
														Name</button></th>
												<th><button class="table-sort" data-sort="sort-Voption">Variation
														Option</button></th>
												<th><button class="table-sort"
														data-sort="sort-category">Category</button></th>
												<th><button class="table-sort" data-sort="sort-actions">Actions</button></th>
											</tr>
										</thead>
										<tbody class="table-tbody">

											<%
											List<Variation> variations = (List<Variation>) request.getAttribute("variationList");
											List<VariationOption> options = (List<VariationOption>) request.getAttribute("variationOptionList");
											for (Variation variation : variations) {
											%>
											<tr>
												<td class="sort-id" class="text-secondary"><%=variation.getVariationId()%></td>
												<td class="sort-Vname">
													<div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
															<div class="font-weight-medium"><%=variation.getVariationName()%></div>
														</div>
													</div>
												</td>

												<td class="sort-Voption">
													<div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
															<ul class="font-weight-medium list">
																<%
																for (VariationOption option : options) {
																	if (option.getVariationId().getVariationId() == variation.getVariationId())
																		out.print("<li class='list-item'>" + option.getVariationOptionName() + "</li>");
																}
																%>
															</ul>
														</div>
													</div>
												</td>
												<td class="sort-category">
													<div class="d-flex py-1 align-items-center">
														<div class="flex-fill">
															<div class="font-weight-medium"><%=variation.getServiceCategoryId().getServiceCategoryName()%></div>
														</div>
													</div>
												</td>

												<td class="sort-actions">
													<div class="btn-list flex-nowrap">
														<a href="#" class="btn"> Edit </a> <a href="#" class="btn">
															Delete </a>
													</div>
												</td>
											</tr>
											<%
											}
											%>
										</tbody>
										<tfoot>

											<tr>
												<th><button class="table-sort" data-sort="sort-id">Id</button>
												</th>
												<th><button class="table-sort" data-sort="sort-Vname">Variation
														Name</button></th>
												<th><button class="table-sort" data-sort="sort-Voption">Variation
														Option</button></th>
												<th><button class="table-sort"
														data-sort="sort-category">Category</button></th>
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
	<script src="resources/js/api/manage/variations.js"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const list = new List("table-default", {
				sortClass : "table-sort",
				listClass : "table-tbody",
				valueNames : [ "sort-id", "sort-Vname", "sort-Voption",
						"sort-category", "sort-action" ],
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#nav-manage").addClass("active");
			$("#variations").addClass("active");
		});
	</script>

</body>

</html>