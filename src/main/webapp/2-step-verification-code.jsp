<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>2 Step Verification Code | <%=Configurations.NAME%></title>
<jsp:include page="components/head-imports.jsp" />
</head>
  <body  class=" d-flex flex-column">
    <script src="./dist/js/demo-theme.min.js?1692870487"></script>
    <div class="page page-center">
      <div class="container container-tight py-4">
        <div class="text-center mb-4">
          <a href="." class="navbar-brand navbar-brand-autodark">
            <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
          </a>
        </div>
        <form
	class="card card-md"
	action="./"
	method="get"
	autocomplete="off"
	novalidate
>
          <div class="card-body">
            <h2 class="card-title card-title-lg text-center mb-4">Authenticate Your Account</h2>
            <p class="my-4 text-center">Please confirm your account by entering the authorization code sent to <strong>+1 856-672-8552</strong>.</p>
            <div class="my-5">
              <div class="row g-4">
                <div class="col">
                  <div class="row g-2">
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="row g-2">
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                    <div class="col">
                      <input type="text" class="form-control form-control-lg text-center py-3" maxlength="1" inputmode="numeric" pattern="[0-9]*" data-code-input />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="my-4">
              <label class="form-check">
                <input type="checkbox" class="form-check-input" />
                Dont't ask for codes again on this device
              </label>
            </div>
            <div class="form-footer">
              <div class="btn-list flex-nowrap">
                <a href="./2-step-verification.html" class="btn w-100">
                  Cancel
                </a>
                <a href="#" class="btn btn-primary w-100">
                  Verify
                </a>
              </div>
            </div>
          </div>
        </form>
        <div class="text-center text-secondary mt-3">
          It may take a minute to receive your code. Haven't received it? <a href="./">Resend a new code.</a>
        </div>
      </div>
    </div>
    <!-- Libs JS -->
    <!-- Tabler Core -->
    <jsp:include page="components/footer-imports.jsp" />
    <script>
      document.addEventListener("DOMContentLoaded", function() {
      	var inputs = document.querySelectorAll('[data-code-input]');
      	// Attach an event listener to each input element
      	for(let i = 0; i < inputs.length; i++) {
      		inputs[i].addEventListener('input', function(e) {
      			// If the input field has a character, and there is a next input field, focus it
      			if(e.target.value.length === e.target.maxLength && i + 1 < inputs.length) {
      				inputs[i + 1].focus();
      			}
      		});
      		inputs[i].addEventListener('keydown', function(e) {
      			// If the input field is empty and the keyCode for Backspace (8) is detected, and there is a previous input field, focus it
      			if(e.target.value.length === 0 && e.keyCode === 8 && i > 0) {
      				inputs[i - 1].focus();
      			}
      		});
      	}
      });
    </script>
  </body>
</html>