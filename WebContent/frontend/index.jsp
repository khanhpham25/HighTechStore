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

        <section class="bar background-white no-mb" style="background: #f0f0f0;">
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