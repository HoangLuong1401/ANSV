<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
</head>
<body>

<section id="about-content">
    <div class="container">
        <div class="row align-self-center text-center">
            <div class="col-md-10 offset-md-2 text-center breadcrumb-info">
                <h2 class="text-white text-uppercase">Chi tiết sản phẩm</h2>
            </div>
        </div>
    </div>
</section>
<section id="product_detail">
    <div class="container">
        <div class="row align-self-center ">
            <div class="col-md-10 offset-md-2 text-center breadcrumb-info">
                <h2 class="title">Tên sản phẩm</h2>
                <div class="thumb-wp mt-5 col-md-5">
                    <a href="" title="" id="main-thumb"> <img id="zoom"
                                                              class="img-fluid"
                                                              src="<c:url value="/assets/user/img/portfolio/portfolio-1-350x350.jpg" />"
                                                              data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-1-700x700.jpg" />" />
                    </a>
                    <div id="list-thumb">
                        <a href=""
                           data-image="<c:url value="/assets/user/img/portfolio/portfolio-1-350x350.jpg" />"
                           data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-1-700x700.jpg" />">
                            <img id="zoom"
                                 src="<c:url value="/assets/user/img/portfolio/portfolio-1-50x50.jpg" />" />
                        </a> <a href=""
                                data-image="<c:url value="/assets/user/img/portfolio/portfolio-4-350x350.jpg" />"
                                data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-4-700x700.jpg" />">
                        <img id="zoom"
                             src="<c:url value="/assets/user/img/portfolio/portfolio-4-50x50.jpg" />" />
                    </a> <a href=""
                            data-image="<c:url value="/assets/user/img/portfolio/portfolio-9-350x350.jpg" />"
                            data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-9-700x700.jpg" />">
                        <img id="zoom"
                             src="<c:url value="/assets/user/img/portfolio/portfolio-9-50x50.jpg" />" />
                    </a> <a href=""
                            data-image="<c:url value="/assets/user/img/portfolio/portfolio-1-350x350.jpg" />"
                            data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-1-700x700.jpg" />">
                        <img id="zoom"
                             src="<c:url value="/assets/user/img/portfolio/portfolio-1-50x50.jpg" />" />
                    </a> <a href=""
                            data-image="<c:url value="/assets/user/img/portfolio/portfolio-4-350x350.jpg" />"
                            data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-4-700x700.jpg" />">
                        <img id="zoom"
                             src="<c:url value="/assets/user/img/portfolio/portfolio-4-50x50.jpg" />" />
                    </a> <a href=""
                            data-image="<c:url value="/assets/user/img/portfolio/portfolio-9-350x350.jpg" />"
                            data-zoom-image="<c:url value="/assets/user/img/portfolio/portfolio-9-700x700.jpg" />">
                        <img id="zoom"
                             src="<c:url value="/assets/user/img/portfolio/portfolio-9-50x50.jpg" />" />
                    </a>
                    </div>
                </div>
                <div class="col-md-5">
                    <h3><b>Thông số</b></h3>

                </div>
            </div>
        </div>
    </div>
</section>
<script>
    /*Đầu: Đoạn code phần product_detail (Hiệu ứng phóng lớn)*/
    $(document).ready(function() {
        $("#zoom").elevateZoom({ gallery: 'list-thumb', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif' });
        var list_thumb = $('#list-thumb');
        list_thumb.owlCarousel({
            navigation: true,
            navigationText: false,
            paginationNumbers: false,
            pagination: false,
            stopOnHover: true,
            items: 4, //10 items above 1000px browser width
            itemsDesktop: [1000, 3], //5 items between 1000px and 901px
            itemsDesktopSmall: [900, 3], // betweem 900px and 601px
            itemsTablet: [768, 2], //2 items between 600 and 0
            itemsMobile: true // itemsMobile disabled - inherit from itemsTablet option
        });
    });
    /*Cuối: Đoạn code phần product_detail (Hiệu ứng phóng lớn)*/
</script>
</body>
</html>