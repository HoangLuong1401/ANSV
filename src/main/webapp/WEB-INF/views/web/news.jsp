<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tin tức</title>
</head>
<body>
	<!-- <section id="home-section-2" class="home-section-2 posr">
	    <div id="particles-js" class="particles-js particles-home-section-2"></div>
	    <div class="container">
	    	<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h1 class="text-uppercase header_text">Tin tức &amp; sự kiện</h1>
				</div>
			</div>
	    </div>
	</section> -->

	 <section id="about-content">
		<div id="particles-js" class="particles-js particles-home-section-2"></div>
	    <div class="container">
	    	<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h1 class="text-uppercase header_text">Tin tức &amp; sự kiện</h1>
				</div>
			</div>
	    </div>
	</section> 
	
	<c:url value="Tin tức tuyển dụng" var="tin_tuyen_dung" />
	
	<c:forEach var="item_news_type" items="${news_type}" varStatus="index_news_type">
		
		<c:if test="${item_news_type.name != tin_tuyen_dung}">
			<div class="pt-0 site-section">
				<div class="container">
					<div class="row mb-5">
						<div class="col-md-6 col-6">
							<h2 class="title_news"><i>${item_news_type.name}</i></h2>
						</div>
						<div class="col-md-6 col-6">
							<div class="float-right pt-5">
								<a href="#" class="section-view-all">
									Xem tất cả <i class="ti ti-angle-double-right"></i>
								</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-4">
						
							<%-- Loại tin tức thứ nhất (Mới nhất) --%>
							<c:forEach var="item_news1" items="${news1}" varStatus="index_news1">
								<c:if test="${index_news1.first && item_news1.classify == item_news_type.name}">
									<div class="post-news">
										<a href="<c:url value='/detail_${item_news1.id}' />"> 
											<div class="b-n-images" style="background-image: url('<c:url value="/assets/user/img/news/${item_news1.img}" />');"></div>
										</a>
										<div class="p-n-info">
											<div class="mb-2">
												<span class="p-n-cat">
													<a>${item_news1.classify}</a>
												</span> 
												<span class="pd-r-l-6">|</span>
												<%--<span class="p-n-date">${item_news1.updated_at}</span>--%>
											</div>
											<h2 class="p-n-title">
												<a href="<c:url value='/detail_${item_news1.id}' />">${item_news1.title}</a>
											</h2>
											<div class="p-n-desc justify">${item_news1.summary}</div>
											<a class="p-n-read-more" href="<c:url value='/detail_${item_news1.id}' />">
												Xem thêm <i class="ti ti-arrow-right"></i>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
							
							<%-- Loại tin tức thứ hai (Mới nhất) --%>
							<c:forEach var="item_news2" items="${news2}" varStatus="index_news2">
								<c:if test="${index_news2.first && item_news2.classify == item_news_type.name}">
									<div class="post-news">
										<a href="<c:url value='/detail_${item_news2.id}' />"> 
											<div class="b-n-images" style="background-image: url('<c:url value="/assets/user/img/news/${item_news2.img}" />');"></div>
										</a>
										<div class="p-n-info">
											<div class="mb-2">
												<span class="p-n-cat">
													<a>${item_news2.classify}</a> 
												</span> 
												<span class="pd-r-l-6">|</span>
												<%--<span class="p-n-date">${item_news2.updated_at}</span>--%>
											</div>
											<h2 class="p-n-title">
												<a href="<c:url value='/detail_${item_news2.id}' />">${item_news2.title}</a>
											</h2>
											<div class="p-n-desc justify">${item_news2.summary}</div>
											<a class="p-n-read-more" href="<c:url value='/detail_${item_news2.id}' />">
												Xem thêm <i class="ti ti-arrow-right"></i>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
							
							<%-- Loại tin tức thứ ba (Mới nhất) --%>
							<c:forEach var="item_news3" items="${news3}" varStatus="index_news3">
								<c:if test="${index_news3.first && item_news3.classify == item_news_type.name}">
									<div class="post-news">
										<a href="<c:url value='/detail_${item_news3.id}' />"> 
											<div class="b-n-images" style="background-image: url('<c:url value="/assets/user/img/news/${item_news3.img}" />');"></div>
										</a>
										<div class="p-n-info">
											<div class="mb-2">
												<span class="p-n-cat">
													<a>${item_news3.classify}</a>
												</span> 
												<span class="pd-r-l-6">|</span>
												<%--<span class="p-n-date">${item_news3.updated_at}</span>--%>
											</div>
											<h2 class="p-n-title">
												<a href="<c:url value='/detail_${item_news3.id}' />">${item_news3.title}</a>
											</h2>
											<div class="p-n-desc justify">${item_news3.summary}</div>
											<a class="p-n-read-more" href="<c:url value='/detail_${item_news3.id}' />">
												Xem thêm <i class="ti ti-arrow-right"></i>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="col-md-8">
							<div class="post-news-no-img">
							
								<%-- Loại tin tức thứ nhất --%>
								<c:forEach var="item_news1" items="${news1}" varStatus="index_news1">
									<c:if test="${(not index_news1.first) && item_news1.classify == item_news_type.name}">
										<div class="post-news">
											<div class="p-n-info">
												<div class="mb-2">
													<span class="p-n-cat">
														<a href="javascript:void(0)">${item_news1.classify}</a>
													</span>
													<span class="pd-r-l-6">|</span>
													<%--<span class="p-n-date">${item_news1.updated_at}</span>--%>
												</div>
												<h2 class="p-n-title">
													<a href="<c:url value='/detail_${item_news1.id}' />">${item_news1.title}</a>
												</h2>
												<div class="p-n-desc justify">${item_news1.summary}</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
								<%-- Loại tin tức thứ hai --%>
								<c:forEach var="item_news2" items="${news2}" varStatus="index_news2">
									<c:if test="${(not index_news2.first) && item_news2.classify == item_news_type.name}">
										<div class="post-news">
											<div class="p-n-info">
												<div class="mb-2">
													<span class="p-n-cat">
														<a href="javascript:void(0)">${item_news2.classify}</a>
													</span>
													<span class="pd-r-l-6">|</span>
													<%--<span class="p-n-date">${item_news2.updated_at}</span>--%>
												</div>
												<h2 class="p-n-title">
													<a href="<c:url value='/detail_${item_news2.id}' />">${item_news2.title}</a>
												</h2>
												<p class="p-n-desc justify">${item_news2.summary}</p>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
								<%--&lt;%&ndash; Loại tin tức thứ ba &ndash;%&gt;--%>
								<%--<div class="post-news">--%>
									<%--<div class="p-n-info">--%>
										<%--<div class="mb-2">--%>
											<%--<span class="p-n-cat">--%>
												<%--<a href="javascript:void(0)">Tin tức</a>--%>
											<%--</span>--%>
											<%--<span class="pd-r-l-6">|</span>--%>
											<%--<span class="p-n-date">2022-03-08</span>--%>
										<%--</div>--%>
										<%--<h2 class="p-n-title">--%>
											<%--<a href="<c:url value='/chao-gia' />">THÔNG BÁO MỜI CHÀO GIÁ</a>--%>
										<%--</h2>--%>
										<%--<div class="p-n-desc justify">Công ty Trách Nhiệm Hữu Hạn Thiết Bị Viễn Thông ANSV – Về việc “Cung cấp dịch vụ vận chuyển hàng hóa năm 2022”</div>--%>
									<%--</div>--%>
								<%--</div>--%>
								<c:forEach var="item_news3" items="${news3}" varStatus="index_news3">
									<c:if test="${(not index_news3.first) && item_news3.classify == item_news_type.name}">
										<div class="post-news">
											<div class="p-n-info">
												<div class="mb-2">
													<span class="p-n-cat">
														<a href="javascript:void(0)">${item_news3.classify}</a>
													</span>
													<span class="pd-r-l-6">|</span>
													<%--<span class="p-n-date">${item_news3.updated_at}</span>--%>
												</div>
												<h2 class="p-n-title">
													<a href="<c:url value='/detail_${item_news3.id}' />">${item_news3.title}</a>
												</h2>
												<div class="p-n-desc justify">${item_news3.summary}</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								
								
							</div>
						</div>
			
					</div> <!-- End row -->
					
				</div>
			</div>
		</c:if>
		
	</c:forEach>
	
	

	
	<%-- <div class="pt-0 site-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md-6 col-6">
					<h2 class="title_news"><i>Tin Tức ICT</i></h2>
				</div>
				<div class="col-md-6 col-6">
					<div class="float-right pt-5">
						<a
							href="https://www.vnpt-technology.vn/vi/news_category/tin-tuc-noi-bo"
							class="section-view-all">Xem tất cả <i
							class="ti ti-angle-double-right"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="post-news">
						<a href="mesh_vs_rep"> 
							<img alt="" class="p-n-images img-fluid" src="<c:url value="/assets/user/img/news/mess-vs-re.jpg" />">
							<div class="b-n-images" style="background-image: url('<c:url value="/assets/user/img/news/mess-vs-re.jpg" />');"></div>
						</a>
						<div class="p-n-info">
							<div class="mb-2">
								<span class="p-n-cat"> <a>Tin tức sản phẩm</a>
								</span> <span class="pd-r-l-6">|</span> <span class="p-n-date">Th06
									21, 2021</span>
							</div>
							<h2 class="p-n-title">
								<a href="mesh_vs_rep">Sự khác biệt giữa Mesh Wifi và
									Repeater</a>
							</h2>
							<p class="p-n-desc justify">Về tính năng, thiết bị Mesh Wifi
								hay Repeater đều có chức năng giúp mở rộng vùng phủ sóng Wi-Fi
								theo nhu cầu sử dụng của người dùng</p>
							<a class="p-n-read-more" href="mesh_vs_rep">Xem
								thêm <i class="ti ti-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="post-news-no-img">
						<div class="post-news">
							<div class="p-n-info">
								<div class="mb-2">
									<span class="p-n-cat"> <a href="javascript:void(0)">Tin
											tức sản phẩm</a>
									</span> <span class="pd-r-l-6">|</span> <span class="p-n-date">Th04
										15, 2021</span>
								</div>
								<h2 class="p-n-title">
									<a href="mesh_vs_rep">Sự khác biệt giữa Mesh Wifi và
										Repeater</a>
								</h2>
								<p class="p-n-desc justify">Về tính năng, thiết bị Mesh Wifi
									hay Repeater đều có chức năng giúp mở rộng vùng phủ sóng Wi-Fi
									theo nhu cầu sử dụng của người dùng</p>
							</div>
						</div>
						<div class="post-news">
							<div class="p-n-info">
								<div class="mb-2">
									<span class="p-n-cat"> <a href="javascript:void(0)">Tin
											tức sản phẩm</a>
									</span> <span class="pd-r-l-6">|</span> <span class="p-n-date">Th04
										15, 2021</span>
								</div>
								<h2 class="p-n-title">
									<a href="mesh_vs_rep">Sự khác biệt giữa Mesh Wifi và
										Repeater</a>
								</h2>
								<p class="p-n-desc justify">Về tính năng, thiết bị Mesh Wifi
									hay Repeater đều có chức năng giúp mở rộng vùng phủ sóng Wi-Fi
									theo nhu cầu sử dụng của người dùng</p>
							</div>
						</div>
						<div class="post-news">
							<div class="p-n-info">
								<div class="mb-2">
									<span class="p-n-cat"> <a href="javascript:void(0)">Tin
											tức sản phẩm</a>
									</span> <span class="pd-r-l-6">|</span> <span class="p-n-date">Th04
										15, 2021</span>
								</div>
								<h2 class="p-n-title">
									<a href="javascript:void(0)">Sự khác biệt giữa Mesh Wifi và
										Repeater</a>
								</h2>
								<p class="p-n-desc justify">Về tính năng, thiết bị Mesh Wifi
									hay Repeater đều có chức năng giúp mở rộng vùng phủ sóng Wi-Fi
									theo nhu cầu sử dụng của người dùng</p>
							</div>
						</div>
						<div class="post-news">
							<div class="p-n-info">
								<div class="mb-2">
									<span class="p-n-cat"> <a href="javascript:void(0)">Tin
											tức sản phẩm</a>
									</span> <span class="pd-r-l-6">|</span> <span class="p-n-date">Th04
										15, 2021</span>
								</div>
								<h2 class="p-n-title">
									<a href="javascript:void(0)">Sự khác biệt giữa Mesh Wifi và
										Repeater</a>
								</h2>
								<p class="p-n-desc justify">Về tính năng, thiết bị Mesh Wifi
									hay Repeater đều có chức năng giúp mở rộng vùng phủ sóng Wi-Fi
									theo nhu cầu sử dụng của người dùng</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
</body>
</html>