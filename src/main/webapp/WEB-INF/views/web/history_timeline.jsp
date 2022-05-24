<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch Sử Hình Thành Và Phát Triển</title>
<style>
.banner {
	position: absolute;
	top: 10px;
}
</style>
</head>
<body>
	<section id="about-content">
		<div id="particles-js" class="particles-js particles-home-section-2"></div>
		<div class="container">
			<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<div class="text-uppercase header_text" style="padding-top: 5%;">
						<font size="+3">Lịch sử hình thành và phát triển</font>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- <section id="home-section-2" class="home-section-2 posr">
	    <div id="particles-js" class="particles-js particles-home-section-2"></div>
	    <div class="container">
	    	<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<div class="text-uppercase header_text" style="padding-top: 5%;">
						<font size="+3">Lịch sử hình thành và phát triển</font>
					</div>
				</div>
			</div>
	    </div>
	</section> -->

	<section id="about-section" data-spy="scroll"
		data-target="#myScrollspy" data-offset="20">
		<div class="container">
			<div class="row">
				<nav class="col-md-3 order-md-3 banner" id="myScrollspy">
					<div class="cat-list ">
						<nav>
							<ul class="nav nav-pills nav-stacked list-group">
								<li class="list-group-item"><a href="ve-chung-toi"><b>Giới
											thiệu</b></a></li>
								<li class="list-group-item"><a href="to-chuc"><b>Cơ
											cấu tổ chức</b></a></li>
								<li class="list-group-item"><a href="lich-su"><b>Lịch
											sử hình thành và phát triển</b></a></li>
								<li class="list-group-item"><a href="khach-hang"><b>Khách
											hàng & Đối tác</b></a>
								<li class="list-group-item"><a href="thong-diep"><b>Thông
											điệp tổng giám đốc</b></a></li>
							</ul>
						</nav>
					</div>
				</nav>
				<div class="col-md-9 order-md-9">
					<div class="about-right">
						<div>
							<div class="text-center">
								<figure class="image">
									<img alt=""
										src="<c:url value="/assets/user/img/lich_su.jpg" />">
									<figcaption>Sơ đồ phát triển</figcaption>
								</figure>
							</div>
							<br> <br> <br>
							<p align="left">
								<font size="+3"> <strong>Các mốc phát triển</strong>
								</font>
							</p>

							<!-- Đầu - Timeline: Lịch sử hình thành và phát triển -->
							<link rel="stylesheet"
								href="<c:url value="/assets/user/css/timeline/style-timeline-new.css" />"
								media="screen" />
							<script
								src="<c:url value="/assets/user/js/timeline/jQuery.timelinr-0.9.7.js" />"></script>

							<script>
								var timeline_history = $("#timeline").timelinr(
										{
											autoPlay : 'true',
											autoPlayDirection : 'forward'
										});
							</script>

							<div id="timeline"
								style="	background: blue; 
										background-image: url('<c:url value="/assets/user/img/bg/background-timeline.jpg" />');
										background-position: right top; 
										margin-top: 20px; 
										border: 1px solid; 
										padding: 10px; 
										box-shadow: 5px 10px 8px #888888;">
								<ul id="dates">
									<li><a href="#2020">2020</a></li>
									<li><a href="#2019">2019</a></li>
									<li><a href="#2017">2017</a></li>
									<li><a href="#2016">2016</a></li>
									<li><a href="#2015">2015</a></li>
									<li><a href="#2014">2014</a></li>
									<li><a href="#2012">2012</a></li>
									<li><a href="#2011">2011</a></li>
									<li><a href="#2010">2010</a></li>
									<li><a href="#2009">2009</a></li>
									<li><a href="#2007">2007</a></li>
									<li><a href="#2003">2003</a></li>
									<li><a href="#2001">2001</a></li>
									<li><a href="#2000">2000</a></li>
									<li><a href="#1996">1996</a></li>
									<li><a href="#1995">1995</a></li>
									<li><a href="#1994">1994</a></li>
									<li><a href="#1993">1993</a></li>
								</ul>

								<ul id="issues">
									<li id="2020">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2020.png" />"
												width="256" height="256" />
										</div>
										<h1>2020</h1>
										<p>
											► Đạt mốc cung cấp 10tr sản phẩm đầu cuối ADSL/ONT/STB.<br>
											<br> ► Triển khai mảng khách hàng doanh nghiệp, các bộ
											ban ngành như: Văn phòng Chính phủ, Bộ Công an, Ngân hàng, Bộ
											giao thông,… bên cạnh các khách hàng truyền thống trong VNPT.
										</p>
									</li>

									<li id="2019">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2019.png" />"
												width="256" height="256" />
										</div>
										<h1>2019</h1>
										<p>
											► Ký thỏa thuận hợp tác với Nokia Group.<br> <br> ►
											Triển khai hệ thống Backhaul cho khu vực miền Trung và miền
											Nam.<br> <br> ► Hoàn thiện triển khai mạng truy
											nhập quang thụ động trên toàn quốc.<br> <br> ► Mở
											rộng hệ thống truyền dẫn khu vực miền Trung và tuyến trục
											Backbone cho Tổng Công ty Hạ tầng mạng.
										</p>
									</li>

									<li id="2017">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2017.png" />"
												width="256" height="256" />
										</div>
										<h1>2017</h1>
										<p>
											► Vượt ngưỡng doanh thu 130 triệu USD.<br> <br> ►
											Triển khai thiết kế, cung cấp và lắp đặt hệ thống truyền dẫn
											khu vực miền Trung và mở rộng tuyến trục Backbone cho Tổng
											Công ty Hạ tầng mạng.<br> <br> ► Cung cấp và triển
											khai mở rộng mạng truyền dẫn DWDM miền Nam cho Mobifone.<br>
											<br> ► Cung cấp 2 triệu sản phẩm đầu cuối ONT/STB/Modem
											ADSL.<br> <br> ► Cung cấp và triển khai thiết bị
											SmallCell cho mạng di động.<br> <br> ► 5 triệu USD
											cho dự án mở rộng mạng vô tuyến của Vinaphone.<br> <br>
											► Trang bị thiế bị OLT cho mạng GPON vùng 51 tỉnh/thành phố.
										</p>
									</li>

									<li id="2016">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2016.png" />"
												width="256" height="256" />
										</div>
										<h1>2016</h1>
										<p>
											► Vượt ngưỡng doanh thu 100 triệu USD.<br> <br> ►
											Triển khai hệ thống GPON cho 51 tỉnh thành phố, trở thành đơn
											vị triển khai hệ thống mạng quang thụ động lớn nhất cho VNPT.<br>
											<br> ► Cung cấp 2 triệu sản phẩm đầu cuối ONT/STB/Modem
											ADSL.<br> <br> ► Cung cấp và triển khai mạng truyền
											dẫn DWDM miền Nam cho Mobifone.
										</p>
									</li>

									<li id="2015">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2015.png" />"
												width="256" height="256" />
										</div>
										<h1>2015</h1>
										<p>
											► Cán mốc doanh thu 50 triệu USD.<br> <br> ► Hệ
											thống Collection cho công ty tài chính Home Credit Việt Nam.<br>
											<br> ► Triển khai hệ thống giao thông thông minh.
										</p>
									</li>

									<li id="2014">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2014.png" />"
												width="256" height="256" />
										</div>
										<h1>2014</h1>
										<p>
											► Triển khai Dự án backbone đường trục (11 triệu USD) cho
											Tổng Công ty Hạ tầng Mạng<br> <br> ► Cung cấp hệ
											thống mạng và tổng đài IP cho dự án xây dựng Nhà Quốc hội.<br>
											<br> ► Cung cấp và triển khai hệ thống IP Contact Center
											cho Công ty Tài chính Home Credit.
										</p>
									</li>

									<li id="2012">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2012.png" />"
												width="256" height="256" />
										</div>
										<h1>2012</h1>
										<p>
											► Triển khai hệ thống IP CONTACT CENTER khu vực phía Bắc và
											khu vực miền Trung.<br> <br> ► Dịch vụ Hỗ trợ kỹ
											thuật cho mạng di động Vinaphone, thiết bị của Alcatel-Lucent
										</p>
									</li>

									<li id="2011">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2011.png" />"
												width="256" height="256" />
										</div>
										<h1>2011</h1>
										<p>
											► Thay đổi mô hình hoạt động, trở thành công ty TNHH 2 thành
											viên, với tên mới là Công ty TNHH Thiết bị Viễn thông ANSV.<br>
											<br> ► Phân phối các thiết bị đầu cuối của VNPT
											Technology sản xuất (Set top Box/ Smart Box, ONT, Modem, Wifi
											Mesh,…) khắp cả nước.<br> <br> ► Trở thành Reseller
											của Alcatel – Lucent tại Việt Nam, dấu ấn đầu tiên là việc
											thắng thầu dự án cung cấp thiết bị, giải pháp, mạng truy cập
											cáp quang FTTx cho VNPT Hồ Chí Minh (đạt giá trị ký kết trên
											2 triệu USD trong năm 2011), mở đầu thành công cho việc cung
											cấp giải pháp, thiết bị và dịch vụ triển khai hệ thống GPON
											rộng khắp cả nước.<br> <br> ► Cung cấp và Triển
											khai mạng di dộng cho Nokia-Siemen với doanh thu trên 120 tỷ
											VND.
										</p>
									</li>

									<li id="2010">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2010.png" />"
												width="256" height="256" />
										</div>
										<h1>2010</h1>
										<p>
											► Triển khai thành công dự án truyền dẫn DWDM Metro Link Cần
											Thơ _ Cung cấp 1150 thiết bị L2 Switch + 18.539 cổng quang
											cho dự án AON của VNPT.<br> <br> ► Thiết lập thành
											công hệ thống mạng chuyển mạch Thế hệ mới (NGN Call control
											System) cho Tập đoàn VNPT với giá trị 10 triệu USD.
										</p>
									</li>

									<li id="2009">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2009.png" />"
												width="256" height="256" />
										</div>
										<h1>2009</h1>
										<p>
											► Triển khai dự án IP Core (PE Router) cho Công ty Viễn thông
											liên tỉnh (VTN).<br> <br> ► Trang bị thiết bị L2
											Switch cho 27 viễn thông, tỉnh thành phố.<br> <br>
											► Nâng cấp, mở rộng dung lượng cho các hệ thống chuyển mạch
											Alcatel 1000E10.<br> <br> ► Triển khai thành công
											dự án truyền dẫn DWDM Metro Link Hà Nội và TP Hồ Chí Minh.
										</p>
									</li>

									<li id="2007">
										<div style="float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/2007.png" />"
												width="256" height="256" />
										</div>
										<h1>2007</h1>
										<p>
											► Cung cấp các thiết bị IP Networking Router/ IP – MPLS,
											Ethernet Switch, Enterprise Switch, Firewall,…<br> <br>
											► Xây dựng giải pháp và thiết kế mạng IP.<br> <br>
											► Lắp ráp và tích hợp hệ thống nguồn vào rack của tổng đài
											IP.<br> <br> ► Tham gia xây dựng giải pháp và thực
											hiện các dự án IPCC cho viễn thông Hà Nội và Đà Nẵng.<br>
											<br> ► Triển khai thành công các dự án cung cấp thiết bị
											truy nhập MSAN trên mạng lưới VNPT toàn quốc, giá trị 30
											triệu USD.<br> <br> ► Xây dựng hệ thống mạng truy
											cập băng rộng xDSL với 1 triệu thuê bao.
										</p>
									</li>

									<li id="2003">
										<div style="height: 100%; float: left;">
											<img src="<c:url value="/assets/user/img/timeline/2.png" />"
												width="256" height="256" />
										</div>
										<h1>2003</h1>
										<p>Cung cấp hệ thống mạng truy cập cố định DSLAM/MSAN ký
											thỏa thuận chuyển giao công nghệ với Alcaltel Tây Ban Nha,
											trở thành đơn vị sản xuất thiết bị MSAN 1540 Litespan, CKD
											các card và sửa chữa các thiết bị MSAN bước đầu cung cấp
											thiết bị mạng di động cho Viettel dưới hình thức triển khai
											full-turnkey.</p>
									</li>

									<li id="2001">
										<div style="height: 100%; float: left;">
											<img src="<c:url value="/assets/user/img/timeline/3.png" />"
												width="256" height="256" />
										</div>
										<h1>2001</h1>
										<p>Sản xuất, triển khai hệ thống chuyển mạch Alcatel
											1000E10 MM với dòng sản phẩm chính là CSN MM/ CSN MM Indoor/
											CSN MM Outdoor, đạt dung lượng 1.000.000 đầu số/năm cho Tập
											đoàn VNPT.</p>
									</li>

									<li id="2000">
										<div style="height: 100%; float: left;">
											<img src="<c:url value="/assets/user/img/timeline/4.png" />"
												width="256" height="256" />
										</div>
										<h1>2000</h1>
										<p>Cung cấp, lắp đặt hệ thống IN.</p>
									</li>

									<li id="1996">
										<div style="height: 100%; float: left;">
											<img src="<c:url value="/assets/user/img/timeline/5.png" />"
												width="256" height="256" />
										</div>
										<h1>1996</h1>
										<p>Mở rộng hoạt động sang lĩnh vực mạng di động, triển
											khai các dịch vụ engineering, lắp đặt, cấu hình và tích hợp
											hệ thống di động GSM (BTS/BSC, OMC -R, MSC,…), các dịch vụ
											nâng cấp, migration và các dịch vụ tối ưu hóa RNP, RNO,… cho
											các nhà mạng di động hàng đầu Việt Nam như Mobifone,
											Vinaphone.</p>
									</li>

									<li id="1995">
										<div style="height: 100%; float: left;">
											<img src="<c:url value="/assets/user/img/timeline/6.png" />"
												width="256" height="256" />
										</div>
										<h1>1995</h1>
										<p>Ra mắt dịch vụ lắp đặt, cấu hình, đo kiểm, tích hợp các
											hệ thống truyền dẫn PDH, SDH và các công tác bảo trì, bảo
											dưỡng, nâng cấp hệ thống.</p>
									</li>

									<li id="1994">
										<div style="height: 100%; float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/1994.png" />"
												width="256" height="256" />
										</div>
										<h1>1994</h1>
										<p>Sản xuất, triển khai hệ thống chuyển mạch Alcatel
											1000E10 CSN MA, đạt dung lượng 450.000 đầu số/năm cho Tập
											đoàn VNPT.</p>
									</li>

									<li id="1993">
										<div style="height: 100%; float: left;">
											<img
												src="<c:url value="/assets/user/img/timeline/1993.png" />"
												width="256" height="256" />
										</div>
										<h1>1993</h1>
										<p>Thành lập Công ty Liên doanh Thiết bị Viễn thông ANSV
											(Alcatel Network Systems Vietnam).</p>
									</li>
								</ul>
								<div id="grad_left"></div>
								<div id="grad_right"></div>
								<a href="#" id="next">+</a> <a href="#" id="prev">-</a>
							</div>
							<!-- Cuối - Timeline: Lịch sử hình thành và phát triển -->

						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			var $banner = $('.banner'), $window = $(window);
			var $topDefault = parseFloat($banner.css('top'), 10);
			$window.on('scroll', function() {
				var $top = $(this).scrollTop();
				$banner.stop().animate({
					top : $top -20
				}, 1000, 'easeOutCirc');
			});

			var $wiBanner = $banner.outerWidth() * 2;
			function zindex(maxWidth) {
				if ($window.width() <= maxWidth + $wiBanner) {
					$banner.addClass('zindex');
				} else {
					$banner.removeClass('zindex');
				}
			}
		});
	</script>
</body>
</html>