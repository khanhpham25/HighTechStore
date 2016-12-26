<%@page import="mta.cnpm12.store.beans.DonHang"%>
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
						                    <th>Mã đơn hàng</th>
						                    <th>Ngày đặt hàng</th>
						                    <th>Ghi chú</th>
						                    <th>Thao tác</th>
						                </tr>
						            </thead>
						            <tbody>
						            <%
						            ArrayList<DonHang> list = (ArrayList<DonHang>) request.getAttribute("list");
									if(list.size() > 0){
										for(DonHang item : list){
											%>
											<tr>
						                        <td><%= item.getMaDonHang() %></td>
						                        <td><%= item.getNgayDat() %></td>
						                        <%
						                        if(item.getGhiChu().length() > 0){
						                        	%>
						                        	<td><%= item.getGhiChu() %></td>
						                        	<%
						                        }
						                        else{
						                        	%>
						                        	<td>Không có</td>
						                        	<%
						                        }
						                        %>
						                        <td><a href="<%= request.getContextPath() %>/history-detail?cartid=<%= item.getMaDonHang() %>" style="background: #4fbfa8; padding: 5px 10px; color: #fff;" class="btn">Chi tiết</a></td>
						                    </tr>
											<%
										}
									}
						            %>
						            </tbody>
						            <tfoot>
						                <tr></tr>
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