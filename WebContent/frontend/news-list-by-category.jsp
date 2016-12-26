<%@page import="mta.cnpm12.store.controller.frontend.SessionCounter"%>
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
                        <h1>Danh sách tin tức</h1>
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
                    <div class="col-md-9" id="blog-listing-medium">
                    <%
                    ArrayList<BaiViet> listNews = (ArrayList<BaiViet>) request.getAttribute("listNews");
    				for(int i = 0; i < listNews.size(); i++){
    					%>
    					<section class="post">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="image">
                                        <a href="#">
                                            <img src="upload/<%= listNews.get(i).getHinhAnh() %>" class="img-responsive" alt="Example blog post alt">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h2><a style="text-decoration: none;" href="<%= request.getContextPath() %>/news?id=<%= listNews.get(i).getMaBaiViet() %>"><%= listNews.get(i).getTieuDe() %></a></h2>
                                    <div class="clearfix">
                                        <p class="author-category">By Universal
                                        </p>
                                        <p class="date-comments">
                                            <a style="text-decoration: none;"><i class="fa fa-calendar-o"></i> <%= listNews.get(i).getNgayDang() %></a>
                                            <a style="text-decoration: none;"><i class="fa fa-comment-o"></i> 8 Comments</a>
                                        </p>
                                    </div>
                                    <p class="intro"><%= listNews.get(i).getMoTa() %></p>
                                    <p class="read-more"><a href="<%= request.getContextPath() %>/news?id=<%= listNews.get(i).getMaBaiViet() %>" class="btn btn-template-main">Đọc tiếp</a>
                                    </p>
                                </div>
                            </div>
                        </section>
    					<%
    				}
                    %>
                        <div class="pages">
							<ul class="pagination" style="text-align: center;">
							<%
							int totalRecord = Integer.parseInt(request.getAttribute("totalRecord").toString());
							int pageSize = Integer.parseInt(request.getAttribute("pageSize").toString());
							int totalPage = Integer.parseInt(request.getAttribute("totalPage").toString());
							if(totalRecord > 0){
								if(totalPage > 1){
									for(int i = 1; i <= totalPage; i++){
										%>
										<li><a href="<%= request.getContextPath()%>/news-list?page=<%= i %>"><%= i %></a></li>
										<%
									}
								}
							}
							else{
								%>
								<h3 style="color: red;">Không có bài viết nào!</h3>
								<%
							}
							
							%>
							</ul>
						</div>
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
                                	<li><a href="<%= request.getContextPath()%>/news-list?cateid=<%= listCate.get(i).getMaDanhMuc()%>&page=1"><%= listCate.get(i).getTenDanhMuc() %></a></li>
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