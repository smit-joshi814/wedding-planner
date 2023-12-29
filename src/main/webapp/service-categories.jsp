<%@page import="com.wedding.planning.system.config.Configurations" %> <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Service categories | <%=Configurations.name%></title>
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
              <form class="card">
                <div class="card-header">
                  <h3 class="card-title">Add Service Category</h3>
                </div>
                <div class="card-body">
                  <div class="mb-3">
                    <label class="form-label required">Service Category Name</label>
                    <div>
                      <input type="text" class="form-control" placeholder="Enter Service Category" required />
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-label required">Service Category Icon</label>
                    <div>
                      <input type="file" accept="image/*" class="form-control" placeholder="Upload Icon" required />
                    </div>
                  </div>
                  <div class="mb-3">
                    <label class="form-label">Status</label>
                    <div class="d-flex justify-content-around">
                      <label class="form-check">
                        <input class="form-check-input" name="service-status" type="radio" required />
                        <span class="form-check-label">Active</span>
                      </label>
                      <label class="form-check">
                        <input class="form-check-input" name="service-status" type="radio" checked required />
                        <span class="form-check-label">In Active</span>
                      </label>
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
                          <th><button class="table-sort" data-sort="sort-name">Category Name</button></th>
                          <th><button class="table-sort" data-sort="sort-status">Status</button></th>
                          <th><button class="table-sort" data-sort="sort-actions">Actions</button></th>
                        </tr>
                      </thead>
                      <tbody class="table-tbody">
                        <tr>
                          <td class="sort-id" class="text-secondary">1</td>
                          <td class="sort-name">
                            <div class="d-flex py-1 align-items-center">
                              <span class="avatar me-2" style="background-image: url(./static/categories/Vender_Venue.jpg)"></span>
                              <div class="flex-fill"><div class="font-weight-medium">Venues</div></div>
                            </div>
                          </td>

						  <td class="sort-status">
                            <div class="d-flex py-1 align-items-center">
                              <div class="flex-fill">
                                <div class="font-weight-medium"><span class="badge bg-success me-1"></span>&nbsp;Active</div>
                              </div>
                            </div>
                          </td>

                          <td class="sort-actions"><div class="btn-list flex-nowrap">
							<a href="#" class="btn"> Edit </a>
                              <a href="#" class="btn"> Delete </a>
                            </div></td>
                        </tr>

                        <tr>
                          <td class="sort-id" class="text-secondary">2</td>

                          <td class="sort-name">
                            <div class="d-flex py-1 align-items-center">
                              <span class="avatar me-2" style="background-image: url(./static/categories/Vender_Mackup.jpg)"></span>
                              <div class="flex-fill">
                                <div class="font-weight-medium">Makeup</div>
                              </div>
                            </div>
                          </td>

                          <td class="sort-status">
                            <div class="d-flex py-1 align-items-center">
                              <div class="flex-fill">
                                <div class="font-weight-medium"><span class="badge bg-warning me-1"></span>&nbsp;In Active</div>
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
                          <td class="sort-name">
                            <div class="d-flex py-1 align-items-center">
                              <span class="avatar me-2" style="background-image: url(./static/categories/vender_photography.jpg)"></span>
                              <div class="flex-fill">
                                <div class="font-weight-medium">Photography</div>
                              </div>
                            </div>
                          </td>
                          <td class="sort-status">
                            <div class="d-flex py-1 align-items-center">
                              <div class="flex-fill">
                                <div class="font-weight-medium"><span class="badge bg-success me-1"></span>&nbsp;Active</div>
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

                          <td class="sort-name">
                            <div class="d-flex py-1 align-items-center">
                              <span class="avatar me-2" style="background-image: url(./static/categories/Vendor_carting.jpg)"></span>
                              <div class="flex-fill">
                                <div class="font-weight-medium">Catering</div>
                              </div>
                            </div>
                          </td>

                          <td class="sort-status">
                            <div class="d-flex py-1 align-items-center">
                              <div class="flex-fill">
                                <div class="font-weight-medium"><span class="badge bg-success me-1"></span>&nbsp;Active</div>
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
            			<th><button class="table-sort">Id</button></th>
                        <th><button class="table-sort">Category Name</button></th>
                        <th></th><button class="table-sort">Status</button></th>
                        <th><button class="table-sort">Actions</button></th>
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
      document.addEventListener("DOMContentLoaded", function () {
        const list = new List("table-default", {
          sortClass: "table-sort",
          listClass: "table-tbody",
          valueNames: ["sort-id", "sort-name", "sort-status", "sort-action"],
        });
      });
    </script>

     <script type="text/javascript">
      $(document).ready(function () {
        $("#nav-manage").addClass("active");
        $("#service-categories").addClass("active");
      });
    </script>
  </body>
</html>
