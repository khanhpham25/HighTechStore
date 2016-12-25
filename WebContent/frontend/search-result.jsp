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
						<div class="row products">
							<%
								String keyword = request.getAttribute("keyword").toString();
							%>
							<%
								ArrayList<SanPham> listProduct = (ArrayList<SanPham>) request.getAttribute("listProduct");
								if (listProduct != null) {
							%>
							<h3 style="margin-left: 20px">
								Kết quả tìm kiếm cho từ khóa: <i style="color: red"><%=keyword%></i>
							</h3>
							<%
								for (int i = 0; i < listProduct.size(); i++) {
										HinhAnh img = ProductDAO.getImageByProductId(listProduct.get(i).getMaSP());
							%>
							<div class="col-md-4 col-sm-6">
								<div class="product">
									<div class="image">
										<a
											href="<%=request.getContextPath()%>/product?id=<%=listProduct.get(i).getMaSP()%>">
											<img style="height: 220px; width: 250px"
											src="upload/<%=img.getTenHinhAnh().toString()%>" alt=""
											class="img-responsive">
										</a>
									</div>
									<!-- /.image -->
									<div class="text">
										<h3>
											<a
												href="<%=request.getContextPath()%>/product?id=<%=listProduct.get(i).getMaSP()%>"><%=listProduct.get(i).getTenSP()%></a>
										</h3>
										<p class="price"><%=new DecimalFormat("#,###,###,###").format(listProduct.get(i).getGiaSP())%>
											VNĐ
										</p>
										<p class="buttons">
											<a
												href="<%=request.getContextPath()%>/product?id=<%=listProduct.get(i).getMaSP()%>"
												class="btn btn-default">Xem chi tiết</a>
										</p>
									</div>
									<!-- /.text -->
								</div>
								<!-- /.product -->
							</div>
							<%
								}
								}
							%>
						</div>

						<div class="pages">
							<ul class="pagination" style="text-align: center;">
								<%
									int totalRecord = Integer.parseInt(request.getAttribute("totalRecord").toString());
									int pageSize = Integer.parseInt(request.getAttribute("pageSize").toString());
									int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
									if (totalRecord > 0) {
										if (totalPage > 1) {
											for (int i = 1; i <= totalPage; i++) {
								%>
								<li><a
									href="<%=request.getContextPath()%>/search?keyword=<%=keyword%>&page=<%=i%>"><%=i%></a></li>
								<%
									}
										}
									} else {
								%>
								<h3 style="color: red;">Không tìm thấy sản phẩm nào!</h3>
								<%
									}
								%>
							</ul>
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