<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>HVIP01</title>
</head>

<body>
<link
        href="<c:url value="/assets/user/css/xzoom.css" />"
        rel="stylesheet">
<script
        src="<c:url value="/assets/user/js/xzoom.min.js" />"></script>
<style>
    .navbar-product {
        overflow: hidden;
        background-color: #0066b3;
        position: fixed;
        width: 101%;
        padding-left: 30%;
        z-index: 1;
    }
    html {
        scroll-behavior: smooth;
    }
    .columnxx {
        padding: 10px;
        padding-left: 40px;
        background: rgba(0,102,179,1);
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
    <div id="particles-js" class="particles-js particles-home-section-2"></div>
    <div class="container">
        <div class="row align-self-center text-center">
            <div class="col-md-10 offset-md-2 text-center breadcrumb-info">
                <h2 class="header_text text-uppercase">Chi tiết sản phẩm</h2>
            </div>
        </div>
    </div>
</section>
<section id="product_detail">
    <div>
        <div class="navbar-product products_menu_list navigation">
            <a class="navigation__link active" href="#img-prd">Hình ảnh</a>
            <a class="navigation__link" href="#overview-prd">Tổng quan</a>
            <a class="navigation__link" href="#key-features-prd">Tính năng chính</a>
            <a class="navigation__link" href="#specifications-prd">Thông số kỹ thuật</a>
        </div>
        <div class="main">
            <div id="img-prd" class="page-section">
                <div class="container">
                    <div class="row align-self-center">
                        <div class="col-md-8 offset-md-2 text-center">
                            <h3>Home Vision HVIP01</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom" src="<c:url value="/assets/user/img/portfolio/HVIP01_3.png" />" xoriginal="<c:url value="/assets/user/img/portfolio/HVIP01_3.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a href="<c:url value="/assets/user/img/portfolio/HVIP01_3.png" />">
                                            <img class="xzoom-gallery" width="50" src="<c:url value="/assets/user/img/portfolio/HVIP01_3.png" />" xpreview="<c:url value="/assets/user/img/portfolio/HVIP01_3.png" />">
                                        </a>
                                        <a href="<c:url value="/assets/user/img/portfolio/HVIP01_4.png" />">
                                            <img class="xzoom-gallery" width="50" src="<c:url value="/assets/user/img/portfolio/HVIP01_4.png" />">
                                        </a>
                                        <a href="<c:url value="/assets/user/img/portfolio/HVIP01_5.png" />">
                                            <img class="xzoom-gallery" width="50" src="<c:url value="/assets/user/img/portfolio/HVIP01_5.png" />">
                                        </a>
                                        <a href="<c:url value="/assets/user/img/portfolio/HVIP01_2.png" />">
                                            <img class="xzoom-gallery" width="50" src="<c:url value="/assets/user/img/portfolio/HVIP01_2.png" />">
                                        </a>
                                        <a href="<c:url value="/assets/user/img/portfolio/HVIP01_1.png" />">
                                            <img class="xzoom-gallery" width="50" src="<c:url value="/assets/user/img/portfolio/HVIP01_1.png" />">
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
                        <div id="overview-prd" class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tổng Quan:</h2>
                            <p style="text-align: justify;"><strong>Home Vision HVIP01</strong>  là thiết bị giám sát an ninh trong nhà độ phân giải cao kết hợp với khả năng nhìn ban đêm mang đến chất lượng hình ảnh rõ nét thậm chí ở những vị trí không có ánh sáng. Góc quan sát rộng giúp gia chủ, người quản lý có thể theo dõi, kiểm soát toàn cảnh khu vực hộ gia đình, văn phòng, xí nghiệp, cơ quan, cửa hàng một cách dễ dàng.</p>
                        </div>
                        <div id="key-features-prd" class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tính năng chính:</h2>
                            <ul>
                                <li>Độ phân giải cao (full HD) kết hợp với khả năng nhìn ban đêm mang đến chất lượng hình ảnh rõ nét thậm chí ở những vị trí không có ánh sáng.</li>
                                <li>Phát hiện chuyển động và cảnh báo chính xác, giúp gia chủ an tâm khi vắng nhà.</li>
                                <li>Hỗ trợ đàm thoại 2 chiều.</li>
                                <li>Hỗ trợ lưu trữ video, hình ảnh trên cloud, thẻ nhớ và điện thoại di động.</li>
                                <li>Thiết kế nhiều lựa chọn kết nối mạng: Thiết bị hỗ trợ lựa chọn kết nối mạng Wifi và Ethernet để đáp ứng mọi mô hình triển khai.</li>
                            </ul>
                        </div>
                        <div id="specifications-prd" class="col-md-12 pt-5 prd-detail-info table-responsive page-section">
                            <h2 class="title">Thông số kỹ thuật: </h2>
                            <div class="table table-striped table-hover ">
                                <table style="width: 100%">
                                    <tbody>
                                    <tr>
                                        <td class="columnxx" colspan="2">Camera</td>
                                    </tr>

                                    <tr>
                                        <td class="column1">Cảm biến ảnh</td>
                                        <td class="column2">Kích thước 1/2.7”, công nghệ CMOS</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Số điểm ảnh</td>
                                        <td class="column2">1932(H) x 1092(V) <br>(16:9 Mode)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ sáng tối thiểu có thể ghi ảnh</td>
                                        <td class="column2">Color: 0.1Lux (F1.2, AGC ON) Black/White: 0.05 Lux (F1.2, AGC ON), 0 Lux với IR</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bộ lọc hồng ngoại (ICR)</td>
                                        <td class="column2">Có</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Dải nhạy sáng</td>
                                        <td class="column2">52dB</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Đèn hồng ngoại (IR)</td>
                                        <td class="column2">Khoảng cách chiếu sáng tối thiểu 10m</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Điều khiển bật tắt IR</td>
                                        <td class="column2">Tự động</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Số IR LED</td>
                                        <td class="column2">4</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Ống kính</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Kiểu ống kính</td>
                                        <td class="column2">Tiêu cự có độ dài cố định</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ dài tiêu cự</td>
                                        <td class="column2">4mm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Góc quan sát</td>
                                        <td class="column2">85° theo phương ngang</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Quay quét</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Pan</td>
                                        <td class="column2">0° ÷ 355°</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tilt</td>
                                        <td class="column2">0° ÷ 70°</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Video</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Chuẩn nén</td>
                                        <td class="column2">H265</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Số luồng</td>
                                        <td class="column2">2</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ phân giải</td>
                                        <td class="column2">FullHD, HD, SD</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tốc độ khung hình</td>
                                        <td class="column2">1080P@15fps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tốc độ truyền dữ liệu</td>
                                        <td class="column2">32Kbps ÷ 2Mbps</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Audio</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Chuẩn nén</td>
                                        <td class="column2">G.711A/G.711U/ADPCM</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Đàm thoại 2 chiều</td>
                                        <td class="column2">Có (Loa, mic tích hợp trong camera)</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Bộ xử lý ảnh</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Chế độ ngày/đêm</td>
                                        <td class="column2">Tự động</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Phát hiện chuyển động</td>
                                        <td class="column2">Bật/ tắt</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Lật ảnh (Flip)</td>
                                        <td class="column2">Có</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Kết nối mạng</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Wi-Fi</td>
                                        <td class="column2">IEEE 802.11b/g/n</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Ethernet</td>
                                        <td class="column2">IEEE 802.3 10/100Base-T</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Nguồn</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nguồn cấp</td>
                                        <td class="column2">5VDC – 1A</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Công suất</td>
                                        <td class="column2">&lt;5W</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Các thông số khác</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Lưu trữ ngoài</td>
                                        <td class="column2">Thẻ nhớ Micro SD/SDHC/SDXC, tối đa 128GB</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">-20°C ÷ 60°C</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm hoạt động</td>
                                        <td class="column2">0% ÷ 95%</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Chất liệu vỏ</td>
                                        <td class="column2">Nhựa</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Kích thước</td>
                                        <td class="column2">80 x 80 x 110mm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Trọng lượng</td>
                                        <td class="column2">180g</td>
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
    $(document).ready(function() {
        $(".xzoom, .xzoom-gallery").xzoom({
            tint: '#333',
            Xoffset: 15,
            title: true
        });

        $(".navbar-product a").click(function () {

            $(".navbar-product a").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
        });
        var lastId,
            topMenu = $(".products_menu_list"),
            topMenuHeight = topMenu.outerHeight() + 160,
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
        menuItems.click(function(e) {
            e.preventDefault();
            var href = $(this).attr("href"),
                offsetTop = href === "#" ? 0 : $(href).offset().top - topMenuHeight + 64; //fix scroll
            console.log('offsetTop:' + offsetTop);
            $('html, body').stop().animate({
                scrollTop: offsetTop
            }, 0);
        });
        $(window).scroll(function() {
            var topMenu = $(".products_menu_list"),
                scrollDistance = $(window).scrollTop() + 160;
            // Assign active class to nav links while scolling
            $('.page-section').each(function(i) {
                if ($(this).position().top <= scrollDistance) {
                    $('.navigation a.active').removeClass('active');
                    $('.navigation a').eq(i).addClass('active');
                }
            });
        }).scroll();
        // // Bind to scroll

    });
</script>
</body>
</html>