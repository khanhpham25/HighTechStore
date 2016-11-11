<%@page import="mta.cnpm12.store.beans.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mta.cnpm12.store.beans.HinhAnh"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-12">
		<div class="heading text-center">
			<h2>Sản phẩm mới</h2>
		</div>
		<!-- *** TESTIMONIALS CAROUSEL *** -->

		<%
			ArrayList<HinhAnh> listImage = (ArrayList<HinhAnh>) request.getAttribute("listImage");
			ArrayList<SanPham> listProduct = (ArrayList<SanPham>) request.getAttribute("listProduct");
			for (int i = 0; i < listImage.size(); i++) {
		%>
		<div class="col-sm-6 col-md-3">
			<div class="box-image">
				<div class="image">
					<img src="upload/<%=listImage.get(i).getTenHinhAnh()%>" alt=""
						class="img-responsive" />
				</div>
				<div class="bg"></div>
				<div class="name">
					<h3>
						<a href="#"><%= listProduct.get(i).getTenSP() %></a>
					</h3>
				</div>
				<div class="text">
					<p class="buttons">
						<a href="#"
							class="btn btn-template-transparent-primary">View</a> 
					</p>
				</div>
			</div>
			<!-- /.box-image -->
		</div>
		<%
			}
		%>
		<!-- *** TESTIMONIALS CAROUSEL END *** -->
	</div>
</div>