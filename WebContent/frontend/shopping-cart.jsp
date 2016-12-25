<%@page import="java.text.DecimalFormat"%>
<%@page import="mta.cnpm12.store.beans.GioHang"%>
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

<script>
    function update(id)
    {
        window.location = "<%=request.getContextPath()%>/cart?cartid=" + id + "&quantity=" + document.getElementById(id).value+"0";
    }
</script>
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
						<h1>Giỏ hàng</h1>
					</div>
					<div class="col-md-6">
						<ul class="breadcrumb">
							<li><a href="#">Trang chủ</a></li>
							<li>Giỏ hàng</li>
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
						<div id="basket">
							<div class="box">
								<h1>THÔNG TIN GIỎ HÀNG</h1>
								<div class="table-responsive">
									<%
										ArrayList<GioHang> listCart = (ArrayList<GioHang>) request.getSession().getAttribute("cart");
										if (listCart != null) {
									%>
									<table class="table">
										<thead>
											<tr>
												<th>Tên sản phẩm</th>
												<th>Đơn giá</th>
												<th>Số lượng</th>
												<th>Tổng tiền</th>
												<th colspan="2">Thao tác</th>
											</tr>
										</thead>
										<tbody>
											<%
												double sum = 0;
													for (GioHang item : listCart) {
														double price = item.getSanPham().getGiaSP();
														if (item.getSanPham().getGiaKhuyenMai() != 0) {
															price = item.getSanPham().getGiaKhuyenMai();
														}
											%>
											<tr>
												<td><%=item.getSanPham().getTenSP()%><br /> <i>Màu:
														<%=item.getMauSac().getTenMau()%></i></td>
												<td><%=new DecimalFormat("#,###,###,###").format(price)%></td>
												<td><input type="number" value="<%=item.getSoLuong()%>"
													id="<%=item.getMaGioHang()%>" /></td>
												<td><%=new DecimalFormat("#,###,###,###").format(price * item.getSoLuong())%></td>
												<td><a href="#"
													onclick="update(<%=item.getMaGioHang()%>)"
													style="text-decoration: none">Cập nhật</a></td>
												<td><a
													href="<%=request.getContextPath()%>/cart?cartid=<%=item.getMaGioHang()%>"><i
														class="fa fa-trash-o"></i></a></td>
											</tr>
											<%
												sum += price * item.getSoLuong();
													}
											%>
										</tbody>
										<tfoot>
											<tr>
												<th colspan="3"></th>
												<th style="color: red">Tổng:</th>
												<th colspan="2" style="color: red"><%=new DecimalFormat("#,###,###,###").format(sum)%>
													VNĐ</th>
											</tr>
										</tfoot>
									</table>
									<%
										}
									%>
								</div>

								<%
									KhachHang clientLogin = (KhachHang) request.getSession().getAttribute("clientLogin");
									if (clientLogin != null) {
								%>
								<form method="post" action="<%= request.getContextPath() %>/cart">
									<div class="form-group" style="margin-top: 30px;">
										<label for="email">Yêu cầu thêm</label> <input type="text"
											class="form-control" id="txtnote" name="txtnote">
									</div>
									<div class="box-footer">
										<div class="pull-right">
											<a href="<%=request.getContextPath()%>/cart?delete=true" style="background: #7b7b7b; color: #fff;"
												class="btn">Hủy đơn hàng </a>
											<button type="submit" class="btn btn-primary" id="btnSubmit"
												name="btnSubmit">
												Gửi đơn hàng <i class="fa fa-chevron-right"></i>
											</button>
										</div>
									</div>
								</form>
								<%
									} else {
								%>
								<form method="post" action="<%= request.getContextPath() %>/cart">
									<div class="form-group">
										<label for="name">Tên khách hàng</label> <input type="text"
											class="form-control" id="txtName" name="txtName" autocomplete="off">
									</div>
									<div class="form-group">
										<label for="address">Địa chỉ</label> <input type="text"
											class="form-control" id="txtAddress" name="txtAddress" autocomplete="off">
									</div>
									<div class="form-group">
										<label for="phone">Số điện thoại</label> <input type="text"
											class="form-control" id="txtPhone" name="txtPhone" autocomplete="off"
											pattern="[\d]{10,11}">
									</div>
									<div class="form-group">
										<label for="email">Email</label> <input type="email"
											class="form-control" id="txtEmail" name="txtEmail" autocomplete="off">
									</div>
									<div class="form-group">
										<label for="email">Yêu cầu thêm</label> <input type="text"
											class="form-control" id="txtNote" name="txtNote" autocomplete="off">
									</div>
									<div class="box-footer">
										<div class="pull-right">
											<a href="<%=request.getContextPath()%>/cart?delete=true" style="background: #7b7b7b; color: #fff;"
												class="btn">Hủy đơn hàng </a>
											<button type="submit" class="btn btn-primary" id="btnSubmit"
												name="btnSubmit">
												Gửi đơn hàng <i class="fa fa-chevron-right"></i>
											</button>
										</div>
									</div>
								</form>
								<%
									}
								%>
							</div>
						</div>

					</div>
					<!-- /.col-md-9 -->

					<!-- *** LEFT COLUMN END *** -->

					<!-- *** RIGHT COLUMN *** -->
					<div class="col-md-3"></div>
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