<%@page import="mta.cnpm12.store.beans.BinhLuanBaiViet"%>
<%@page import="mta.cnpm12.store.beans.DanhMucBaiViet"%>
<%@page import="mta.cnpm12.store.beans.BaiViet"%>
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
    <link href="frontend/css/style.default.css" rel="stylesheet" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes -->
    <link href="frontend/css/custom.css" rel="stylesheet">
    <link href="frontend/css/owl.carousel.css" rel="stylesheet">
    <link href="frontend/css/owl.theme.css" rel="stylesheet">
</head>

<style type="text/css">
	#post-content>p img
	{
		max-width: 800px;
	}
	#post-content p
	{
		text-align: justify;
	}
	
</style>

<body>
    <div id="all">
        <header>
            <!-- *** TOP *** -->
            <%@include file="includes/topbar.jsp"%>
            <!-- *** TOP END *** -->

            <!-- *** NAVBAR *** -->
			<%@include file="includes/navbar.jsp" %>
            <!-- *** NAVBAR END *** -->
        </header>

        <!-- *** LOGIN MODAL *** -->
		<%@include file="includes/login-modal.jsp" %>
        <!-- *** LOGIN MODAL END *** -->

        <div id="heading-breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h1>Nội dung bài viết</h1>
                    </div>
                    <div class="col-md-6">
                        <ul class="breadcrumb">
                            <li><a href="#">Trang chủ</a>
                            </li>
                            <li>Tin tức</li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

        <div id="content">
            <div class="container">
                <div class="row">
                    <!-- *** LEFT COLUMN *** -->
                    <div class="col-md-9" id="blog-post">
                    <%
                    BaiViet news = (BaiViet) request.getAttribute("e");
                    %>
                        <p class="text-muted text-uppercase mb-small text-right">By Universal | <%= news.getNgayDang() %></p>
                        <p class="lead"><b><%= news.getTieuDe() %></b></p>
                        <p class="lead"><%= news.getMoTa() %></p>
                        <div id="post-content">
                        	<%= news.getNoiDung() %>
                        </div>
                        <!-- /#post-content -->

                        <div id="comments">
                            <h4 class="text-uppercase"><%= request.getAttribute("countComment") %> bình luận</h4>
                            <%
                            ArrayList<BinhLuanBaiViet> listComment = (ArrayList<BinhLuanBaiViet>) request.getAttribute("listComment");
    						for(int i = 0; i < listComment.size(); i++){
    							%>
    							<div class="row comment">
	                                <div class="col-sm-3 col-md-2 text-center-xs">
	                                    <p>
	                                        <img src="frontend/img/icon-profile.jpg" class="img-responsive img-circle" alt="">
	                                    </p>
	                                </div>
	                                <div class="col-sm-9 col-md-10">
	                                    <h5 class="text-uppercase"><%= listComment.get(i).getTenNguoiBinhLuan() %></h5>
	                                    <p class="posted"><i class="fa fa-clock-o"></i> <%= listComment.get(i).getNgayGio() %></p>
	                                    <p><%= listComment.get(i).getNoiDung() %></p>
	                                </div>
	                            </div>
    							<%
    						}
                            %>
                            
                            <!-- /.comment -->
                        </div>
                        <!-- /#comments -->

                        <div id="comment-form">
                            <h4 class="text-uppercase">Để lại bình luận</h4>
                            <form method="post" action="<%= request.getContextPath()%>/news">
                            	<input type="hidden" name="newsid" value="<%= news.getMaBaiViet() %>" />
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Họ tên <span class="required">*</span>
                                            </label>
                                            <input type="text" class="form-control" name="name" autocomplete="off" required="required">
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
                                        <button type="submit" class="btn btn-template-main"><i class="fa fa-comment-o"></i> Gửi bình luận</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /#comment-form -->
                    </div>
                    <!-- /.col-md-9 -->
					
                    <!-- *** LEFT COLUMN END *** -->
                    
                    <!-- *** RIGHT COLUMN *** -->
                    <div class="col-md-3">
                        <!-- *** MENUS AND WIDGETS *** -->
                        <div class="panel panel-default sidebar-menu">
                            <div class="panel-heading">
                                <h3 class="panel-title">Danh mục tin tức</h3>
                            </div>

                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                <%
                                ArrayList<DanhMucBaiViet> listCate = (ArrayList<DanhMucBaiViet>) request.getAttribute("listCate");
                                for(int i = 0; i < listCate.size(); i++){
                                	%>
                                	<li><a href="<%= request.getContextPath()%>/news-list?cateid=<%= listCate.get(i).getMaDanhMuc()%>"><%= listCate.get(i).getTenDanhMuc() %></a></li>
                                	<%
                                }
                                %>
                                </ul>
                            </div>
                        </div>
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
		<%@include file="includes/footer.jsp" %>
        <!-- *** FOOTER END *** -->
    </div>
    <!-- /#all -->


    <!-- #### JAVASCRIPT FILES ### -->
    <script src="frontend/js/jquery-1.11.0.min.js"></script>
    <script>
        window.jQuery || document.write('<script src="frontend/js/jquery-1.11.0.min.js"><\/script>')
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