<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><dec:title default="Master-Layout" /></title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="<c:url value="/assets/user/img/logo/logo_ansv_big_new-removebg-preview.png" />" rel="icon">
    <link href="<c:url value="/assets/user/img/logo_ansv.png" />" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link
            href="<c:url value="/assets/user/vendor/bootstrap/css/bootstrap.min.css" />"
            rel="stylesheet">
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
    <link rel="stylesheet"
          href="<c:url value="/assets/user/vendor/owl.carousel/assets/owl.theme.css" />">
    <link
            href="<c:url value="/assets/user/vendor/owl.carousel/assets/owl.carousel.min.css" />"
            rel="stylesheet">
    <link href="<c:url value="/assets/user/vendor/aos/aos.css" />"
          rel="stylesheet">
    <link
            href="<c:url value="/assets/user/vendor/remixicon/remixicon.css" />"
            rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="<c:url value="/assets/user/css/style-new.css" />"
          rel="stylesheet">

    <link href="<c:url value="/assets/user/css/btn/btn_style_new.css" />"
          rel="stylesheet">

    <!-- Jquery -->
    <script src="<c:url value="/assets/user/vendor/jquery/jquery.min.js" />"></script>


</head>
<body>
<!-- Navigation -->
<%@include file="/WEB-INF/views/layouts/web/header.jsp"%>

<dec:body />

<!-- Footer -->
<%@include file="/WEB-INF/views/layouts/web/footer.jsp"%>

<!-- Vendor JS Files -->
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

<script src="<c:url value="/assets/user/js/main.js" />"></script>
</body>
</html>
