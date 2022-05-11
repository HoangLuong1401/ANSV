<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EW12S/SG</title>

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
                            <h3>EASY MESH ACCESS POINT – IGATE EW12S/SG</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom"
                                         src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-01.png" />"
                                         xoriginal="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-01.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a
                                                href="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-01.png" />">
                                            <img class="xzoom-gallery" width="50"
                                                 src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-01.png" />"
                                                 xpreview="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-01.png" />">
                                        </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-02.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-02.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-03.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-03.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-04.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-04.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-05.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800-Mesh-iGate-EW12S-05.png" />">
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
                            <p style="text-align: justify">
                                <strong>iGate EW12S/SG</strong> là bộ thu phát Wi-Fi (Access
                                Point) có chức năng tạo ra một mạng không dây cục bộ (WLAN)
                                nhằm chia sẻ kết nối internet tốc độ cao cho thiết bị người
                                dùng. Mỗi thiết bị iGate <strong>EW12S/SG</strong> được coi là
                                một điểm truy nhập có nhiệm vụ truyền và nhận dữ liệu.
                            </p>
                            <p style="text-align: justify">
                                <strong>iGate EW12S/SG</strong> sử dụng chuẩn công nghệ Wi-Fi
                                tiên tiến 802.11 ac wave 2, hoạt động đồng thời trên 2 băng tần
                                2.4GHz và 5GHz và có khả năng kết nối nhiều thiết bị với nhau
                                bằng cách thiết lập một mạng Wi-Fi Mesh đồng nhất với một SSID.
                            </p>
                            <p style="text-align: justify">Thiết bị có khả năng hoạt
                                động như một bộ định tuyến (Wi-Fi Router) cung cấp kết nối
                                Wi-Fi, dịch vụ WAN thông qua kết nối Ethernet hoặc Wi-Fi
                                Repeater (thu lại sóng Wi-Fi từ các Access Point khác và chia
                                sẻ kết nối cho người dùng). Đặc biệt với chức năng Mesh, thiết
                                bị dễ dàng thiết lập mở rộng vùng phủ Wi-Fi, tạo trải nghiệm
                                xuyên suốt, chất lượng cao. Thiết bị hướng tới đối tượng sử
                                dụng là hộ gia đình, văn phòng, doanh nghiệp vừa và nhỏ, và
                                được thiết kế để đặt bàn với màu trắng trang nhã, sang trọng.</p>
                            <p>
                                <strong>ĐẶC ĐIỂM NỔI BẬT</strong>
                            </p>
                            <ul>
                                <li>Độ tin cậy cao
                                    <ul>
                                        <li>Hoạt động ổn định</li>
                                        <li>Băng thông&nbsp;cao</li>
                                        <li>Công suất phát mạnh</li>
                                    </ul>
                                </li>
                                <li>Quản lý thuận tiện
                                    <ul>
                                        <li>WebGUI/CLI</li>
                                        <li>Mobile app</li>
                                        <li>Cloud</li>
                                    </ul>
                                </li>
                                <li>Tiêu chuẩn quốc tế
                                    <ul>
                                        <li>IEEE 802.11b/g/n@2.4G</li>
                                        <li>IEEE 802.11a/n/ac@5G</li>
                                        <li>IEEE 802.11 K,V</li>
                                    </ul>
                                </li>
                                <li>Cấu hình linh hoạt
                                    <ul>
                                        <li>Cài đặt từ xa</li>
                                        <li>Cấu hình đơn giản</li>
                                        <li>Mở rộng dễ dàng</li>
                                    </ul>
                                </li>
                                <li>Đa kết nối
                                    <ul>
                                        <li>Kết nối có dây</li>
                                        <li>Kết nối không dây</li>
                                        <li>Repeater</li>
                                    </ul>
                                </li>
                                <li>Mesh Wi-Fi
                                    <ul>
                                        <li>Tự động kết nối, cấu hình, chia tải điều hướng</li>
                                    </ul>
                                </li>
                                <li>Ăng ten 3D
                                    <ul>
                                        <li>Tối ưu khả năng đâm xuyên trần, tường</li>
                                    </ul>
                                </li>
                                <li>Seamless Roamming
                                    <ul>
                                        <li>Kết nối ổn định không gián đoạn</li>
                                    </ul>
                                </li>
                                <li>Tốc độ cao
                                    <ul>
                                        <li>Hai băng tần</li>
                                        <li>Băng thông 1.2 Gbps</li>
                                    </ul>
                                </li>
                                <li>Home Wi-Fi
                                    <ul>
                                        <li>Quản lý truy cập</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div id="key-features-prd"
                             class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tính năng chính:</h2>
                            <p>
                                <strong>Tính năng mạng không dây </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Chế độ hoạt động: AP, Repeater, Mesh (MRE-CAP).</li>
                                <li>&nbsp;Hoạt động đồng thời trên 2 băng tần 2.4 GHz và 5
                                    GHz.</li>
                                <li>&nbsp;Tùy chỉnh giới hạn số lượng kết nối đồng thời
                                    tối đa.</li>
                                <li>&nbsp;Tính năng Band Steering tự động chuyển đổi giữa
                                    2 băng tần.</li>
                                <li>&nbsp;Tính năng Mesh:
                                    <ul>
                                        <li>&nbsp;Tự động kết nối các thiết bị AP</li>
                                        <li>&nbsp;Tự động cấu hình mạng</li>
                                        <li>&nbsp;Tự động lựa chọn đường đi tối ưu</li>
                                        <li>&nbsp;Chia tải điều hướng người dùng</li>
                                        <li>Tự động chuyển vùng</li>
                                    </ul>
                                </li>
                            </ul>

                            <p>
                                <strong>Tính năng định tuyến mạng </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Chuyển tiếp và định tuyến lưu lượng: Bridging/
                                    routing/ Static routing.</li>
                                <li>&nbsp;DHCPv4 Server/ DHCP Client/ DHCPv6 server.</li>
                                <li>&nbsp;PPPoE Client.</li>
                                <li>&nbsp;VPN Passthrough (IPSEC, PPTP, L2TP).</li>
                                <li>&nbsp;VLAN.</li>
                                <li>&nbsp;IPv4/IPv6 Dual Stack, IPv6 only.</li>
                                <li>&nbsp;NAT.</li>
                                <li>&nbsp;Port Forwarding.</li>
                                <li>&nbsp;DNS/DDNS.</li>
                            </ul>

                            <p>
                                <strong>Tính năng xác thực và bảo mật </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Bảo mật WPA-PSK, WPA2-PSK, WPAEAP và WPA2-EAP.</li>
                                <li>&nbsp;Mã hóa WEP, TKIP và AES.</li>
                                <li>&nbsp;MAC Filtering.</li>
                                <li>&nbsp;Chế độ ẩn/hiện SSID.</li>
                            </ul>

                            <p>
                                <strong>Tính năng Multi-WAN </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Kết nối WAN không dây (hỗ trợ cả 2 băng tần
                                    2.4GHz và 5GHz).</li>
                                <li>&nbsp;Kết nối Ethernet WAN.</li>
                                <li>&nbsp;Kết nối WAN qua Repeater từ mạng WiFi sẵn có.</li>
                            </ul>

                            <p>
                                <strong>Tính năng quản lý thiết bị </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Quản lý qua WebGUI/CLI/Telnet.</li>
                                <li>&nbsp;Quản lý từ xa qua Mobile App/Cloud.</li>
                                <li>&nbsp;Thông tin thiết bị, thống kê kết nối, giám sát
                                    người dùng.</li>
                                <li>&nbsp;Chuẩn đoán lỗi: Ping, Trace, Log.</li>
                                <li>&nbsp;Nâng cấp Firmware qua Web và Cloud.</li>
                                <li>&nbsp;Sao lưu, phục hồi cấu hình.</li>
                            </ul>

                            <p>
                                <strong>Tính năng Home WiFi </strong>
                            </p>

                            <ul>
                                <li>&nbsp;Chặn truy cập trang web.</li>
                                <li>&nbsp;Giới hạn thời gian truy cập internet.</li>
                                <li>&nbsp;Bật tắt đèn LED theo lịch trình.</li>
                                <li>&nbsp;Quản lý truy nhập theo nhóm.</li>
                            </ul>
                        </div>
                        <div id="specifications-prd"
                             class="col-md-12 pt-5 prd-detail-info table-responsive page-section">
                            <h2 class="title">Thông số kỹ thuật:</h2>
                            <div class="table table-striped table-hover ">
                                <table style="width: 100%">
                                    <tbody>
                                    <tr>
                                        <td class="columnxx" colspan="2">Wi-Fi</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Chuẩn IEEE</td>
                                        <td class="column2">802.11 a/b/g/n/ac wave2 <br>802.11k,v
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tần số</td>
                                        <td class="column2">2.4 - 2.4835 GHz <br>5.170 -
                                            5.835 GHz
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">SSID</td>
                                        <td class="column2">4 SSIDs (2 SSIDs/radio)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">CCU</td>
                                        <td class="column2">30 User/radio</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Radio</td>
                                        <td class="column2">2.4GHz: MIMO 2x2:2<br>5GHz:
                                            MIMO 2x2:2
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">EIRP</td>
                                        <td class="column2">23dBm (MIMO) với EW12S<br>26dBm
                                            (MIMO) với EW12SG
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Cổng kết nối</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">WAN</td>
                                        <td class="column2">1 x FE với EW12S<br>1 x GE với
                                            EW12SG
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">LAN</td>
                                        <td class="column2">1 x GE với EW12SG</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Nguồn</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nguồn phát</td>
                                        <td class="column2">DC 12V - 1A</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Công suất</td>
                                        <td class="column2">8W (tiêu thụ tối đa)</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Thông số khác</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">0℃ ÷ 50℃</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm hoạt động</td>
                                        <td class="column2">≤95%</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Giá đỡ</td>
                                        <td class="column2">Đặt bàn</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Kích thước</td>
                                        <td class="column2">192 x 127 x 60 mm</td>
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