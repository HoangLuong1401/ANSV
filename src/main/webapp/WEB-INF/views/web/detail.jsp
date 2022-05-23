<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Tin tức và sự kiện</title>


</head>

<body>
	<section id="about-content">
		<div id="particles-js" class="particles-js particles-home-section-2"></div>
		<div class="container">
			<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h2 class="text-uppercase header_text">Tin tức & sự kiện</h2>
				</div>

			</div>
		</div>

	</section>
	<section id="about-section">
		<div class="container">
			<div class="row">
				
				<div class="col-md-10"> 
					
					<div class="text-justify mt-5 mb-5">
						<div id="p-n-info">
							<div class="mb-2">
								<div class="row">
									<div class="col-md-9">
										<span><a id="link" href="<c:url value='/tin-tuc'/>">Tin tức</a></span>
										<span id="arrow">&gt;</span> 
										<span class=""><a>${get_new.classify}</a></span> 
									</div>
									<div class="col-md-1">
										
									</div>
									<div class="col-md-2"><span class="p-n-date" id="p-n-date">${get_new.updated_at}</span></div>
								</div>
							</div>
						</div>
						
						<div class="title-detail">
							<h2>${get_new.title }</h2> 
						</div>
						<div class="content-detail mt-5">
							${get_new.content }
						</div>	
						
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</section>
</body>
</html>