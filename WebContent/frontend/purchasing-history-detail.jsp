<%@page import="java.text.DecimalFormat"%>
<%@page import="mta.cnpm12.store.dao.ColorDAO"%>
<%@page import="mta.cnpm12.store.beans.SanPham"%>
<%@page import="mta.cnpm12.store.beans.MauSac"%>
<%@page import="mta.cnpm12.store.dao.ProductDAO"%>
<%@page import="mta.cnpm12.store.beans.ChiTietDonHang"%>
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
<link rel="stylesheet" href="frontend/css/font-awesome.css">
<link rel="stylesheet" href="frontend/css/bootstrap.min.css">
<!-- Css animations  -->
<link href="frontend/css/animate.css" rel="stylesheet">
<!-- Theme stylesheet, if possible do not edit this stylesheet -->
<link href="frontend/css/style.default.css" rel="stylesheet"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes -->
<link href="frontend/css/custom.css" rel="stylesheet">
<link href="frontend/css/owl.carousel.css" rel="stylesheet">
<link href="frontend/css/owl.theme.css" rel="stylesheet">
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
					<div class="col-md-6">
						<h1>Danh sách sản phẩm</h1>
					</div>
					<div class="col-md-6">
						<ul class="breadcrumb">
							<li><a href="#">Trang chủ</a></li>
							<li>Sản phẩm</li>
						</ul>

					</div>
				</div>
			</div>
		</div>

		<div id="content">
			<div class="container">
				<div class="row">
					<!-- *** LEFT COLUMN *** -->
					<div class="col-md-9">
						<div class="row-fluid sortable">
						    <div class="box span12">
						        <div class="box-header" data-original-title>
						            <h2>Lịch sử mua hàng</h2>
						        </div>
						        <table class='table'>
						            <thead>
						                <tr>
						                    <th>Sản phẩm</th>
											<th>Màu sắc</th>
											<th>Đơn giá (VNĐ)</th>
											<th>Số lượng</th>
											<th>Thành tiền (VNĐ)</th>
						                </tr>
						            </thead>
						            <tbody>
						            <%
						            double sum = 0;
						            ArrayList<ChiTietDonHang> list = (ArrayList<ChiTietDonHang>) request.getAttribute("list");
									if(list.size() > 0){
										for(ChiTietDonHang item : list){
											%>
											<tr>
												<%
													SanPham p = ProductDAO.getById(item.getMaSP());
													MauSac c = ColorDAO.getById(item.getMaMau());
													double s = item.getDonGia() * item.getSoLuong();
												%>
												<td><%=p.getTenSP()%></td>
												<td><%=c.getTenMau()%></td>
												<td><%=new DecimalFormat("#,###,###,###").format(item.getDonGia())%></td>
												<td><%=item.getSoLuong()%></td>
												<td><%=new DecimalFormat("#,###,###,###").format(s)%></td>
											</tr>
											<%
											sum += s;
										}
										%>
										<h2 style="color: red; font-weight: bold;">
											Tổng giá trị đơn hàng:
											<%=new DecimalFormat("#,###,###,###").format(sum)%>
											VNĐ
										</h2>
										<%
									}
						            %>
						            </tbody>
						            <tfoot>
										
						            </tfoot>
						        </table>
						    </div><!--/span-->
						</div>							
					</div>
					<!-- /.col-md-9 -->

					<!-- *** LEFT COLUMN END *** -->

					<!-- *** RIGHT COLUMN *** -->
					<div class="col-md-3">
						<!-- *** MENUS AND WIDGETS *** -->
						    <div class="panel panel-default sidebar-menu">
						        <div class="panel-heading">
						            <h3 class="panel-title">Tài khoản</h3>
						        </div>
						        <div class="panel-body">
						            <ul class="nav nav-pills nav-stacked category-menu">
						                <li>
						                    <a href="<%= request.getContextPath()%>/profile">Thông tin chung</a>
						                </li>
						                <li>
						                    <a href="<%= request.getContextPath()%>/history">Lịch sử mua hàng</a>
						                </li>
						            </ul>
						        </div>
						    </div>
						<!-- *** MENUS AND FILTERS END *** -->
					</div>
					<!-- /.col-md-3 -->
					<!-- *** RIGHT COLUMN END *** -->
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
						.write('<script src="frontend/js/jquery-1.11.0.min.js"><\/script>')
	</script>
	<script src="frontend/js/bootstrap.min.js"></script>
	<script src="frontend/js/jquery.cookie.js"></script>
	<script src="frontend/js/waypoints.min.js"></script>
	<script src="frontend/js/jquery.counterup.min.js"></script>
	<script src="frontend/js/jquery.parallax-1.1.3.js"></script>
	<script src="frontend/js/front.js"></script>
	<!-- owl carousel -->
	<script src="frontend/js/owl.carousel.min.js"></script>
</body>
</html>