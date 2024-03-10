<%@page import="com.wedding.planner.config.general.Configurations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Chats | <%=Configurations.name%>
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
							<h2 class="page-title">Chat</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- Page body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="card">
						<div class="row g-0">
							<div class="col-12 col-lg-5 col-xl-3 border-end">
								<div class="card-header d-none d-md-block">
									<div class="input-icon">
										<span class="input-icon-addon"> <!-- Download SVG icon from http://tabler-icons.io/i/search -->
											<i class="ti ti-search icon"></i>&nbsp;
										</span> <input type="text" value="" class="form-control"
											placeholder="Search " aria-label="Search" />
									</div>
								</div>
								<div class="card-body p-0 scrollable" style="max-height: 35rem">
									<div class="nav flex-column nav-pills" role="tablist">
										<a href="#chat-1"
											class="nav-link text-start mw-100 p-3 active" id="chat-1-tab"
											data-bs-toggle="pill" role="tab" aria-selected="true">
											<div class="row align-items-center flex-fill">
												<div class="col-auto">
													<span class="avatar"
														style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
												</div>
												<div class="col text-body">
													<div>Anjali Sharma</div>
													<div class="text-secondary text-truncate w-100">Sure
														Pawe, let me pull the latest updates.</div>
												</div>
											</div>
										</a> <a href="#chat-1" class="nav-link text-start mw-100 p-3"
											id="chat-1-tab" data-bs-toggle="pill" role="tab"
											aria-selected="true">
											<div class="row align-items-center flex-fill">
												<div class="col-auto">
													<span class="avatar">TM</span>
												</div>
												<div class="col text-body">
													<div>Tejasv Modi</div>
													<div class="text-secondary text-truncate w-100">I'm
														on it too </div>
												</div>
											</div>
										</a> <a href="#chat-1" class="nav-link text-start mw-100 p-3"
											id="chat-1-tab" data-bs-toggle="pill" role="tab"
											aria-selected="true">
											<div class="row align-items-center flex-fill">
												<div class="col-auto">
													<span class="avatar">MV</span>
												</div>
												<div class="col text-body">
													<div>Mamta Vala</div>
													<div class="text-secondary text-truncate w-100">
														I see you've refactored the
														<code>calculateStatistics</code>
														function. The code is much cleaner now.
													</div>
												</div>
											</div>
										</a> <a href="#chat-1" class="nav-link text-start mw-100 p-3"
											id="chat-1-tab" data-bs-toggle="pill" role="tab"
											aria-selected="true">
											<div class="row align-items-center flex-fill">
												<div class="col-auto">
													<span class="avatar">NB</span>
												</div>
												<div class="col text-body">
													<div>Nikita Bhatiya </div>
													<div class="text-secondary text-truncate w-100">Yes,
														I thought it was getting a bit cluttered.</div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="col-12 col-lg-7 col-xl-9 d-flex flex-column">
								<div class="card-body scrollable" style="height: 35rem">
									<div class="chat">
										<div class="chat-bubbles">
										
											<div class="chat-item">
												<div class="row align-items-end">
													<div class="col-auto">
														<span class="avatar"
															style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
													</div>
													<div class="col col-lg-6">
														<div class="chat-bubble">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Anjali Sharma</div>
																	<div class="col-auto chat-bubble-date">09:34</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Hi </p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:42</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Hi </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end">
													<div class="col-auto">
														<span class="avatar"
															style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
													</div>
													<div class="col col-lg-6">
														<div class="chat-bubble">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Anjali Sharma</div>
																	<div class="col-auto chat-bubble-date">09:44</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>What kind of Bridel wears your shop provide</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:46</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Bridal Lehengas </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:46</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Silk Sarees </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:47</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Wedding Gowns</p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:47</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Trouseau Sarees </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end">
													<div class="col-auto">
														<span class="avatar"
															style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
													</div>
													<div class="col col-lg-6">
														<div class="chat-bubble">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Anjali Sharma</div>
																	<div class="col-auto chat-bubble-date">09:49</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Can You send me some photos ?</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:50</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Yeah Sure </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:51</div>
																</div>
															</div>
															<div class="chat-bubble-body">
															
																<div class="mt-2">
																	<img
																		src="static/vendor/inspiration_feed_dress_4.jpg" height=250px>
																</div>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
														>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end">
													<div class="col-auto">
														<span class="avatar"
															style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
													</div>
													<div class="col col-lg-6">
														<div class="chat-bubble">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Anjali Sharma</div>
																	<div class="col-auto chat-bubble-date">09:51</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Any Other </p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end justify-content-end">
													<div class="col col-lg-6">
														<div class="chat-bubble chat-bubble-me">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Ragini Mehta</div>
																	<div class="col-auto chat-bubble-date">09:52</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Wait A Minute </p>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<span class="avatar"
															>RM</span>
													</div>
												</div>
											</div>
											<div class="chat-item">
												<div class="row align-items-end">
													<div class="col-auto">
														<span class="avatar"
															style="background-image: url(./static/vendor/chat_avatar_2.jpg)"></span>
													</div>
													<div class="col col-lg-6">
														<div class="chat-bubble">
															<div class="chat-bubble-title">
																<div class="row">
																	<div class="col chat-bubble-author">Anjali Sharma</div>
																	<div class="col-auto chat-bubble-date">09:54</div>
																</div>
															</div>
															<div class="chat-bubble-body">
																<p>Ok Sure </p>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											
										</div>
									</div>
								</div>
								<div class="card-footer">
									<div class="input-group input-group-flat">
										<input type="text" class="form-control" autocomplete="off"
											placeholder="Type message" /> <span class="input-group-text">
											<a href="#" class="link-secondary" data-bs-toggle="tooltip"
											aria-label="Clear search" title="Clear search"> <!-- Download SVG icon from http://tabler-icons.io/i/mood-smile -->
											<i class="ti ti-mood-smile icon"></i>&nbsp;
										</a> <a href="#" class="link-secondary ms-2"
											data-bs-toggle="tooltip" aria-label="Add notification"
											title="Add notification"> <!-- Download SVG icon from http://tabler-icons.io/i/paperclip -->
											<i class="ti ti-paperclip icon"></i>&nbsp;
										</a>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="components/footer.jsp" />
		</div>
	</div>
	<!-- Libs JS -->
	<jsp:include page="components/footer-imports.jsp" />
	<script type="text/javascript">
	$(document).ready(function(){
		$("#chats").addClass("active");
	});
	</script>
</body>
</html>