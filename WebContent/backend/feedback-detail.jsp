<%@page import="mta.cnpm12.store.beans.PhanHoi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mta.cnpm12.store.beans.DanhMucSanPham"%>

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
<script src="../backend/ckeditor/ckeditor.js" language="javascript"></script>
<script>
// Cấu hình lại màu nền giao diện.
CKEDITOR.config.uiColor = '#9AB8F3';
CKEDITOR.config.resize_enabled = false;
CKEDITOR.config.width = '850px';
CKEDITOR.config.height = '250px';
</script>
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
					<h4>Chi tiết phản hồi</h4>
					<hr />
					<%
						PhanHoi e = (PhanHoi) request.getAttribute("e");
						String ctm = request.getAttribute("ctm").toString();
					%>
					<div class="form-group">
						<label class="control-label col-md-2">Ngày giờ</label>
						<div class="col-md-10">
							<input type="text" readonly="readonly"
								style="width: 300px; height: 35px;"
								value="<%=e.getNgayGio()%>" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-2">Người phản hồi</label>
						<div class="col-md-10">
							<input type="text" readonly="readonly"
								style="width: 300px; height: 35px;" value="<%=ctm%>" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-2">Nội dung</label>
						<div class="col-md-10">
							<textarea name="content" style="width: 800px;" rows="15"
								cols="50" readonly="readonly"><%=e.getNoiDung()%></textarea>
						</div>
					</div>
					<script type="text/javascript" language="javascript">
						CKEDITOR.replace('content');
					</script>

					<div class="form-group">
						<div class="col-md-offset-2 col-md-10">
							<a href="<%=request.getContextPath()%>/admin/feedback"
								class="btn btn-round btn-warning">Trở lại</a>
						</div>
					</div>
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