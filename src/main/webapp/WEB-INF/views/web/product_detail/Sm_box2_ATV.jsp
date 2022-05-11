<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMARTBOX 2 ATV</title>

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
                            <h3>Smartbox 2 ATV</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom"
                                         src="<c:url value="/assets/user/img/portfolio/smart-box2-1.png" />"
                                         xoriginal="<c:url value="/assets/user/img/portfolio/smart-box2-1.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a
                                                href="<c:url value="/assets/user/img/portfolio/smart-box2-1.png" />">
                                            <img class="xzoom-gallery" width="50"
                                                 src="<c:url value="/assets/user/img/portfolio/smart-box2-1.png" />"
                                                 xpreview="<c:url value="/assets/user/img/portfolio/smart-box2-1.png" />">
                                        </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/smart-box2-2.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/smart-box2-2.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/smart-box2-3.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/smart-box2-3.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/smart-box2-4.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/smart-box2-4.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/smart-box2-5.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/smart-box2-5.png" />">
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
                                <strong>SmartBox 2 ATV</strong> là thiết bị Set-top Box do VNPT
                                Technology nghiên cứu phát triển và sản xuất. Thiết bị sử dụng
                                hệ điều hành Android TVTM 9 và được tối ưu cho dịch vụ IPTV và
                                Internet TV.
                            </p >
                            <p style="text-align: justify;">Thiết bị đã được chứng nhận, công bố hợp quy theo quy
                                định của Bộ Thông tin và truyền thông, và đã cung cấp ra thị
                                trường gần 1 triệu sản phẩm.</p>
                        </div>
                        <div id="key-features-prd"
                             class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tính năng chính:</h2>
                            <ul>
                                <li>Android TV™ 9, được chứng nhận bởi Google</li>
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
                                        <td class="column2">Quad-core Cortex-A53</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">GPU</td>
                                        <td class="column2">Penta Core Mali-450 up to 650MHz</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">RAM</td>
                                        <td class="column2">1GB DDRIII</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Flash</td>
                                        <td class="column2">8 MB</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Video</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ phân giải</td>
                                        <td class="column2">Tối đa 1080p@60fps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Giải mã video</td>
                                        <td class="column2">VP9 1080@60fps, <br>H265
                                            10-bit 1080@60fps, <br>H264 1080@60fps,<br>MPEG1/2/4,
                                            AVS+, WMV / VC-1, Real Video 8/9/10
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Định dạng video</td>
                                        <td class="column2">MKV, WMV, MPG, MPEG,<br>DAT,
                                            AVI, MOV, ISO, MP4, RM
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Audio</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Giải mã audio</td>
                                        <td class="column2">MPEG1/2/4, MP3,<br>AAC/AAC+,
                                            WMA/WMA -pro, FLAC, OGG
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Định dạng audio</td>
                                        <td class="column2">P3, AAC, WMA, RM,<br>FLAC,
                                            OGG, WAV, M4A,<br>MP4, APE, MP1/2
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Hình ảnh</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Định dạng hình ảnh</td>
                                        <td class="column2">HD JPEG/BMP/PNG</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Phụ đề</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Định dạng phụ đề</td>
                                        <td class="column2">SRT, ASS, SSA</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Bảo vệ nội dung</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">DRM</td>
                                        <td class="column2">Widevine, Playready HDCP</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Phần mềm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Hệ điều hành</td>
                                        <td class="column2">Android TV™ 9.0</td>
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
                                        <td class="columnxx" colspan="2">Kết nối mạng</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Wi-Fi</td>
                                        <td class="column2">IEEE 802.11 a/b/g/n</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Ethernet</td>
                                        <td class="column2">IEEE 802.3 10/100 Base-Tx</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bluetooth</td>
                                        <td class="column2">Bluetooth 4.2</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Cổng kết nối</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">A/V</td>
                                        <td class="column2">1x Mini A/V<br>1x S/PDIF<br>1x
                                            HDMI 2.0b
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">USB</td>
                                        <td class="column2">2x USB 2.0<br>Hỗ trợ chuột và
                                            bàn phím
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Nguồn điện</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Adapter</td>
                                        <td class="column2">Nguồn cấp: 5V - 2A, bảo vệ quá
                                            áp/quá dòng</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Môi trường hoạt động</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">0℃ ÷ 40℃</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm hoạt động</td>
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