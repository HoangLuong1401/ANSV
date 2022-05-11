<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><dec:title default="Master-Layout" /></title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="<c:url value="/assets/user/img/logo_ansv.png" />" rel="icon">
    <link href="<c:url value="/assets/user/img/apple-touch-icon.png" />"
          rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link
            href="<c:url value="/assets/user/vendor/bootstrap/css/bootstrap.min.css" />"
            rel="stylesheet">
    <link rel="stylesheet"
          href="<c:url value="/assets/user/vendor/bootstrap/css/3.4.1bootstrap.min.css" />">
    <link
            href="<c:url value="/assets/user/vendor/icofont/icofont.min.css" />"
            rel="stylesheet">
    <link
            href="<c:url value="/assets/user/vendor/boxicons/css/boxicons.min.css" />"
            rel="stylesheet">
    <link
            href="<c:url value="/assets/user/vendor/animate.css/animate.min.css" />"
            rel="stylesheet">
    <link href="<c:url value="/assets/user/vendor/venobox/venobox.css" />"
          rel="stylesheet">
    <link
            href="<c:url value="/assets/user/vendor/owl.carousel/assets/owl.carousel.css" />"
            rel="stylesheet">
    <link rel="stylesheet"
          href="<c:url value="/assets/user/vendor/owl.carousel/assets/owl.theme.css" />">
    <link href="<c:url value="/assets/user/vendor/aos/aos.css" />"
          rel="stylesheet">
    <link
            href="<c:url value="/assets/user/vendor/remixicon/remixicon.css" />"
            rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="<c:url value="/assets/user/css/about_us.css" />"
          rel="stylesheet">

    <script
            src="<c:url value="/assets/user/vendor/jquery/3.5.1.jquery.min.js" />"></script>
    <!-- <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

    <link rel="stylesheet"
          href="<c:url value="/assets/user/vendor/font-awesome/css/font-awesome.min.css" />">



    <!-- ===== CSS chạy hiệu ứng (theme) cho background ===== -->
    <link rel='stylesheet' id='style-css'
          href='<c:url value="/assets/user/css/css_background_animation/style_background_animation.css" />' type='text/css' media='all' />

    <!-- ===== JS chạy hiệu ứng (theme) cho background ===== -->
    <script type='text/javascript'
            src='<c:url value="/assets/user/js/js_background_animation/addons.js" />'></script>

    <style type="text/css">
        .header_text {
            font-weight: bold;
            color: orange;
            padding-top: 3%;
        }
        .title_news {
            color: #FF6600;
            font-weight: bold;
        }

        .b-n-images {
            height: 220px;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            position: relative;
            border-radius: 16px 16px 0 0;
            background-color: #fff;
        }
    </style>

</head>
<body>
<!-- Navigation -->
<%@include file="/WEB-INF/views/layouts/web/header.jsp"%>

<dec:body />

<!-- Footer -->
<%@include file="/WEB-INF/views/layouts/web/footer.jsp"%>

<!-- Vendor JS Files -->
<!-- <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
        src="<c:url value="/assets/user/vendor/bootstrap/js/3.4.1bootstrap.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/jquery.easing/jquery.easing.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/php-email-form/validate.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/jquery-sticky/jquery.sticky.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/isotope-layout/isotope.pkgd.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/venobox/venobox.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/waypoints/jquery.waypoints.min.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/owl.carousel/owl.carousel.js" />"></script>
<script src="<c:url value="/assets/user/vendor/aos/aos.js" />"></script>



<!-- Template Main JS File -->
<script src="<c:url value="/assets/user/js/main_new.js" />"></script>
<script
        src="<c:url value="/assets/user/vendor/elevatezoom/jquery.elevatezoom.min.js" />"></script>

<script src="<c:url value="/assets/user/js/js_background_animation/handmade_bg_animation.js" />"></script>
</body>
</html>