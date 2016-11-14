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
<link rel="stylesheet"
	href="frontend/css/font-awesome.css">
<link rel="stylesheet"
	href="frontend/css/bootstrap.min.css">
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
						<h1>Đăng ký thành công</h1>
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
							<div class="alert alert-success" role="alert">
							Chúc mừng bạn đăng ký thành viên thành công!
							</div>
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