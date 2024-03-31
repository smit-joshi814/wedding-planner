<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Dashboard | <%=Configurations.NAME%> </title>
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
                <!-- Page pre-title -->
                <div class="page-pretitle">Overview</div>
                <h2 class="page-title">Dashboard</h2>
              </div>
            </div>
          </div>
        </div>
        <!-- Page body -->
        <div class="page-body">
          <div class="container-xl">
            <div class="row row-deck row-cards">
              <div class="col-sm-6 col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex align-items-center">
                      <div class="subheader">Sales</div>
                      <div class="ms-auto lh-1">
                        <div class="dropdown">
                          <a
                            class="dropdown-toggle text-secondary"
                            href="#"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >Last 7 days</a
                          >
                          <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item active" href="#"
                              >Last 7 days</a
                            >
                            <a class="dropdown-item" href="#">Last 30 days</a>
                            <a class="dropdown-item" href="#">Last 3 months</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="h1 mb-3">75%</div>
                    <div class="d-flex mb-2">
                      <div>Conversion rate</div>
                      <div class="ms-auto">
                        <span
                          class="text-green d-inline-flex align-items-center lh-1">
                          7%
                          <!-- Download SVG icon from http://tabler-icons.io/i/trending-up -->
                          <i class="ti-trending-up ti icon"></i>
                        </span>
                      </div>
                    </div>
                    <div class="progress progress-sm">
                      <div
                        class="progress-bar bg-primary progress-bar-striped progress-bar-animated"
                        style="width: 75%"
                        role="progressbar"
                        aria-valuenow="75"
                        aria-valuemin="0"
                        aria-valuemax="100"
                        aria-label="75% Complete">
                        <span class="visually-hidden">75% Complete</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex align-items-center">
                      <div class="subheader">Revenue</div>
                      <div class="ms-auto lh-1">
                        <div class="dropdown">
                          <a
                            class="dropdown-toggle text-secondary"
                            href="#"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >Last 7 days</a
                          >
                          <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item active" href="#"
                              >Last 7 days</a
                            >
                            <a class="dropdown-item" href="#">Last 30 days</a>
                            <a class="dropdown-item" href="#">Last 3 months</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                      <div class="h1 mb-0 me-2"><i class="ti-currency-rupee ti"></i>4,300</div>
                      <div class="me-auto">
                        <span
                          class="text-green d-inline-flex align-items-center lh-1">
                          8%
                          <!-- Download SVG icon from http://tabler-icons.io/i/trending-up -->
                          <i class="ti-trending-up ti icon"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div id="chart-revenue-bg" class="chart-sm"></div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex align-items-center">
                      <div class="subheader">New clients</div>
                      <div class="ms-auto lh-1">
                        <div class="dropdown">
                          <a
                            class="dropdown-toggle text-secondary"
                            href="#"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >Last 7 days</a
                          >
                          <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item active" href="#"
                              >Last 7 days</a
                            >
                            <a class="dropdown-item" href="#">Last 30 days</a>
                            <a class="dropdown-item" href="#">Last 3 months</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                      <div class="h1 mb-3 me-2">6,782</div>
                      <div class="me-auto">
                        <span
                          class="text-red d-inline-flex align-items-center lh-1">
                          10%
                          <!-- Download SVG icon from http://tabler-icons.io/i/trending-down -->
                          <i class="ti-trending-down ti icon"></i>
                        </span>
                      </div>
                    </div>
                    <div id="chart-new-clients" class="chart-sm"></div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex align-items-center">
                      <div class="subheader">Active users</div>
                      <div class="ms-auto lh-1">
                        <div class="dropdown">
                          <a
                            class="dropdown-toggle text-secondary"
                            href="#"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                            >Last 7 days</a
                          >
                          <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item active" href="#"
                              >Last 7 days</a
                            >
                            <a class="dropdown-item" href="#">Last 30 days</a>
                            <a class="dropdown-item" href="#">Last 3 months</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                      <div class="h1 mb-3 me-2">2,986</div>
                      <div class="me-auto">
                        <span
                          class="text-yellow d-inline-flex align-items-center lh-1">
                          0%
                          <!-- Download SVG icon from http://tabler-icons.io/i/minus -->
                          <i class="ti-minus ti icon"></i>
                        </span>
                      </div>
                    </div>
                    <div id="chart-active-users" class="chart-sm"></div>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <div class="row row-cards">
                  <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                            <span class="bg-primary text-white avatar">
                              <!-- Download SVG icon from http://tabler-icons.io/i/currency-rupee -->
                              <i class="ti-currency-rupee ti icon"></i>
                            </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">132 Sales</div>
                            <div class="text-secondary">
                              12 waiting payments
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                            <span class="bg-green text-white avatar">
                              <!-- Download SVG icon from http://tabler-icons.io/i/shopping-cart -->
                              <i class="ti-shopping-cart ti icon"></i>
                            </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">78 Orders</div>
                            <div class="text-secondary">32 Complete</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                            <span class="bg-primary text-white avatar">
                              <!-- Download SVG icon from http://tabler-icons.io/i/share -->
                              <i class="ti-share ti icon"></i>
                            </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">623 Shares</div>
                            <div class="text-secondary">16 today</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                      <div class="card-body">
                        <div class="row align-items-center">
                          <div class="col-auto">
                            <span class="bg-info text-white avatar">
                              <!-- Download SVG icon from http://tabler-icons.io/i/new-section -->
                              <i class="ti-new-section ti icon"></i>
                            </span>
                          </div>
                          <div class="col">
                            <div class="font-weight-medium">
                              Comming Soon...
                            </div>
                            <div class="text-secondary">-</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg">
                <div class="card">
                  <div class="card-body">
                    <h3 class="card-title">Traffic summary</h3>
                    <div id="chart-mentions" class="chart-lg"></div>
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
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-revenue-bg"), {
            chart: {
              type: "area",
              fontFamily: "inherit",
              height: 40.0,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            dataLabels: {
              enabled: false,
            },
            fill: {
              opacity: 0.16,
              type: "solid",
            },
            stroke: {
              width: 2,
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "Profits",
                data: [
                  37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35,
                  27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67,
                ],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: [tabler.getColor("primary")],
            legend: {
              show: false,
            },
          }).render();
      });
      // @formatter:on
    </script>
    <script>
      // @formatter:off
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-new-clients"), {
            chart: {
              type: "line",
              fontFamily: "inherit",
              height: 40.0,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            fill: {
              opacity: 1,
            },
            stroke: {
              width: [2, 1],
              dashArray: [0, 3],
              lineCap: "round",
              curve: "smooth",
            },
            series: [
              {
                name: "May",
                data: [
                  37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35,
                  27, 93, 53, 61, 27, 54, 43, 4, 46, 39, 62, 51, 35, 41, 67,
                ],
              },
              {
                name: "April",
                data: [
                  93, 54, 51, 24, 35, 35, 31, 67, 19, 43, 28, 36, 62, 61, 27,
                  39, 35, 41, 27, 35, 51, 46, 62, 37, 44, 53, 41, 65, 39, 37,
                ],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: [tabler.getColor("primary"), tabler.getColor("gray-600")],
            legend: {
              show: false,
            },
          }).render();
      });
      // @formatter:on
    </script>
    <script>
      // @formatter:off
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-active-users"), {
            chart: {
              type: "bar",
              fontFamily: "inherit",
              height: 40.0,
              sparkline: {
                enabled: true,
              },
              animations: {
                enabled: false,
              },
            },
            plotOptions: {
              bar: {
                columnWidth: "50%",
              },
            },
            dataLabels: {
              enabled: false,
            },
            fill: {
              opacity: 1,
            },
            series: [
              {
                name: "Profits",
                data: [
                  37, 35, 44, 28, 36, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35,
                  27, 93, 53, 61, 27, 54, 43, 19, 46, 39, 62, 51, 35, 41, 67,
                ],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              strokeDashArray: 4,
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
            ],
            colors: [tabler.getColor("primary")],
            legend: {
              show: false,
            },
          }).render();
      });
      // @formatter:on
    </script>
    <script>
      // @formatter:off
      document.addEventListener("DOMContentLoaded", function () {
        window.ApexCharts &&
          new ApexCharts(document.getElementById("chart-mentions"), {
            chart: {
              type: "bar",
              fontFamily: "inherit",
              height: 240,
              parentHeightOffset: 0,
              toolbar: {
                show: false,
              },
              animations: {
                enabled: false,
              },
              stacked: true,
            },
            plotOptions: {
              bar: {
                columnWidth: "50%",
              },
            },
            dataLabels: {
              enabled: false,
            },
            fill: {
              opacity: 1,
            },
            series: [
              {
                name: "Web",
                data: [
                  1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2, 12, 5, 8, 22, 6, 8, 6, 4, 1,
                  8, 24, 29, 51, 40, 47, 23, 26, 50, 26, 41, 22, 46, 47, 81, 46,
                  6,
                ],
              },
              {
                name: "Social",
                data: [
                  2, 5, 4, 3, 3, 1, 4, 7, 5, 1, 2, 5, 3, 2, 6, 7, 7, 1, 5, 5, 2,
                  12, 4, 6, 18, 3, 5, 2, 13, 15, 20, 47, 18, 15, 11, 10, 0,
                ],
              },
              {
                name: "Other",
                data: [
                  2, 9, 1, 7, 8, 3, 6, 5, 5, 4, 6, 4, 1, 9, 3, 6, 7, 5, 2, 8, 4,
                  9, 1, 2, 6, 7, 5, 1, 8, 3, 2, 3, 4, 9, 7, 1, 6,
                ],
              },
            ],
            tooltip: {
              theme: "dark",
            },
            grid: {
              padding: {
                top: -20,
                right: 0,
                left: -4,
                bottom: -4,
              },
              strokeDashArray: 4,
              xaxis: {
                lines: {
                  show: true,
                },
              },
            },
            xaxis: {
              labels: {
                padding: 0,
              },
              tooltip: {
                enabled: false,
              },
              axisBorder: {
                show: false,
              },
              type: "datetime",
            },
            yaxis: {
              labels: {
                padding: 4,
              },
            },
            labels: [
              "2020-06-20",
              "2020-06-21",
              "2020-06-22",
              "2020-06-23",
              "2020-06-24",
              "2020-06-25",
              "2020-06-26",
              "2020-06-27",
              "2020-06-28",
              "2020-06-29",
              "2020-06-30",
              "2020-07-01",
              "2020-07-02",
              "2020-07-03",
              "2020-07-04",
              "2020-07-05",
              "2020-07-06",
              "2020-07-07",
              "2020-07-08",
              "2020-07-09",
              "2020-07-10",
              "2020-07-11",
              "2020-07-12",
              "2020-07-13",
              "2020-07-14",
              "2020-07-15",
              "2020-07-16",
              "2020-07-17",
              "2020-07-18",
              "2020-07-19",
              "2020-07-20",
              "2020-07-21",
              "2020-07-22",
              "2020-07-23",
              "2020-07-24",
              "2020-07-25",
              "2020-07-26",
            ],
            colors: [
              tabler.getColor("primary"),
              tabler.getColor("primary", 0.8),
              tabler.getColor("green", 0.8),
            ],
            legend: {
              show: false,
            },
          }).render();
      });
      // @formatter:on
    </script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#nav-home").addClass("active");
      });
    </script>
  </body>
</html>