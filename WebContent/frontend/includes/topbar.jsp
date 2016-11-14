<%@page import="mta.cnpm12.store.beans.KhachHang"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="top">
	<div class="container">
		<div class="row">
			<div class="col-xs-5 contact">
				<p class="hidden-sm hidden-xs">Liên hệ với chúng tôi qua SĐT:
					+420 777 555 333 hoặc Email: hightech@gmail.com.</p>
				<p class="hidden-md hidden-lg">
					<a href="#" data-animate-hover="pulse"><i class="fa fa-phone"></i></a>
					<a href="#" data-animate-hover="pulse"><i
						class="fa fa-envelope"></i></a>
				</p>
			</div>
			<div class="col-xs-7">
				<div class="login">
				<%
				KhachHang e = (KhachHang) request.getSession().getAttribute("clientLogin");
				if(e == null){
					%>
					<a href="#" data-toggle="modal" data-target="#login-modal"><i
						class="fa fa-sign-in"></i> <span class="hidden-xs text-uppercase">Đăng
							nhập</span></a> <a href="<%=request.getContextPath()%>/register"><i class="fa fa-user"></i> <span
						class="hidden-xs text-uppercase">Đăng ký</span></a>
					<%
				}
				else{
					%>
					  <a href="#">Xin chào, <b><%= e.getHoTen() %></b></a>
					  <a href="<%=request.getContextPath()%>/index?task=logout">Đăng xuất</a>
					<%
				}
				%>
					
				</div>
			</div>
		</div>
	</div>
</div>