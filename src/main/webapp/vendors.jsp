<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Vendors | <%=Configurations.name%></title>
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
              <h2 class="page-title">
                Vendors
              </h2>
              <div class="text-secondary mt-1">1-3 of 413 vendors</div>
            </div>
            <!-- Page title actions -->
            <div class="col-auto ms-auto d-print-none">
              <div class="d-flex">
                <input type="search" class="form-control d-inline-block w-9 me-3" placeholder="Search vendor " />
                <a href="#" class="btn btn-primary">
                  <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                  <i class="ti ti-search icon"></i>
                  New Vendor
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
            <div class="col-md-6 col-lg-3">
              <div class="card">
                <div class="card-body p-4 text-center">
                  <span class="avatar avatar-xl mb-3 rounded"
                    style="background-image: url(./static/avatars/000m.jpg)"></span>
                  <h3 class="m-0 mb-1"><a href="#">PaweÅ Kuna</a></h3>
                  <div class="text-secondary">&nbsp;</div>
                  <div class="mt-3">
                    <span class="badge bg-purple-lt">Owner</span>
                  </div>
                </div>
                <div class="d-flex">
                  <a href="#" class="card-btn"><!-- Download SVG icon from http://tabler-icons.io/i/mail -->
                    <i class="ti ti-mail icon"></i>&nbsp;
                    Email</a>
                  <a href="#" class="card-btn"><!-- Download SVG icon from http://tabler-icons.io/i/phone -->
                   <i class="ti ti-phone icon"></i>&nbsp;
                    Call</a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="card">
                <div class="card-body p-4 text-center">
                  <span class="avatar avatar-xl mb-3 rounded">RM</span>
                  <h3 class="m-0 mb-1"><a href="#">Ragini Maheta</a></h3>
                  <div class="text-secondary">Bridal Wear</div>
                  <div class="mt-3">
                    <span class="badge bg-green-lt">vendor</span>
                  </div>
                </div>
                <div class="d-flex">
                  <a href="#" class="card-btn"><!-- Download SVG icon from http://tabler-icons.io/i/mail -->
                    <i class="ti ti-mail icon"></i>&nbsp;
                    Email</a>
                  <a href="#" class="card-btn"><!-- Download SVG icon from http://tabler-icons.io/i/phone -->
                   <i class="ti ti-phone icon"></i>&nbsp;
                    Call</a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="card">
                <div class="card-body p-4 text-center">
                  <span class="avatar avatar-xl mb-3 rounded"
                    style="background-image: url(./static/avatars/002m.jpg)"></span>
                  <h3 class="m-0 mb-1"><a href="#">Ashok Verma</a></h3>
                  <div class="text-secondary">Venue Provider</div>
                  <div class="mt-3">
                    <span class="badge bg-green-lt">vendor</span>
                  </div>
                </div>
                <div class="d-flex">
                  <a href="#" class="card-btn">
                    <i class="ti ti-mail icon"></i>&nbsp;
                      Email</a>
                  <a href="#" class="card-btn">
                   <i class="ti ti-phone icon"></i>&nbsp;
                    Call</a>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex mt-4">
            <ul class="pagination ms-auto">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                  <!-- Download SVG icon from http://tabler-icons.io/i/chevron-left -->
                  <i class="ti ti-chevron-left icon"></i>
                  prev
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item "><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#">
                  next <!-- Download SVG icon from http://tabler-icons.io/i/chevron-right -->
                  <i class="ti ti-chevron-right icon"></i>
                </a>
              </li>
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
    $(document).ready(function () {
      $("#vendors").addClass("active");
    });
  </script>

</body>

</html>