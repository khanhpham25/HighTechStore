<%@page import="mta.cnpm12.store.controller.frontend.SessionCounter"%>
<%@page import="mta.cnpm12.store.dao.BrandDAO"%>
<%@page import="mta.cnpm12.store.beans.SanPhamMauSac"%>
<%@page import="mta.cnpm12.store.beans.MauSac"%>
<%@page import="mta.cnpm12.store.beans.BinhLuanSanPham"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="mta.cnpm12.store.beans.ThuongHieu"%>
<%@page import="mta.cnpm12.store.dao.ProductDAO"%>
<%@page import="mta.cnpm12.store.beans.SanPham"%>
<%@page import="mta.cnpm12.store.beans.HinhAnh"%>
<%@page import="java.util.ArrayList"%>
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

<script>
    function buy(id)
    {
        window.location = "<%= request.getContextPath() %>/cart?prodid=" + id + "&colorid=" + document.getElementById("color").value + "&quantity=1";
    }
</script>

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
						<h1>Sản phẩm</h1>
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
						<%
							SanPham prod = (SanPham) request.getAttribute("prod");
							ArrayList<HinhAnh> listImage = (ArrayList<HinhAnh>) request.getAttribute("listImage");
						%>
						<div class="row" id="productMain">
							<div class="col-sm-6">
								<div id="mainImage">
									<img src="upload/<%=listImage.get(0).getTenHinhAnh()%>" alt=""
										class="img-responsive">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="box">
									<%
										if (prod.getGiaKhuyenMai() != 0) {
									%>
									<p style="font-size: 30px;" class="price">
										Giá tiền: <span style="text-decoration: line-through"><%=new DecimalFormat("#,###,###,###").format(prod.getGiaSP())%></span>
										VNĐ
									</p>
									<p style="font-size: 30px;" class="price">
										Khuyến mãi:
										<%=new DecimalFormat("#,###,###,###").format(prod.getGiaKhuyenMai())%>
										VNĐ
									</p>
									<%
										} else {
									%>
									<p style="font-size: 30px;" class="price">
										Giá tiền:
										<%=new DecimalFormat("#,###,###,###").format(prod.getGiaSP())%>
										VNĐ
									</p>
									<%
										}
									%>
									<table>
										<tr>
											<td><label style="padding-right: 15px;">Màu sắc:
											</label></td>
											<td><select style="width: 300px; height: 35px;"
												class="form-control" name="color" id="color">
													<%
														ArrayList<MauSac> listColor = (ArrayList<MauSac>) request.getAttribute("listColor");
														ArrayList<SanPhamMauSac> listProdColor = (ArrayList<SanPhamMauSac>) request.getAttribute("listProdColor");
														for (int i = 0; i < listProdColor.size(); i++) {
															for (int j = 0; j < listColor.size(); j++) {
																if (listProdColor.get(i).getMaMau() == listColor.get(j).getMaMau()) {
													%>
													<option value="<%=listColor.get(j).getMaMau()%>"><%=listColor.get(j).getTenMau().toLowerCase()%></option>
													<%
														}
															}
														}
													%>
											</select></td>
										</tr>
									</table>
									<p style="margin-top: 20px;" class="text-center buttons">
										<a href="#" onclick="buy(<%= prod.getMaSP() %>)" class="btn btn-primary"><i
											class="fa fa-shopping-cart"></i> Thêm vào giỏ</a>
									</p>
								</div>
								<%
									if (listImage.size() >= 4) {
										for (int i = 0; i < 4; i++) {
								%>
								<div class="col-xs-3">
									<a href="upload/<%=listImage.get(i).getTenHinhAnh()%>"
										class="thumb"> <img
										src="upload/<%=listImage.get(i).getTenHinhAnh()%>" alt=""
										class="img-responsive">
									</a>
								</div>
								<%
									}
									} else {
										for (int i = 0; i < listImage.size(); i++) {
								%>
								<div class="col-xs-3">
									<a href="upload/<%=listImage.get(i).getTenHinhAnh()%>"
										class="thumb"> <img
										src="upload/<%=listImage.get(i).getTenHinhAnh()%>" alt=""
										class="img-responsive">
									</a>
								</div>
								<%
									}
									}
								%>
							</div>
						</div>

						<div class="box" id="details">
							<p>
							<h4>Chi tiết sản phẩm</h4>
							</p>
							<h4>Bảo hành: <%= prod.getBaoHanh() %></h4>
							<h4>Phụ kiện đi kèm: <%= prod.getPhuKienDiKem() %></h4>
							<h4>Danh mục: <%= ProductCategoryDAO.getById(prod.getMaDanhMuc()).getTenDanhMuc() %></h4>
							<h4>Thương hiệu: <%= BrandDAO.getById(prod.getMaThuongHieu()).getTenThuongHieu() %></h4>
							<p>
							<h4>Thông số kỹ thuật</h4>
							<%= prod.getThongSoKyThuat() %>
							</p>
							<blockquote>
								<p>Mọi thắc mắc về sản phẩm xin liên hệ:</p>
								<p>Hotline: 098 345 4030</p>
								<p>Giờ làm việc: 8h - 21h thứ 2 đến thứ 6; 8h - 17h thứ 7,
									chủ nhật
							</blockquote>
							<hr>
						</div>

						<div id="comments">
							<%
								ArrayList<BinhLuanSanPham> listComment = (ArrayList<BinhLuanSanPham>) request.getAttribute("listComment");
							%>
							<h4 class="text-uppercase"><%=listComment.size()%>
								bình luận
							</h4>
							<%
								for (int i = 0; i < listComment.size(); i++) {
							%>
							<div class="row comment">
								<div class="col-sm-3 col-md-2 text-center-xs">
									<p>
										<img src="frontend/img/icon-profile.jpg"
											class="img-responsive img-circle" alt="">
									</p>
								</div>
								<div class="col-sm-9 col-md-10">
									<h5 class="text-uppercase"><%=listComment.get(i).getTenNguoiBinhLuan()%></h5>
									<p class="posted">
										<i class="fa fa-clock-o"></i>
										<%=listComment.get(i).getNgayGio()%></p>
									<p><%=listComment.get(i).getNoiDung()%></p>
								</div>
							</div>
							<%
								}
							%>
						</div>

						<div id="comment-form" style="margin-bottom: 50px;">
							<h4 class="text-uppercase">Để lại bình luận</h4>
							<form method="post"
								action="<%=request.getContextPath()%>/product">
								<input type="hidden" name="prodid" value="<%= prod.getMaSP() %>" />
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Họ tên <span class="required">*</span>
											</label> <input type="text" class="form-control" name="name"
												autocomplete="off" required="required">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="comment">Bình luận <span class="required">*</span>
											</label>
											<textarea class="form-control" name="comment" rows="4"></textarea>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12 text-right">
										<button type="submit" class="btn btn-template-main">
											<i class="fa fa-comment-o"></i> Gửi bình luận
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /.col-md-9 -->

					<!-- *** LEFT COLUMN END *** -->

					<!-- *** RIGHT COLUMN *** -->
					<div class="col-md-3">
						<!-- *** MENUS AND WIDGETS *** -->
						<div class="panel panel-default sidebar-menu">
							<div class="panel-heading">
								<h3 class="panel-title">Danh mục sản phẩm</h3>
							</div>

							<div class="panel-body">
								<ul style="font-size: 18px;" class="nav">
									<%
										ArrayList<DanhMucSanPham> listCate = (ArrayList<DanhMucSanPham>) request.getAttribute("listCate");
										for (int i = 0; i < listCate.size(); i++) {
									%>
									<li><a
										href="<%=request.getContextPath()%>/product-list?cateid=<%=listCate.get(i).getMaDanhMuc()%>&page=1"><%=listCate.get(i).getTenDanhMuc()%></a></li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
						<h4 style="color:red;">Số người online: <%= SessionCounter.getSonguoionline() %></h4>
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