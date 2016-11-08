<%@page import="mta.cnpm12.store.beans.QuanTriVien"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>High Tech</title>

<!-- Bootstrap -->
<link href="../backend/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../backend/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="../backend/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="../backend/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="../backend/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="../backend/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="#" class="site_title"><i class="fa fa-paw"></i> <span>High-Tech</span></a>
					</div>

					<div class="clearfix"></div>

					<br />

					<!-- sidebar menu -->
					<%@include file="includes/menu.jsp"%>
					<!-- /sidebar menu -->
				</div>
			</div>

			<!-- top navigation -->
			<%@include file="includes/navbar.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="form-horizontal">
					<h4>Sửa thông tin quản trị viên</h4>
					<hr />
					<form method="post"
						action="<%=request.getContextPath()%>/admin/admin">
						<%
							QuanTriVien e = (QuanTriVien) request.getAttribute("e");
						%>
						<input type="hidden" name="task" value="edit" /> <input
							type="hidden" name="id" value="<%=e.getMaAdmin()%>" />
						<div class="form-group">
							<label class="control-label col-md-2">Họ tên</label>
							<div class="col-md-10">
								<input type="text" name="name" required="required" autocomplete="off"
									style="width: 300px; height: 35px;"
									value="<%=e.getTenAdmin()%>" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Email</label>
							<div class="col-md-10">
								<input type="email" name="email" required="required" autocomplete="off"
									style="width: 300px; height: 35px;" value="<%=e.getEmail()%>" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Tài khoản</label>
							<div class="col-md-10">
								<input type="text" name="username" readonly="readonly"
									style="width: 300px; height: 35px;"
									value="<%=e.getTenDangNhap()%>" />
								<%
									String error = "";
									if (request.getAttribute("error") != null) {
										error = (String) request.getAttribute("error");
									}
								%>
								<%=error%>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Mật khẩu</label>
							<div class="col-md-10">
								<input type="password" name="password" required="required" autocomplete="off"
									style="width: 300px; height: 35px;"
									value="<%=e.getMatKhau()%>" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Quyền</label>
							<div class="col-md-10">
								<select name="status" style="width: 300px; height: 35px;">
									<%
										if (e.isPhanQuyen() == true) {
									%>
									<option value="true" selected="selected">Cao cấp</option>
									<option value="false">Thường</option>
									<%
										} else {
									%>
									<option value="true">Cao cấp</option>
									<option value="false" selected="selected">Thường</option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-10">
								<a href="<%=request.getContextPath()%>/admin/admin"
									class="btn btn-round btn-warning">Trở lại</a> <input
									class="btn btn-round btn-success" type="submit" value="Đồng Ý" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<%@include file="includes/footer.jsp"%>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="../backend/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../backend/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../backend/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../backend/vendors/nprogress/nprogress.js"></script>
	<!-- Datatables -->
	<script
		src="../backend/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script src="../backend/vendors/jszip/dist/jszip.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../backend/build/js/custom.min.js"></script>

</body>
</html>