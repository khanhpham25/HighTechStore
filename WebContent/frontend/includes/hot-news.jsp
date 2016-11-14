<%@page import="mta.cnpm12.store.beans.BaiViet"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="col-md-12">
		<div class="heading text-center">
			<h2>Tin công nghệ</h2>
		</div>
		<p style="text-align: center;" class="lead">Các sản phẩm công nghệ
			được truyền cảm hứng và phát triển từ những tập đoàn công nghệ hàng
			đầu.</p>
		<!-- *** BLOG HOMEPAGE *** -->
		<div class="row">
			<%
				ArrayList<BaiViet> listNews = (ArrayList<BaiViet>) request.getAttribute("listNews");
				for (int i = 0; i < listNews.size(); i++) {
			%>
			<div class="col-md-6 col-sm-12">
				<div class="box-image-text blog">
					<div style="background-color: #fff; padding: 15px;" class="content">
						<h4 style="height: 50px;">
							<a href="<%= request.getContextPath() %>/news?id=<%= listNews.get(i).getMaBaiViet() %>"><%=listNews.get(i).getTieuDe()%></a>
						</h4>
						<p style="height: 10px;" class="author-category">
							Ngày đăng:
							<%=listNews.get(i).getNgayDang()%>
						</p>
						<p style="height: 70px;" class="intro"><%=listNews.get(i).getMoTa()%></p>
						<p class="read-more">
							<a href="<%= request.getContextPath() %>/news?id=<%= listNews.get(i).getMaBaiViet() %>" class="btn btn-template-main">Đọc
								tiếp</a>
						</p>
					</div>
				</div>
				<!-- /.box-image-text -->
			</div>
			<%
				}
			%>

		</div>
		<!-- /.row -->
		<!-- *** BLOG HOMEPAGE END *** -->
	</div>
</div>