<%@page import="mta.cnpm12.store.dao.ColorDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mta.cnpm12.store.beans.DanhMucSanPham"%>
<%@page import="mta.cnpm12.store.beans.ThuongHieu"%>
<%@page import="mta.cnpm12.store.beans.MauSac"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>High Tech</title>

<!-- Bootstrap -->
<link href="../backend/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../backend/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="../backend/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="../backend/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="../backend/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../backend/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="../backend/build/css/custom.min.css" rel="stylesheet">
<script src="../backend/ckeditor/ckeditor.js" language="javascript"></script>
<script>
// Cấu hình lại màu nền giao diện.
CKEDITOR.config.uiColor = '#9AB8F3';
CKEDITOR.config.resize_enabled = false;
CKEDITOR.config.width = '850px';
CKEDITOR.config.height = '250px';
</script>
<!-- jQuery -->
<script src="../backend/vendors/jquery/dist/jquery.min.js"></script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="#" class="site_title"><i class="fa fa-paw"></i> <span>High-Tech</span></a>
					</div>

					<div class="clearfix"></div>

					<br />

					<!-- sidebar menu -->
					<%@include file="includes/menu.jsp"%>
					<!-- /sidebar menu -->
				</div>
			</div>

			<!-- top navigation -->
			<%@include file="includes/navbar.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="form-horizontal">
					<h4>Thêm sản phẩm</h4>
					<hr />
					<form method="post"	action="<%=request.getContextPath()%>/admin/product" enctype="multipart/form-data">
						
						<input type="hidden" name="task" value="create" />
						<%
							String error = "";
							if (request.getAttribute("error") != null) {
								error = (String) request.getAttribute("error");
							}
						%>
						<%=error%>
						<div class="form-group">
							<label class="control-label col-md-2">Tên sản phẩm</label>
							<div class="col-md-10">
								<input type="text" name="name" required="required"
									autocomplete="off" style="width: 300px; height: 35px;" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Giá sản phẩm</label>
							<div class="col-md-10">
								<input type="number" name="price" required="required"
									autocomplete="off" style="width: 300px; height: 35px;" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Giá khuyến mại</label>
							<div class="col-md-10">
								<input type="number" name="saleprice" autocomplete="off"
									style="width: 300px; height: 35px;" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Thông số kỹ thuật</label>
							<div class="col-md-10">
								<textarea name="info" style="width: 800px;" rows="15" cols="50"></textarea>
							</div>
						</div>

						<script type="text/javascript" language="javascript">
							CKEDITOR.replace('info');
						</script>

						<div class="form-group">
							<label class="control-label col-md-2">Bảo hành</label>
							<div class="col-md-10">
								<input list="warranty" type="text" name="warranty" required="required"
									style="width: 300px; height: 35px;" />
							</div>
						</div>

						<datalist id="warranty">
							<option value="6 tháng"></option>
							<option value="1 năm"></option>
							<option value="18 tháng"></option>
							<option value="2 năm"></option>
						</datalist>
						
						<div class="form-group">
							<label class="control-label col-md-2">Phụ kiện đi kèm</label>
							<div class="col-md-10">
								<input type="text" name="spare-parts" required="required"
									autocomplete="off" style="width: 300px; height: 35px;" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Trạng thái</label>
							<div class="col-md-10">
								<select name="status" style="width: 300px; height: 35px;">
									<option value="true">Hiển thị</option>
									<option value="false">Ẩn</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Danh mục</label>
							<div class="col-md-10">
								<select name="cate" style="width: 300px; height: 35px;">
									<%
										ArrayList<DanhMucSanPham> ds1 = (ArrayList<DanhMucSanPham>) request.getAttribute("ds1");
										for (int i = 0; i < ds1.size(); i++) {
									%>
									<option value="<%=ds1.get(i).getMaDanhMuc()%>"><%=ds1.get(i).getTenDanhMuc()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-2">Thương hiệu</label>
							<div class="col-md-10">
								<select name="brand" style="width: 300px; height: 35px;">
									<%
										ArrayList<ThuongHieu> ds2 = (ArrayList<ThuongHieu>) request.getAttribute("ds2");
										for (int i = 0; i < ds2.size(); i++) {
									%>
									<option value="<%=ds2.get(i).getMaThuongHieu()%>"><%=ds2.get(i).getTenThuongHieu()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="form-group" id="color">
							<label class="control-label col-md-2">Màu sắc</label>
							<div class="col-md-10 checkbox">
								<%
									ArrayList<MauSac> dsMauSac = (ArrayList<MauSac>) request.getAttribute("dsMauSac");
									for (int i = 0; i < dsMauSac.size(); i++) {
								%>
								 <label style="margin-right: 30px;"><input type="checkbox" name="color" placeholder="<%=dsMauSac.get(i).getTenMau()%>"
									value="<%=dsMauSac.get(i).getMaMau()%>" /><%=dsMauSac.get(i).getTenMau()%></label>
								<%
									}
								%>
							</div>
						</div>
						
						<script type="text/javascript">
						$(document).ready(function(){
							$("input[name='color']").click(function(){
								var str = "<div class='form-group' id='"+$(this).val()+"'><label class='control-label col-md-2'>Số lượng sản phẩm "+ $(this).prop('placeholder').toLowerCase() +"</label><div class='col-md-10'><input type='number' name='colorquantity' required='required' style='width: 300px; height: 35px;' /></div></div>";
								if($(this).is(":checked")){
									$("#num").before(str);
								}
								if($(this).is(":not(:checked)")){
									var id = "#" + $(this).val();
									$(id).remove();
								}
							});
							
							$("input[name='btn']").click(function(){
								var num = $("input[name='numberimg']").val();
								if(num == ""){
									var msg = "<span id='msg' style='color:red;'>Xin hãy nhập số lượng hình ảnh cần thêm</span>";
									$(this).after(msg);
									setTimeout(function(){
										$("#msg").remove();
									}, 500);
								}
								else{
									for(var i=1; i <= num; i++){
										var str = "<div class='form-group'><label class='control-label col-md-2'>Hình ảnh "+ i +"</label><div class='col-md-10'><input type='file' name='img"+ i +"' required='required' style='width: 300px; height: 35px; padding: 8px;' /></div></div>";
										$("#num").append(str);
									}
									$("input[name='numberimg']").prop("readonly", true);
									$(this).remove();
									$("input[name='numberimg']").css("width", "300px");
									var strsubmit = "<div class='form-group'><div class='col-md-offset-2 col-md-10'>"+
									"<a href='" + "<%=request.getContextPath()%>" + "/admin/product' class='btn btn-round btn-warning'>Trở lại</a>" +
									"<input class='btn btn-round btn-success' type='submit' value='Đồng ý thêm sản phẩm' /></div></div>";
									$("#num").append(strsubmit);
								}
							});
						});
						</script>
						
						<div id="num" class="form-group">
							<label class="control-label col-md-2">Số lượng ảnh sản
								phẩm</label>
							<div class="col-md-10">
								<input type="number" name="numberimg" required="required"
									autocomplete="off" style="width: 220px; height: 35px; margin-bottom: 15px;" />
								<input type="button" name="btn" value="Tiếp tục" class="btn btn-round btn-info" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<%@include file="includes/footer.jsp"%>
			<!-- /footer content -->
		</div>
	</div>


	<!-- Bootstrap -->
	<script src="../backend/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../backend/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../backend/vendors/nprogress/nprogress.js"></script>
	<!-- Datatables -->
	<script
		src="../backend/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="../backend/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script src="../backend/vendors/jszip/dist/jszip.min.js"></script>
	<script src="../backend/vendors/iCheck/icheck.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="../backend/build/js/custom.min.js"></script>

</body>
</html>