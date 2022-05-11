<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GW040_H</title>

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
                            <h3>GPON ONT iGate GW040-H</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom"
                                         src="<c:url value="/assets/user/img/portfolio/040_1.png" />"
                                         xoriginal="<c:url value="/assets/user/img/portfolio/040_1.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a
                                                href="<c:url value="/assets/user/img/portfolio/040_1.png" />">
                                            <img class="xzoom-gallery" width="50"
                                                 src="<c:url value="/assets/user/img/portfolio/040_1.png" />"
                                                 xpreview="<c:url value="/assets/user/img/portfolio/040_1.png" />">
                                        </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_2.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_2.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_3.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_3.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_4.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_4.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_5.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_5.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_6.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_6.png" />">
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/040_7.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/040_7.png" />">
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
                                <strong>iGate GW040-H</strong> là thiết bị GPON ONT dành cho
                                dịch vụ băng rộng cáp quang tốc độ cao; đáp ứng nhu cầu truy
                                cập mạng, xem truyền hình và thoại Internet cho gia đình; cũng
                                như mang lại kết nối mạng ổn định dành cho doanh nghiệp.
                            </p>
                            <p style="text-align: justify">Sản phẩm hỗ trợ Wi-Fi chuẩn
                                ac tốc độ cao, được tối ưu hoạt động trên cả 2 băng tần 2.4GHz
                                và 5GHz.</p>
                            <p style="text-align: justify">
                                <strong>iGate GW040-H</strong> là một thành phần trong giải
                                pháp GPON tổng thể do VNPT Technology phát triển, bao gồm: ONT,
                                OLT và hệ thống quản lý ONE Telco Platform.
                            </p>
                            <p>
                                <strong>ĐẶC ĐIỂM NỔI BẬT</strong>
                            </p>
                            <ul>
                                <li>4 cổng LAN tốc độ GE.</li>
                                <li>Wi-Fi chuẩn a/b/g/n/ac hỗ trợ 2 băng tần 2.4GHz và
                                    5GHz.</li>
                                <li>Hỗ trợ đồng thời IPv4 và IPv6.</li>
                                <li>Tương thích với nhiều chủng loại OLT khác nhau.</li>
                                <li>Quản lý bởi hệ thống ONE Telco Platform của VNPT
                                    Technology.</li>
                            </ul>
                        </div>
                        <div id="key-features-prd"
                             class="col-md-12 pt-5 prd-detail-info page-section">
                            <h2 class="title">Tính năng chính:</h2>
                            <p>
                                <strong>GPON </strong>
                            </p>

                            <ul>
                                <li>Tương thích các tiêu chuẩn của Liên minh Viễn thông
                                    quốc tế (ITU):
                                    <ul style="list-style-type: circle">
                                        <li>ITU-T G.984.4</li>
                                        <li>ITU-T G.984.3</li>
                                    </ul>
                                </li>
                                <li>Hỗ trợ lên đến 32 T-CONT/256GEM port.</li>
                                <li>Hỗ trợ 08 queue cho mỗi T-CONT.</li>
                                <li>Hỗ trợ hoạt động, quản lý và bảo trì lớp vật lý
                                    (Physical Layer Operations, Administration and Maintenance -
                                    PLOAM).</li>
                                <li>Kích hoạt, vô hiệu hóa và đăng ký lại ONT.</li>
                            </ul>

                            <p>
                                <strong>Bảo mật</strong>
                            </p>

                            <ul>
                                <li>NAT, SPI Firewall.</li>
                                <li>MAC / IP / Packet / Application / URL Filtering.</li>
                                <li>Chống tấn công từ chối dịch vụ (DoS), SYN Flooding.</li>
                            </ul>

                            <p>
                                <strong>OMCI </strong>
                            </p>

                            <ul>
                                <li>Quản lý cấu hình OMCI (bao gồm cấu hình GEM port,
                                    T-CONT VLAN).</li>
                                <li>Quản lý truy vấn OMCI (thông tin thiết bị và trạng
                                    thái cổng Ethernet).</li>
                                <li>Cảnh báo OMCI.</li>
                            </ul>

                            <p>
                                <strong>Ethernet </strong>
                            </p>

                            <ul>
                                <li>Giao diện 10/100/1000BASE-T.</li>
                                <li>Tự động xác định tốc độ và chế độ hoạt động.</li>
                                <li>Hỗ trợ tính năng VLAN tag / untag.</li>
                                <li>Hỗ trợ tính năng VLAN stacking (Q-in-Q) và VLAN
                                    translation.</li>
                                <li>Hỗ trợ IGMP snooping v2, 3.</li>
                            </ul>

                            <p>
                                <strong>Kết nối không dây</strong>
                            </p>

                            <ul>
                                <li>Wi-Fi IEEE 802.11ac hỗ trợ băng thông lên đến 867 Mbps.</li>
                                <li>Chức năng tắt bật Wi-Fi dễ dàng với nút Wi-Fi ON/OFF.</li>
                            </ul>

                            <p>
                                <strong>Quản lý và bảo trì thiết bị</strong>
                            </p>

                            <ul>
                                <li>Cấu hình dịch vụ và nâng cấp phần mềm qua Website.</li>
                                <li>Quản lý thiết bị và cập nhật phần mềm thông qua OMCI.</li>
                                <li>Truy xuất thông tin thu phát quang của ONT.</li>
                                <li>Báo cáo cảnh báo Dying_Gasp khi ONT bị tắt nguồn.</li>
                                <li>Quản lý từ xa bằng hệ thống ONE Telco Platform thông
                                    qua giao thức TR-069.</li>
                            </ul>

                            <p>
                                <strong>Các chức năng khác</strong>
                            </p>

                            <ul>
                                <li>Thông tin hệ thống: Phiên bản phần mềm, trạng thái kết
                                    nối và thống kê gói tin.</li>
                                <li>Kết nối WAN: PPPoE, Dynamic and Static IPoE, Bridge và
                                    hỗ trợ nhiều kết nối đồng thời.</li>
                                <li style="text-align: justify">Giao thức mạng và các tính
                                    năng cao cấp: Hỗ trợ IPv4 and IPv6, DHCP (Dynamic Host
                                    Configuration Protocol), DHCP relay, DHCPv6, NAT (Network
                                    Address Translation), DLNA Server, USB Storage, Printer
                                    Server, Static Routing, VPN (PPTP, L2TP, IPSec) Pass through,
                                    Interface Grouping, VLAN tag/untag trên cổng Ethernet, DNS
                                    Relay, DDNS, IGMP snooping v2/v3, Virtual server, DMZ,
                                    ACL(Access Control List), UPnP, NAT and SPI Firewall, MAC / IP
                                    / URL Filtering, Denial of Service (DoS), QoS, (802.1p),
                                    Support 32 T-CONT/256 GEM.</li>
                            </ul>
                        </div>
                        <div id="specifications-prd"
                             class="col-md-12 pt-5 prd-detail-info table-responsive page-section">
                            <h2 class="title">Thông số kỹ thuật:</h2>
                            <div class="table table-striped table-hover ">
                                <table style="width: 100%">
                                    <tbody>

                                    <tr>
                                        <td class="columnxx" colspan="2">GPON</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tốc độ đường xuống</td>
                                        <td class="column2">2.488 Gbps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tốc độ đường lên</td>
                                        <td class="column2">1.244Gbps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Lớp laser quang</td>
                                        <td class="column2">Laser Class B+</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bước sóng thu (Rx)</td>
                                        <td class="column2">1490nm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bước sóng phát (Tx)</td>
                                        <td class="column2">1310nm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Công suất phát</td>
                                        <td class="column2">0.5dBm ÷ 5dBm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ nhạy thu</td>
                                        <td class="column2">-28dBm ÷ 8dBm</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Wi-Fi</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tiêu chuẩn</td>
                                        <td class="column2">IEEE 802.11a/b/g/n/ac</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tần số</td>
                                        <td class="column2">2.4GHz:<br>2.400GHz÷2.4835GHz,
                                            OBW = 20/40Mhz<br>Tự động lựa chọn kênh<br>
                                            <br>5GHz: <br>5.170GHz ÷ 5.815GHz, OBW =
                                            20/40/80Mhz <br>Tự động lựa chọn kênh
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="column1">SSID</td>
                                        <td class="column2">8 SSID, chia đều trên mỗi băng tần
                                            (2.4Ghz và 5GHz)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bảo mật</td>
                                        <td class="column2">64/128 bit WEP, WPA/ WPA2,
                                            WPA-PSK/WPA2- PSK, MAC Filtering, Ẩn SSID, WPS</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Ăng ten</td>
                                        <td class="column2">MIMO 2x2</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Băng thông</td>
                                        <td class="column2">802.11ac: Lên đến 867Mbps<br>802.11n:
                                            Lên đến 300Mbps
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Giao diện kết nối</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">LAN</td>
                                        <td class="column2">4 x 10/100/1000 BASE-T (RJ-45)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Quang</td>
                                        <td class="column2">1 x SC/APC</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">USB</td>
                                        <td class="column2">1 x USB 3.0</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Nguồn</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nguồn cấp</td>
                                        <td class="column2">12V - 1A, bảo vệ quá áp/quá dòng</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Công suất</td>
                                        <td class="column2">&lt;8W</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Số thiết bị đồng thời</td>
                                        <td class="column2">32 thiết bị trên mỗi băng tần
                                            2.4GHz &amp; 5GHz</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Thông số khác</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Kích thước</td>
                                        <td class="column2">225 x 38 x 140 mm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">0℃ ÷ 40℃</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm hoạt động</td>
                                        <td class="column2">5% ÷ 90% Không ngưng kết</td>
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