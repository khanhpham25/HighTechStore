<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Hệ thống website bán đồ điện tử</title>

<meta name="keywords" content="">

<!-- Bootstrap and Font Awesome css -->
<link rel="stylesheet" href="frontend/css/font-awesome.css">
<link rel="stylesheet" href="frontend/css/bootstrap.min.css">
<!-- Css animations  -->
<link href="frontend/css/animate.css" rel="stylesheet">
<!-- Theme stylesheet, if possible do not edit this stylesheet -->
<link href="frontend/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes -->
<link href="frontend/css/custom.css" rel="stylesheet">
</head>

<body>


	<div id="all">
		<header>
			<!-- *** TOP *** -->
			<%@include file="includes/topbar.jsp"%>
			<!-- *** TOP END *** -->

			<!-- *** NAVBAR *** -->
			<%@include file="includes/navbar.jsp"%>
			<!-- *** NAVBAR END *** -->

		</header>

		<!-- *** LOGIN MODAL *** -->
		<%@include file="includes/login-modal.jsp"%>
		<!-- *** LOGIN MODAL END *** -->

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1>Đăng ký thành viên</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb">
							<li><a href="#">Trang chủ</a></li>
							<li>Đăng ký</li>
						</ul>

					</div>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="container">

				<div class="row">
					<div class="col-md-9">
						<div class="box">
							<h2 class="text-uppercase">Tạo tài khoản mới</h2>

							<p class="lead">Bạn chưa là thành viên?</p>
							<p>Với việc đăng kí này, bạn đồng ý làm thành viên của chúng
								tôi! Quá trình đăng kí chỉ mất vài phút!</p>
							<p class="text-muted">
								Nếu có thắc mắc gì hãy <a href="#">liên hệ với chúng tôi</a>,
								dịch vụ chăm sóc khách hàng của <i>Universal Store</i> hoạt động
								24/7.
							</p>

							<hr>
							<%
								String errorMessage = "";
								if (request.getAttribute("errorMessage") != null) {
									errorMessage = (String) request.getAttribute("errorMessage");
							%>
							<div class="alert alert-danger" role="alert"><%=errorMessage%></div>
							<%
								}
							%>

							<form action="<%=request.getContextPath()%>/register" method="post">
								<div class="form-group">
									<label>Họ tên <span class="required">*</span></label> <input type="text" class="form-control"
										name="name" required="required" autocomplete="off">
								</div>
								<div class="form-group">
									<label>Giới tính <span class="required">*</span></label>
									<div class="checkbox">
										<label style="margin-right: 30px;"><input type="radio"
											name="gender" value="true" checked="checked"> Nam</label> <label
											style="margin-right: 30px;"><input type="radio"
											name="gender" value="false"> Nữ</label>
									</div>
								</div>
								<div class="form-group">
									<label>Tài khoản <span class="required">*</span></label> <input type="text"
										class="form-control" name="username" required="required"
										autocomplete="off">
									<%
										String errorUsername = "";
										if (request.getAttribute("errorUsername") != null) {
											errorUsername = (String) request.getAttribute("errorUsername");
											%>
											<p style="color:red;"><%=errorUsername%></p>
											<%
										}
									%>
									
								</div>
								<div class="form-group">
									<label>Mật khẩu <span class="required">*</span></label> <input type="password"
										class="form-control" name="password" required="required"
										autocomplete="off">
								</div>
								<div class="form-group">
									<label>Địa chỉ <span class="required">*</span></label> <input type="text" class="form-control"
										name="address" required="required" autocomplete="off">
								</div>
								<div class="form-group">
									<label>Số điện thoại <span class="required">*</span></label> <input type="number"
										class="form-control" name="tel" required="required">
								</div>
								<div class="form-group">
									<label>Email <span class="required">*</span></label> <input type="email" class="form-control"
										name="email" required="required" autocomplete="off">
									<%
										String errorEmail = "";
										if (request.getAttribute("errorEmail") != null) {
											errorEmail = (String) request.getAttribute("errorEmail");
											%>
											<p style="color:red;"><%=errorEmail%></p>
											<%
										}
									%>
									
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-user-md"></i> Đăng ký
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->

		<!-- *** FOOTER *** -->
		<%@include file="includes/footer.jsp"%>
		<!-- *** FOOTER END *** -->
	</div>
	<!-- /#all -->
	<!-- #### JAVASCRIPT FILES ### -->
	<script src="frontend/js/jquery-1.11.0.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
	</script>
	<script src="frontend/js/bootstrap.min.js"></script>
	<script src="frontend/js/jquery.cookie.js"></script>
	<script src="frontend/js/waypoints.min.js"></script>
	<script src="frontend/js/jquery.counterup.min.js"></script>
	<script src="frontend/js/jquery.parallax-1.1.3.js"></script>
	<script src="frontend/js/front.js"></script>
</body>
</html>