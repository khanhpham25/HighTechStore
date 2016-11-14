<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
	aria-labelledby="Login" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="Login">Đăng nhập</h4>
			</div>
			<div class="modal-body">
				<form action="<%=request.getContextPath()%>/index" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="username"
							placeholder="Tên đăng nhập" autocomplete="off">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Mật khẩu" autocomplete="off">
					</div>
					<p class="text-center">
						<button type="submit" class="btn btn-template-main">
							<i class="fa fa-sign-in"></i> Đăng nhập
						</button>
					</p>
				</form>
				<p class="text-center text-muted">Bạn chưa đăng ký?</p>
				<p class="text-center text-muted">
					<a href="<%=request.getContextPath()%>/register"><strong>Đăng ký ngay!</strong></a> Đăng ký đơn giản chỉ trong 1
					phút và bạn có cơ hội nhận được rất nhiều ưu đãi!
				</p>
			</div>
		</div>
	</div>
</div>