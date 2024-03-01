<%@page import="com.wedding.planner.config.Configurations"%>
<header class="navbar navbar-expand-md d-print-none">
	<div class="container-xl">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbar-menu" aria-controls="navbar-menu"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<h1
			class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
			<a href="/home"> <img src="<%=Configurations.logo%>" width="110"
				height="32" alt="Tabler" class="navbar-brand-image" />
			</a>
		</h1>
		<div class="navbar-nav flex-row order-md-last">
			<div class="nav-item d-none d-md-flex me-3"></div>
			<div class="d-none d-md-flex">
				<a href="?theme=dark" class="nav-link px-0 hide-theme-dark"
					title="Enable dark mode" data-bs-toggle="tooltip"
					data-bs-placement="bottom"> <!-- Download SVG icon from http://tabler-icons.io/i/moon -->
					<i class="ti ti-moon icon"></i>
				</a> <a href="?theme=light" class="nav-link px-0 hide-theme-light"
					title="Enable light mode" data-bs-toggle="tooltip"
					data-bs-placement="bottom"> <!-- Download SVG icon from http://tabler-icons.io/i/sun -->
					<i class="ti ti-sun icon"></i>
				</a>
				<div class="nav-item dropdown d-none d-md-flex me-3">
					<a href="#" class="nav-link px-0" data-bs-toggle="dropdown"
						tabindex="-1" aria-label="Show notifications"> <!-- Download SVG icon from http://tabler-icons.io/i/bell -->
						<i class="ti ti-bell icon"></i> <span class="badge bg-red"></span>
					</a>
					<div
						class="dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Last updates</h3>
							</div>
							<div class="list-group list-group-flush list-group-hoverable">
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot status-dot-animated bg-red d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 1</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Change deprecated html tags to text decoration classes
												(#29604)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 2</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												justify-content:between justify-content:space-between
												(#29734)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions show"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 3</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Update change-version.js (#29736)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="list-group-item">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="status-dot status-dot-animated bg-green d-block"></span>
										</div>
										<div class="col text-truncate">
											<a href="#" class="text-body d-block">Example 4</a>
											<div class="d-block text-secondary text-truncate mt-n1">
												Regenerate package-lock.json (#29730)</div>
										</div>
										<div class="col-auto">
											<a href="#" class="list-group-item-actions"> <!-- Download SVG icon from http://tabler-icons.io/i/star -->
												<i class="ti-star ti icon"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-item dropdown">
				<a href="#" class="nav-link d-flex lh-1 text-reset p-0"
					data-bs-toggle="dropdown" aria-label="Open user menu"> <span
					class="avatar avatar-sm"
					style="background-image: url(static/avatars/000m.jpg);"></span>
					<div class="d-none d-xl-block ps-2">
						<div>Smit Joshi</div>
						<div class="mt-1 small text-secondary">Admin</div>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
					<a href="/my-account" id="settings" class="dropdown-item">Settings</a>
					<a href="/sign-in" class="dropdown-item">Logout</a>
				</div>
			</div>
		</div>
	</div>
</header>
<header class="navbar-expand-md">
	<div class="collapse navbar-collapse" id="navbar-menu">
		<div class="navbar">
			<div class="container-xl">
				<ul class="navbar-nav">
					<li class="nav-item" id="nav-home"><a class="nav-link"
						href="/home"> <span
							class="nav-link-icon d-md-none d-lg-inline-block"> <!-- Download SVG icon from http://tabler-icons.io/i/home -->
								<i class="ti icon ti-home"></i>
						</span> <span class="nav-link-title"> Home </span>
					</a></li>
					<li class="nav-item dropdown" id="nav-manage"><a
						class="nav-link dropdown-toggle" href="#navbar-base"
						data-bs-toggle="dropdown" data-bs-auto-close="outside"
						role="button" aria-expanded="false"> <span
							class="nav-link-icon d-md-none d-lg-inline-block"> <!-- Download SVG icon from http://tabler-icons.io/i/package -->
								<i class="ti icon ti-package"></i>
						</span> <span class="nav-link-title"> Manage </span>
					</a>
						<div class="dropdown-menu">
							<div class="dropdown-menu-columns">
								<div class="dropdown-menu-column">
									<a class="dropdown-item" id="service-categories"
										href="/service-categories"> Service Categories </a> <a
										class="dropdown-item" id="variations" href="/variations">
										Variations </a>
								</div>
								<div class="dropdown-menu-column">
									<a class="dropdown-item" id="services" href="/services">
										Services </a> <a class="dropdown-item" id="service-variation"
										href="/service-variation">Services Variations</a>
								</div>
							</div>
						</div></li>
					<li class="nav-item" id="vendors"><a class="nav-link"
						href="/vendors"> <span
							class="nav-link-icon d-md-none d-lg-inline-block"> <!-- Download SVG icon from http://tabler-icons.io/i/briefcase -->
								<i class="ti icon ti-briefcase"></i>
						</span> <span class="nav-link-title"> Vendors </span>
					</a></li>
					<li class="nav-item" id="chats"><a class="nav-link"
						href="/chats"> <span
							class="nav-link-icon d-md-none d-lg-inline-block"> <!-- Download SVG icon from http://tabler-icons.io/i/briefcase -->
								<i class="ti icon ti-message-circle"></i>
						</span> <span class="nav-link-title"> Chats </span>
					</a></li>
					<li class="nav-item dropdown" id="help"><a
						class="nav-link dropdown-toggle" href="#navbar-help"
						data-bs-toggle="dropdown" data-bs-auto-close="outside"
						role="button" aria-expanded="false"> <span
							class="nav-link-icon d-md-none d-lg-inline-block"> <!-- Download SVG icon from http://tabler-icons.io/i/lifebuoy -->
								<i class="ti icon ti-lifebuoy"></i>
						</span> <span class="nav-link-title"> Help </span>
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" id="documentation">
								Documentation </a> <a class="dropdown-item" href="logs" id="logs">
								Logs </a>
						</div></li>
				</ul>
				<div
					class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
					<form action="#" method="get" autocomplete="off" novalidate>
						<div class="input-icon">
							<span class="input-icon-addon"> <!-- Download SVG icon from http://tabler-icons.io/i/search -->
								<i class="ti icon ti-search"></i>
							</span> <input type="text" value="" class="form-control"
								placeholder="Search.." aria-label="Search in website" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>