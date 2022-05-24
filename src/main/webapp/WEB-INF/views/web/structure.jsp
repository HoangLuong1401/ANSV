<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cơ Cấu Tổ Chức</title>
<style>
.banner {
	position: absolute;
	top: 10px;
}
</style>
</head>
<body id="about-section" data-spy="scroll" data-target="#myScrollspy"
	data-offset="20">
	<section id="about-content">
		<div id="particles-js" class="particles-js particles-home-section-2"></div>
		<div class="container">
			<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h1 class="text-uppercase header_text">Cơ cấu tổ chức và nhân
						sự</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- <section id="home-section-2" class="home-section-2 posr">
	    <div id="particles-js" class="particles-js particles-home-section-2"></div>
	    <div class="container">
	    	<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h1 class="text-uppercase header_text">Cơ cấu tổ chức và nhân sự</h1>
				</div>
			</div>
	    </div>
	</section> -->

	<section>
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
							<h3 class="mb-5 title">
								<strong>Cơ cấu</strong>
							</h3>
							<div class="text-center">
								<figure class="image">
									<img alt=""
										src="<c:url value="/assets/user/img/so_do_1.png" />">
									<figcaption>Sơ đồ tổ chức của công ty</figcaption>
								</figure>
							</div>
							<h3 class="mb-5 title">
								<strong>Nhân sự</strong>
							</h3>
							<p class="justify">ANSV sở hữu đội ngũ nhân sự chủ lực là các
								kỹ sư công nghệ thông tin đáp ứng xu thế công nghệ 4.0 với kinh
								nghiệm và tay nghề cao, có đam mê, nhiệt huyết và luôn làm việc
								với tinh thần: "Tốc chiến tốc thắng". Chúng tôi tập trung vào
								nâng cao năng lực chuyên môn cho đội ngũ nhân sự, kỹ sư của mình
								bên cạnh đó, chúng tôi luôn liên kết chặt chẽ và tìm kiếm nguồn
								nhân lực kế cận từ các trường đại học công nghệ hàng đầu: Đại
								học Bách Khoa, Học viện Công Nghệ Bưu Chính Viễn Thông, Đại học
								Quốc Gia... nhằm đảm bảo công ty luôn có nguồn nhân lực ổn định,
								đáp ứng nhu cầu phát triển của thời đại.</p>
							<div class="text-center">
								<figure class="image">
									<img alt=""
										src="<c:url value="/assets/user/img/he-thong-nhan-su.png" />">
									<figcaption>Nhân sự</figcaption>
								</figure>
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