<%@page import="mta.cnpm12.store.beans.HinhAnh"%>
<%@page import="mta.cnpm12.store.beans.ThuongHieu"%>
<%@page import="mta.cnpm12.store.beans.DanhMucSanPham"%>
<%@page import="mta.cnpm12.store.beans.MauSac"%>
<%@page import="mta.cnpm12.store.beans.SanPham"%>
<%@page import="mta.cnpm12.store.beans.SanPhamMauSac"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>Thông tin chi tiết sản phẩm</h2>
							<div class="clearfix"></div>
						</div>
						<%
							SanPham e = (SanPham) request.getAttribute("e");
						%>
						<div class="x_content">
							<h1 style='color: red'>
								Mã sản phẩm:
								<%=e.getMaSP()%></h1>
							<div class="row">
								<%
									ArrayList<HinhAnh> img = (ArrayList<HinhAnh>) request.getAttribute("img");
									for (int i = 0; i < img.size(); i++) {
								%>
								<div class="col-md-55">
									<div class="thumbnail">
										<img style="width: 100%; display: block;"
											src="../upload/<%=img.get(i).getTenHinhAnh()%>"
											alt="" />
									</div>
								</div>

								<%
									}
								%>
							</div>
							<h2>
								Tên sản phẩm:
								<%=e.getTenSP()%></h2>
							<h2>
								Giá sản phẩm:
								<%=new DecimalFormat("#,###,###,###").format(e.getGiaSP())%>
								VNĐ
							</h2>
							<h2>
								Giá khuyến mại:
								<%=new DecimalFormat("#,###,###,###").format(e.getGiaKhuyenMai())%>
								VNĐ
							</h2>
							<h2>
								Thông số kỹ thuật:
								<%=e.getThongSoKyThuat()%></h2>
							<h2>
								Bảo hành:
								<%=e.getBaoHanh()%></h2>
							<h2>
								Phụ kiện đi kèm:
								<%=e.getPhuKienDiKem()%></h2>
							<h2>
								Danh mục:
								<%=((DanhMucSanPham) request.getAttribute("cate")).getTenDanhMuc()%></h2>
							<h2>
								Thương hiệu:
								<%=((ThuongHieu) request.getAttribute("brand")).getTenThuongHieu()%></h2>
							<%
								ArrayList<MauSac> cl = (ArrayList<MauSac>) request.getAttribute("cl");
								ArrayList<SanPhamMauSac> pcl = (ArrayList<SanPhamMauSac>) request.getAttribute("pcl");

								for (int i = 0; i < pcl.size(); i++) {
									for (int j = 0; j < cl.size(); j++) {
										if (pcl.get(i).getMaMau() == cl.get(j).getMaMau()) {
							%>
							<h2>
								Sản phẩm màu
								<%=cl.get(j).getTenMau().toLowerCase()%>
								còn:
								<%=pcl.get(i).getSoLuong()%>
								chiếc
							</h2>
							<%
								}
									}
								}
							%>
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