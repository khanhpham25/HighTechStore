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
    <!-- Responsivity for older IE -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
    <!-- Favicon and apple touch icons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="img/apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="img/apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png" />
    <!-- owl carousel css -->
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

        <section>
            <!-- *** HOMEPAGE CAROUSEL *** -->
            <%@include file="includes/sliders.jsp" %>
            <!-- *** HOMEPAGE CAROUSEL END *** -->
        </section>

		<section class="bar background-white">
            <div class="container">
                <div class="col-md-12">
                    <%@include file="includes/adv.jsp" %>
                </div>
            </div>
        </section>

        <section class="bar background-pentagon no-mb">
            <div class="container">
                <%@include file="includes/hot-product.jsp" %>
            </div>
        </section>
        <!-- /.bar -->

        <section class="bar background-image-fixed-2 no-mb color-white text-center">
            <div class="dark-mask"></div>
            <%@include file="includes/banner.jsp" %>
        </section>

        <section class="bar background-white no-mb">
            <%@include file="includes/hot-news.jsp" %>
        </section>
        <!-- /.bar -->

        <!-- *** FOOTER *** -->
        <%@include file="includes/footer.jsp" %>
        <!-- /#footer -->
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