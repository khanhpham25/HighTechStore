<%@page import="mta.cnpm12.store.dao.ProductCategoryDAO"%>
<%@page import="mta.cnpm12.store.beans.DanhMucSanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">
	<div class="navbar navbar-default yamm" role="navigation" id="navbar">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand home" href="#"> <img
					src="frontend/img/logo.png" alt="Universal logo"
					class="hidden-xs hidden-sm"> <img
					src="frontend/img/logo-small.png" alt="Universal logo"
					class="visible-xs visible-sm"><span class="sr-only">Universal
						- go to homepage</span>
				</a>
			</div>
			<div class="navbar-collapse collapse" id="navigation">
				<ul class="nav navbar-nav navbar-left">
					<li class="dropdown active"><a
						href="<%=request.getContextPath()%>/index">Trang chủ</a></li>
					<li class="dropdown use-yamm yamm-fw"><a
						href="javascript: void(0)" style="text-decoration: none;"
						class="dropdown-toggle" data-toggle="dropdown">Sản phẩm <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<%
								ArrayList<DanhMucSanPham> listCateProd = (ArrayList<DanhMucSanPham>) ProductCategoryDAO.listAll();
								for (int i = 0; i < listCateProd.size(); i++) {
							%>
							<li><a
								href="<%=request.getContextPath()%>/product-list?cateid=<%=listCateProd.get(i).getMaDanhMuc()%>&page=1"><%=listCateProd.get(i).getTenDanhMuc()%></a></li>
							<%
								}
							%>
						</ul></li>
					<li class="dropdown use-yamm yamm-fw"><a
						href="<%=request.getContextPath()%>/news-list?page=1"
						style="text-decoration: none;">Tin tức</a></li>
					<li class="dropdown use-yamm yamm-fw"><a
						href="<%=request.getContextPath()%>/cart"
						style="text-decoration: none;">Giỏ hàng</a></li>
					<li class="dropdown use-yamm yamm-fw"><a
						href="<%=request.getContextPath()%>/contact"
						style="text-decoration: none;">Liên hệ</a></li>
					<li style="margin-left: 10px;">
						<form method="post"
							action="<%=request.getContextPath()%>/search"
							class="navbar-form" role="search">
							<div class="input-group" id="search">
								<input type="text" name="keyword" style="width: 280px;"
									class="form-control"
									placeholder="Nhập từ khóa tìm kiếm sản phẩm" autocomplete="off">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-template-main">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>