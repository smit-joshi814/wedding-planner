<%@page import="com.wedding.planning.system.config.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Services | <%=Configurations.name%></title>
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
							<h2 class="page-title">Services</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">

				<div class="container-xl">
					<div class="row g-5">
						<div class="col-md-6">
							<form class="card">
								<div class="card-header">
									<h3 class="card-title">Add Service</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Service Name</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Service" required />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required">Service Description</label>
										<div>
											<textarea id="tinymce-default" required>Hello, <b>Service  Description</b>!</textarea>
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label">Status</label>
										<div class="d-flex justify-content-around">
											<label class="form-check"> <input
												class="form-check-input" name="service-status" type="radio"
												checked required /> <span class="form-check-label">Active</span>
											</label> <label class="form-check"> <input
												class="form-check-input" name="service-status" type="radio"
												required /> <span class="form-check-label">In Active</span>
											</label>
										</div>
									</div>
								</div>
								<div class="card-footer text-end">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>

						</div>

						<div class="col-md-6">
							<form class="card">

								<div class="card-header">
									<h3 class="card-title">Add Service Item</h3>
								</div>
								<div class="card-body">
									<div class="mb-3">
										<label class="form-label required">Select Service</label> <select
											class="form-select" id="select-service" required>
											<option value>Select Service</option>
											<option value="2">Elon Musk</option>
											<option value="3">PaweÅ Kuna</option>
											<option value="4">Nikola Tesla</option>
											<option value="1">Chuck Tesla</option>
										</select>
									</div>
									<div class="mb-3">
										<label class="form-label required">Service Item Name</label>
										<div>
											<input type="text" class="form-control"
												placeholder="Enter Service Item Name" required />
										</div>
									</div>
									<div class="mb-3">
										<label class="form-label required">Approx. Price</label>
										<div class="input-group">
											<span class="input-group-text"> <i
												class="ti ti-currency-rupee icon"></i>
											</span> <input type="number" class="form-control"
												placeholder="Price" autocomplete="off" required />
										</div>
									</div>
								</div>
								<div class="card-footer text-end">
									<button type="submit" class="btn btn-primary">Submit</button>
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
													<th><button class="table-sort" data-sort="sort-name">Service
															Name</button></th>
													<th><button class="table-sort"
															data-sort="sort-description">Description</button></th>

													<th><button class="table-sort"
															data-sort="sort-created">Created By</button></th>
													<th><button class="table-sort" data-sort="sort-status">Status</button></th>
													<th><button class="table-sort"
															data-sort="sort-actions">Actions</button></th>
												</tr>
											</thead>
											<tbody class="table-tbody">
												<tr>
													<td class="sort-id" class="text-secondary">1</td>
													<td class="sort-name"><div class="flex-fill">
															<div class="font-weight-medium">Catering</div>
														</div>
														</div></td>

													<td class="sort-status">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">Providing food and
																	beverage services, menu planning, and catering staff
																	for the wedding event.</div>
															</div>
														</div>
													</td>
													<td class="sort-status">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">Ashok Varma</div>
															</div>
														</div>
													</td>
													<td class="sort-status">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">
																	<span class="badge bg-warning me-1"></span>&nbsp;In
																	Active
																</div>
															</div>
														</div>
													</td>

													<td class="sort-actions"><div
															class="btn-list flex-nowrap">
															<a href="#" class="btn"> Edit </a> <a href="#"
																class="btn"> Delete </a>
														</div></td>

												</tr>

												<tr>
													<td class="sort-id" class="text-secondary">2</td>
													<td class="sort-name"><div class="flex-fill">
															<div class="font-weight-medium">Bridal Makeup</div>
														</div>
														</div></td>

													<td class="sort-description">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">Providing
																	professional makeup artists and hairstylists for the
																	bride.</div>
															</div>
														</div>
													</td>
													<td class="sort-created">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">Ragini Mehta</div>
															</div>
														</div>
													</td>
													<td class="sort-status">
														<div class="d-flex py-1 align-items-center">
															<div class="flex-fill">
																<div class="font-weight-medium">
																	<span class="badge bg-success me-1"></span>&nbsp;Active
																</div>
															</div>
														</div>
													</td>

													<td class="sort-actions"><div
															class="btn-list flex-nowrap">
															<a href="#" class="btn"> Edit </a> <a href="#"
																class="btn"> Delete </a>
														</div></td>
												</tr>


											</tbody>
											<tfoot>
												<tr>
													<th><button class="table-sort" data-sort="sort-id">Id</button></th>
													<th><button class="table-sort" data-sort="sort-name">ServiceName</button></th>
													<th><button class="table-sort"
															data-sort="sort-description">Description</button></th>
													<th><button class="table-sort"
															data-sort="sort-created">Created By</button></th>
													<th><button class="table-sort" data-sort="sort-status">Status</button></th>
													<th><button class="table-sort"
															data-sort="sort-actions">Actions</button></th>
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
														.getElementById("select-service")),
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
			document
					.addEventListener(
							"DOMContentLoaded",
							function() {
								let options = {
									selector : '#tinymce-default',
									height : 300,
									menubar : false,
									statusbar : false,
									plugins : [
											'advlist autolink lists link image charmap print preview anchor',
											'searchreplace visualblocks code fullscreen',
											'insertdatetime media table paste code help wordcount' ],
									toolbar : 'undo redo | formatselect | '
											+ 'bold italic backcolor | alignleft aligncenter '
											+ 'alignright alignjustify | bullist numlist outdent indent | '
											+ 'removeformat',
									content_style : 'body { font-family: -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif; font-size: 14px; -webkit-font-smoothing: antialiased; }'
								}
								if (localStorage.getItem("tablerTheme") === 'dark') {
									options.skin = 'oxide-dark';
									options.content_css = 'dark';
								}
								tinyMCE.init(options);
							})
		</script>



		<script>
			document.addEventListener("DOMContentLoaded", function() {
				const list = new List("table-default", {
					sortClass : "table-sort",
					listClass : "table-tbody",
					valueNames : [ "sort-id", "sort-name", "sort-description",
							"sort-created", "sort-status", "sort-action" ],
				});
			});
		</script>

<script type="text/javascript">
	$(document).ready(function () {
	  $("#nav-manage").addClass("active");
	  $("#services").addClass("active");
	});
  </script>
</body>
</html>