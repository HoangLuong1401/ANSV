<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>SMARTBOX 2</title>

</head>

<body>
<link href="<c:url value="/assets/user/css/xzoom.css" />"
      rel="stylesheet">
<script src="<c:url value="/assets/user/js/xzoom.min.js" />"></script>
<style>
    .navbar-product {
        overflow: hidden;
        background-color: #0066b3;
        position: fixed;
        top: 7%;
        width: 101%;
        padding-left: 40%;
        z-index: 1;
    }
    html {
        scroll-behavior: smooth;
    }
    .columnxx {
        padding: 10px;
        padding-left: 40px;
        background: rgba(0, 102, 179, 1);
        color: #fff;
    }
    .navbar-product a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 17px;
    }
    .navbar-product a:hover {
        background: #ddd;
        color: black;
    }
    .xzoom-thumbs a {
        color: #2ba6cb;
        text-decoration: none;
    }
    .xzoom-thumbs {
        margin-top: 10px;
    }
    img.xzoom {
        width: 365px;
    }
    img.xzoom:hover {
        background: #fff;
    }
    .navigation__link.active {
        color: black;
        background-color: #ddd;
    }
</style>
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
    <div>
        <div class="navbar-product products_menu_list d-flex navigation">
            <a class="navigation__link active" href="#img-prd">Hình ảnh</a> <a
                class="navigation__link" href="#overview-prd">Tổng quan</a> <a
                class="navigation__link" href="#key-features-prd">Tính năng
            chính</a> <a class="navigation__link" href="#specifications-prd">Thông
            số kỹ thuật</a>
        </div>
        <div class="main">
            <div id="img-prd" class="page-section">
                <div class="container">
                    <div class="row align-self-center">
                        <div class="col-md-8 offset-md-2 text-center">
                            <h3>Smartbox 2</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom"
                                         src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-01.png" />"
                                         xoriginal="<c:url value="/assets/user/img/portfolio/800x800-smb-2-01.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a
                                                href="<c:url value="/assets/user/img/portfolio/800x800-smb-2-01.png" />">
                                            <img class="xzoom-gallery" width="50"
                                                 src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-01.png" />"
                                                 xpreview="<c:url value="/assets/user/img/portfolio/800x800-smb-2-01.png" />">
                                        </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-smb-2-02.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-02.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-smb-2-03.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-03.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-smb-2-04.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-04.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-smb-2-05.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-smb-2-05.png" />">
                                    </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="infor">
                <div class="container">
                    <div class="row">
                        <div id="overview-prd"
                             class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tổng Quan:</h2>
                            <p style="text-align: justify;">
                                <strong>SmartBox 2</strong> là thiết bị Set-top Box do VNPT
                                Technology nghiên cứu phát triển và sản xuất. Thiết bị sử dụng
                                hệ điều hành Android Kitkat 4.4 và được tối ưu cho dịch vụ IPTV
                                và Internet TV.
                            </p>
                            <p style="text-align: justify;">Thiết bị đã được chứng nhận, công bố hợp quy theo quy
                                định của Bộ Thông tin và truyền thông, và đã cung cấp ra thị
                                trường gần 1 triệu sản phẩm.</p>
                        </div>
                        <div id="key-features-prd"
                             class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tính năng chính:</h2>
                            <ul>
                                <li>Phù hợp triển khai dịch vụ IPTV, Internet TV và các
                                    ứng dụng Android</li>
                                <li>Hỗ trợ bảo vệ bản quyền nội dung DRM</li>
                                <li>Quản lý từ xa qua hệ thống ONE Telco Platform và giao
                                    thức chuẩn TR-069</li>
                                <li>Cập nhật phần mềm tự động qua OTA</li>
                            </ul>
                        </div>
                        <div id="specifications-prd"
                             class="col-md-12 pt-5 prd-detail-info table-responsive page-section">
                            <h2 class="title">Thông số kỹ thuật:</h2>
                            <div class="table table-striped table-hover ">
                                <table style="width: 100%">
                                    <tbody>

                                    <tr>
                                        <td class="columnxx" colspan="2">Hệ thống</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">CPU</td>
                                        <td class="column2">Quad core Cortex A5r4<br>1.5GHz
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">GPU</td>
                                        <td class="column2">Quad-core 600MHz</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">RAM</td>
                                        <td class="column2">1GB/2GB DDRIII</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Flash</td>
                                        <td class="column2">8 MB</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Hỗ trợ</td>
                                        <td class="column2">Micro SD, hỗ trợ tối đa</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">SD Card</td>
                                        <td class="column2">128G</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Kết nối mạng</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Wi-Fi</td>
                                        <td class="column2">Wifi IEEE 802.11 b/g/n (2.4GHz,
                                            onboard)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Ethernet</td>
                                        <td class="column2">RJ45 10/100Mbps Ethernet LAN, chống
                                            sét 1,5KV</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Quản lý</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Giao thức</td>
                                        <td class="column2">TR-069</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Quản lý từ xa</td>
                                        <td class="column2">Hệ thống ONE Telco Platform</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Cập nhật firmware</td>
                                        <td class="column2">Tự động qua OTA</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Audio/Video</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ phân giải video</td>
                                        <td class="column2">Tối đa 1080p@60fps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Định dạng video</td>
                                        <td class="column2">H.264/MPEG-4 AVC Main Profile Level
                                            3, <br>H.265/HEVC Main Profile Level 3 720p, 1080i,
                                            1080p
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tỷ lệ khung hình</td>
                                        <td class="column2">4:3, 16:9</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Audio</td>
                                        <td class="column2">MPEG1 Layer 1/2, AAC 44 kHz, 48 kHz</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Hình ảnh</td>
                                        <td class="column2">JPEG/BMP/GIF/PNG/TIFF</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Cổng kết nối</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">A/V</td>
                                        <td class="column2">1x Mini A/V<br>1x S/PDIF<br>1x
                                            HDMI
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">USB</td>
                                        <td class="column2">2x USB 2.0<br>Hỗ trợ chuột và
                                            bàn phím
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">IR</td>
                                        <td class="column2">Điều khiển hồng ngoại gắn trong và
                                            kéo dài</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Phần mềm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Hệ điều hành</td>
                                        <td class="column2">Android 4.4 (KitKat)</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Bảo vệ nội dung</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">DRM</td>
                                        <td class="column2">Verimatrix (tùy chọn)<br>HDCP
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Nguồn điện</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Adapter</td>
                                        <td class="column2">Nguồn cấp: 12V - 1.25A, bảo vệ quá
                                            áp/quá dòng</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Môi trường hoạt động</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">5℃ ÷ 40℃</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm</td>
                                        <td class="column2">&lt;95%</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document)
        .ready(
            function() {
                $(".xzoom, .xzoom-gallery").xzoom({
                    tint : '#333',
                    Xoffset : 15,
                    title : true
                });
                $(".navbar-product a").click(function() {
                    $(".navbar-product a").removeClass("active"); //Remove any "active" class
                    $(this).addClass("active"); //Add "active" class to selected tab
                });
                var lastId, topMenu = $(".products_menu_list"), topMenuHeight = topMenu
                        .outerHeight() + 160,
                    // All list items
                    menuItems = topMenu.find("a"),
                    // Anchors corresponding to menu items
                    scrollItems = menuItems.map(function() {
                        var item = $($(this).attr("href"));
                        if (item.length) {
                            return item;
                        }
                    });
                // Bind click handler to menu items
                // // so we can get a fancy scroll animation
                menuItems
                    .click(function(e) {
                        e.preventDefault();
                        var href = $(this).attr("href"), offsetTop = href === "#" ? 0
                            : $(href).offset().top
                            - topMenuHeight + 64; //fix scroll
                        console.log('offsetTop:' + offsetTop);
                        $('html, body').stop().animate({
                            scrollTop : offsetTop
                        }, 0);
                    });
                $(window)
                    .scroll(
                        function() {
                            var topMenu = $(".products_menu_list"), scrollDistance = $(
                                window).scrollTop() + 160;
                            // Show/hide menu on scroll
                            //if (scrollDistance >= 850) {
                            //		$('nav').fadeIn("fast");
                            //} else {
                            //		$('nav').fadeOut("fast");
                            //}
                            // Assign active class to nav links while scolling
                            $('.page-section')
                                .each(
                                    function(i) {
                                        if ($(this)
                                            .position().top <= scrollDistance) {
                                            $(
                                                '.navigation a.active')
                                                .removeClass(
                                                    'active');
                                            $(
                                                '.navigation a')
                                                .eq(
                                                    i)
                                                .addClass(
                                                    'active');
                                        }
                                    });
                        }).scroll();
                // // Bind to scroll
            });
</script>
</body>
</html>