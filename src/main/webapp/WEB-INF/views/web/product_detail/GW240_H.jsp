<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GW240-H</title>

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
                            <h3>GPON ONT iGate GW240-H</h3>
                            <div class="prd-img-detail">
                                <div class="xzoom-container">
                                    <img class="xzoom"
                                         src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-01.png" />"
                                         xoriginal="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-01.png" />" />
                                    <div class="xzoom-thumbs">
                                        <a
                                                href="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-01.png" />">
                                            <img class="xzoom-gallery" width="50"
                                                 src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-01.png" />"
                                                 xpreview="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-01.png" />">
                                        </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-02.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-02.png" />" />
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-03.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-03.png" />" />
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-04.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-04.png" />" />
                                    </a> <a
                                            href="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-05.png" />">
                                        <img class="xzoom-gallery" width="50"
                                             src="<c:url value="/assets/user/img/portfolio/800x800_GPON_iGate_GW020-05.png" />" />
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
                            <h2 class="title">Tổng quan:</h2>
                            <p style="text-align: justify">
                                <strong>iGate GW240-H</strong> là thiết bị GPON ONT dành cho
                                dịch vụ Internet cáp quang tốc độ cao, đáp ứng nhu cầu truy cập
                                mạng, xem truyền hình và hỗ trợ VoIP, mang lại kết nối mạng ổn
                                định dành cho doanh nghiệp.
                            </p>

                            <p style="text-align: justify">Sản phẩm hỗ trợ Wi-Fi chuẩn
                                ac tốc độ cao, được tối ưu hoạt động trên cả 2 băng tần 2.4GHz
                                và 5GHz.</p>

                            <p style="text-align: justify">
                                <strong>iGate GW240-H</strong> là một thành phần trong giải
                                pháp GPON tổng thể do VNPT Technology phát triển, bao gồm: ONT,
                                OLT và hệ thống quản lý ONE Telco Platform.
                            </p>

                            <p>
                                <strong>ĐẶC ĐIỂM NỔI BẬT</strong>
                            </p>

                            <ul>
                                <li>4 cổng LAN tốc độ GE.</li>
                                <li>Wi-Fi chuẩn a/b/g/n/ac, hỗ trợ 2 băng tần 2.4 GHz và
                                    5GHz.</li>
                                <li>Tích hợp 2 cổng thoại hỗ trợ chức năng VoIP.</li>
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
                                    (PLOAM).</li>
                                <li>Kích hoạt, vô hiệu hóa và đăng ký lại ONT.</li>
                            </ul>

                            <p>
                                <strong>VoIP</strong>
                            </p>

                            <ul>
                                <li>Tương thích SIP (RFC3261).</li>
                                <li>Thuật toán mã hóa DTMF (RFC2833).</li>
                                <li>Hỗ trợ in-band DTMF tone sending/receiving và out-band
                                    DTMF signaling with RTP.</li>
                                <li>Hỗ trợ các chuẩn mã hóa: G.711a/µ, G.729, và thuật
                                    toán mã hóa/giải mã G.722.</li>
                                <li>Hỗ trợ chức năng xử lý tiếng nói: Voice Activity
                                    Detectors (VAD) và Comfort Noise Generation (CNG).</li>
                                <li>Tính năng nâng cao: Hiển thị caller ID, cuộc gọi chờ,
                                    chuyển tiếp cuộc gọi.</li>
                            </ul>

                            <p>
                                <strong>Ethernet </strong>
                            </p>

                            <ul>
                                <li>Giao diện 10/100/1000BASE-T.</li>
                                <li>Tự động xác định tốc độ và chế độ hoạt động.</li>
                                <li>Hỗ trợ tính năng VLAN tag/ untag trên cổng Ethernet.</li>
                                <li>Hỗ trợ IGMP snooping v2, 3.</li>
                            </ul>

                            <p>
                                <strong>Kết nối không dây</strong>
                            </p>

                            <ul>
                                <li>Wi-Fi 802.11ac hỗ trợ băng thông lên đến 867 Mbps.</li>
                                <li>Chức năng tắt bật Wi-Fi với nút Wi-Fi ON/OFF.</li>
                            </ul>

                            <p>
                                <strong>Bảo mật</strong>
                            </p>

                            <ul>
                                <li>NAT, SPI Firewall.</li>
                                <li>MAC / IP / Packet / Application / URL Filtering.</li>
                                <li>Chống tấn công từ chối dịch vụ (DoS), SYN Flooding.</li>
                                <li>Chữ ký số firmware.</li>
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
                                <li>Thông tin hệ thống: phiên bản phần mềm, trạng thái kết
                                    nối và thống kê gói tin.</li>
                                <li>Kết nối WAN: PPPoE, Dynamic and Static IPoE, Bridge và
                                    hỗ trợ nhiều kết nối đồng thời.</li>
                                <li>Giao thức mạng và các tính năng cao cấp: Hỗ trợ IPv4
                                    và IPv6, DHCP, DHCP relay, DHCPv6, NAT, DLNA Server, USB
                                    Storage, Printer Server, Static Routing, RIP v1/v2, VPN (PPTP,
                                    L2TP, IPSec) Pass-through, Interface Grouping, VLAN tag/untag
                                    trên cổng Ethernet , 802.1Q VLAN, DNS Relay, DDNS, IGMP
                                    Multicast, server ảo, DMZ, ACL(Access Control List), UPnP.</li>
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
                                        <td class="column1">Tốc độ  đường xuống</td>
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
                                        <td class="column1">Bước sóng  phát (Tx)</td>
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
                                        <td class="columnxx" colspan="2">Wifi</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tiêu chuẩn</td>
                                        <td class="column2">IEEE 802.11a/b/g/n/ac</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Tần số</td>
                                        <td class="column2">Băng tần 2.4GHz:<br>2.400GHz ÷ 2.4835GHz, OBW = 20/40Mhz<br>Tự động lựa chọn kênh<br><br>Băng tần 5GHz: <br>5.170GHz ÷ 5.815GHz, OBW = 20/40/80Mhz<br>Tự động lựa chọn kênh</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">SSID</td>
                                        <td class="column2">8 SSID, chia đều trên mỗi band (2.4Ghz và 5GHz)</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Bảo mật</td>
                                        <td class="column2">64/128 bit WEP, WPA/ WPA2, WPA-PSK / WPA2-PSK encrypted security, Wireless MAC Filtering, ẩn SSID, WPS</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Ăng ten</td>
                                        <td class="column2">MIMO 2x2</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Băng thông</td>
                                        <td class="column2">802.11ac: Lên đến 867Mbps <br>802.11n: Lên đến 300Mbps</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Số thiết bị đồng thời</td>
                                        <td class="column2">32 thiết bị trên mỗi băng tần 2.4GHz &amp; 5GHz</td>
                                    </tr>
                                    <tr>
                                        <td class="columnxx" colspan="2">Giao diện kết nối</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">LAN</td>
                                        <td class="column2">4 x 10/100/1000  BASE-T (RJ-45)</td>
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
                                        <td class="column1">Thoại</td>
                                        <td class="column2">2 x RJ11</td>
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
                                        <td class="columnxx" colspan="2">Thông số khác</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Kích thước</td>
                                        <td class="column2">225 x 38 x 140 mm</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Khối lượng</td>
                                        <td class="column2">~400g</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Nhiệt độ hoạt động</td>
                                        <td class="column2">0℃ ÷ 40℃</td>
                                    </tr>
                                    <tr>
                                        <td class="column1">Độ ẩm hoạt động</td>
                                        <td class="column2">5% ÷ 90% không ngưng kết</td>
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
