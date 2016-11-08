<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
   	<div class="menu_section">
                <ul class="nav side-menu">
                  <li><a href="<%= request.getContextPath()%>/admin/home"><i class="fa fa-home"></i> Trang chủ </a></li>
                  <li><a href="<%= request.getContextPath()%>/admin/product-category"><i class="fa fa-file"></i> Danh mục sản phẩm  </a></li>
                  <li><a href="<%= request.getContextPath()%>/admin/brand"><i class="fa fa-apple"></i> Thương hiệu </a></li>
                  <li><a href="<%= request.getContextPath()%>/admin/color"><i class="fa fa-image"></i> Màu sắc </a></li>
                  <li><a href="<%= request.getContextPath()%>/admin/product"><i class="fa fa-desktop"></i> Sản phẩm </a></li>
                  <li><a href="<%= request.getContextPath()%>/admin/product-comment"><i class="fa fa-comments"></i> Bình luận sản phẩm </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/customer"><i class="fa fa-users"></i> Khách hàng </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/feedback"><i class="fa fa-inbox"></i> Phản hồi </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/orderform"><i class="fa fa-shopping-cart"></i> Đơn hàng </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/article-category"><i class="fa fa-file"></i> Danh mục bài viết </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/article"><i class="fa fa-newspaper-o"></i> Bài viết </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/article-comment"><i class="fa fa-comments"></i> Bình luận bài viết </a></li>
				  <li><a href="<%= request.getContextPath()%>/admin/admin"><i class="fa fa-users"></i> Quản trị viên </a></li>
                </ul>
  	</div>
</div>