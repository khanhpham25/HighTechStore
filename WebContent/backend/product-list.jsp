<%@page import="mta.cnpm12.store.dao.BrandDAO"%>
<%@page import="mta.cnpm12.store.dao.ProductCategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mta.cnpm12.store.beans.SanPham"%>
<%@page import="mta.cnpm12.store.beans.DanhMucSanPham"%>
<%@page import="mta.cnpm12.store.beans.ThuongHieu"%>
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
							<h2>Sản phẩm</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable-buttons"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Tên sản phẩm</th>
										<th>Giá bán (VNĐ)</th>
										<th>Ngày cập nhật</th>
										<th>Danh mục</th>
										<th>Thương hiệu</th>
										<th>Trạng thái</th>
										<th>Thao tác</th>
									</tr>
								</thead>

								<tbody>
									<%
										ArrayList<SanPham> list = (ArrayList<SanPham>) request.getAttribute("list");
										for (int i = 0; i < list.size(); i++) {
									%>
									<tr>
										<td><%=list.get(i).getTenSP()%></td>
										<%
											if (list.get(i).getGiaKhuyenMai() != 0) {
										%>
										<td><%=new DecimalFormat("#,###,###,###").format(list.get(i).getGiaKhuyenMai())%></td>
										<%
											} else {
										%>
										<td><%=new DecimalFormat("#,###,###,###").format(list.get(i).getGiaSP())%></td>
										<%
											}
										%>
										<td><%=list.get(i).getNgayCapNhat()%></td>
										<%
											DanhMucSanPham cate = ProductCategoryDAO.getById(list.get(i).getMaDanhMuc());
										%>
										<td><%=cate.getTenDanhMuc()%></td>
										<%
											ThuongHieu brand = BrandDAO.getById(list.get(i).getMaThuongHieu());
										%>
										<td><%=brand.getTenThuongHieu()%></td>
										<%
											if (list.get(i).isTrangThai() == true) {
										%>
										<td>Hiển thị</td>
										<%
											} else {
										%>
										<td>Ẩn</td>
										<%
											}
										%>
										<td width="120px;">
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-danger dropdown-toggle" type="button">
													Thao tác <span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a
														href="<%=request.getContextPath()%>/admin/product?task=detail&id=<%=list.get(i).getMaSP()%>">Chi
															tiết</a></li>
													<li><a
														href="<%=request.getContextPath()%>/admin/product?task=edit&id=<%=list.get(i).getMaSP()%>">Sửa
															thông tin</a></li>
													<li><a
														href="<%=request.getContextPath()%>/admin/product?task=updatenumber&id=<%=list.get(i).getMaSP()%>">Cập
															nhật số lượng</a></li>
													<li><a
														href="<%=request.getContextPath()%>/admin/product?task=addcolor&id=<%=list.get(i).getMaSP()%>">Thêm màu mới</a></li>
													<li><a
														href="<%=request.getContextPath()%>/admin/product?task=delete&id=<%=list.get(i).getMaSP()%>">Xóa</a></li>
												</ul>
											</div>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<a href="<%=request.getContextPath()%>/admin/product?task=create"
							class="btn btn-success">Thêm mới</a>
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

	<!-- Datatables -->
	<script>
		$(document).ready(function() {
			var handleDataTableButtons = function() {
				if ($("#datatable-buttons").length) {
					$("#datatable-buttons").DataTable({
						dom : "Bfrtip",
						buttons : [

						],
						responsive : true
					});
				}
			};

			TableManageButtons = function() {
				"use strict";
				return {
					init : function() {
						handleDataTableButtons();
					}
				};
			}();

			$('#datatable').dataTable();
			$('#datatable-keytable').DataTable({
				keys : true
			});

			$('#datatable-responsive').DataTable();

			$('#datatable-scroller').DataTable({
				ajax : "js/datatables/json/scroller-demo.json",
				deferRender : true,
				scrollY : 380,
				scrollCollapse : true,
				scroller : true
			});

			var table = $('#datatable-fixed-header').DataTable({
				fixedHeader : true
			});

			TableManageButtons.init();
		});
	</script>
	<!-- /Datatables -->
</body>
</html>