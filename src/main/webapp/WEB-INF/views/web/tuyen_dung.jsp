<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tuyển dụng</title>


</head>
<body>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
	<style type="text/css">
		.slick-initialized .swipe-tab-content {
		  position: relative;
		  min-height: 365px;
		}
		@media screen and (min-width: 767px) {
		  .slick-initialized .swipe-tab-content {
		    min-height: 500px;
		  }
		}
		.slick-initialized .swipe-tab {
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-align: center;
		  -webkit-align-items: center;
		      -ms-flex-align: center;
		          align-items: center;
		  -webkit-box-pack: center;
		  -webkit-justify-content: center;
		      -ms-flex-pack: center;
		          justify-content: center;
		  height: 50px;
		  background: none;
		  border: 1px orange solid;
		  color: #757575;
		  cursor: pointer;
		  text-align: center;
		  border-bottom: 2px solid transparent;
		  -webkit-transition: all 0.5s;
		  transition: all 0.5s;
		}
		.slick-initialized .swipe-tab:hover {
		  color: #000;
		}
		.slick-initialized .swipe-tab.active-tab {
		  
		  color: #000;
		  font-weight: bold;
		  background-color: orange; 
		}
		
		.main-container {
		  padding: 25px;
		  background: #f1f1f17a;
		}
	</style>
	 <section id="about-content">
		<div id="particles-js" class="particles-js particles-home-section-2"></div>
	    <div class="container">
	    	<div class="row align-self-center text-center">
				<div class="col-md-8 offset-md-2 text-center breadcrumb-info">
					<h1 class="text-uppercase header_text">Tin tức tuyển dụng</h1>
				</div>
			</div>
	    </div>
	</section>
	<section id="about-section">
	<div id="img-recruit" class="text-center">
			<img alt="" class="img-fluid" src="<c:url value='/assets/user/img/news/recruitment.jpg' />">
		</div>
	<div class="row">
		
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="sub-header ">
			  <div class="swipe-tabs">
			    <div class="swipe-tab">Kỹ sư giải pháp công nghệ</div>
			    <div class="swipe-tab">Kỹ sư triển khai</div>
			    <div class="swipe-tab">Lập trình viên C#, .NET, SQL, ...</div>
			    <div class="swipe-tab">Chuyên viên kinh doanh</div>
			  </div>
			</div>
			<div class="main-container">
			  <div class="swipe-tabs-container ">
			    <div class="swipe-tab-content">
			    	<div id="title" class="text-center mb-2">
			    		<h3>Kĩ Sư Giải Pháp Công Nghệ (Tư Vấn Giải Pháp Cntt/đtvt, Presales) - Thu Nhập Lên Tới 500-600Tr/năm + Thưởng Dự Án</h3>
			    	</div>
			    	<div id="content" class="text-jutify">
			    		<p>Lên tới 500 - 600 triệu đồng/năm (thỏa thuận theo năng lực).</p>
			    		<p>Có cơ hội được đào tạo tại nước ngoài.</p>
			    		<p>Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p><br>
			    		
			    		<h4>Mô tả công việc</h4>
			    		<p>Hình thức làm việc: Toàn thời gian.</p>
			    		<p>Số lượng: 10 người.</p>
			    		<p>Thu nhập: Lên tới 500 - 600 triệu đồng/năm (thỏa thuận theo năng lực).</p>
			    		<p>Thời gian làm việc: Từ thứ 2 đến thứ 6. Sáng từ 8h00 -12h00, chiều từ 13h15 - 17h15.</p><br>
			    		
			    		<h4>Mô tả chi tiết công việc:</h4>
			    		<p>- Thu thập, phân tích nhu cầu khách hàng, trình bày và tư vấn kỹ thuật các dự án CNTT và Viễn thông.</p>
			    		<p>- Xây dựng giải pháp tích hợp nhiều sản phẩm/giải pháp đảm bảo nhu cầu dự án.</p>
			    		<p>- Phân tích sản phẩm và dịch vụ các đối tác-đối thủ, nghiên cứu áp dụng công nghệ mới.</p>
			    		<p>- Hỗ trợ kỹ thuật trước bán hàng, đấu thầu và triển khai dự án.</p><br>
			    		
			    		<h4>Quyền lợi dành cho Ứng viên</h4>
			    		<p>- Liên tục được đào tạo chuyên môn và có cơ hội được đào tạo tại nước ngoài.</p>
			    		<p>- Phát triển nghề nghiệp khi được tiếp cận và tham gia các dự án công nghệ mới nhất 5G, IoT, Cloud, Big Data, AI/ML, OCS, ….</p>
			    		<p>- Môi trường làm việc năng động, sáng tạo, nhiều thử thách, phát huy tối đa sở trường.</p>
			    		<p>- Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh, các dịp lễ, tết.</p>
			    		<p>- Chế độ phúc lợi đầy đủ: Bảo hiểm, công tác phí, nghỉ mát, team-building, khám sức khỏe định kỳ,…</p><br>
			    		
			    		<h4>Yêu cầu công việc</h4>
			    		<p>- Tốt nghiệp đại học chuyên ngành Công nghệ thông tin, Điện tử viễn thông, Toán Tin hoặc tương đương.</p>
			    		<p>- Có khả năng giao tiếp và đọc hiểu các tài liệu kỹ thuật Tiếng Anh.</p>
			    		<p>- Khả năng tìm kiếm tổng hợp thông tin, trình bày và viết tài liệu kỹ thuật.</p>
			    		<p>- Có tinh thần cầu tiến, trách nhiệm, chủ động, chịu được áp lực cao, có kỹ năng làm việc nhóm.</p>
			    		<p>- Ưu tiên các ứng viên có một trong các tiêu chí:</p>
			    		<p>&emsp;• Kinh nghiệm thiết kế phần mềm hoặc thiết kế triển khai dịch vụ mạng, hệ thống CNTT.</p>
			    		<p>&emsp;• Tích hợp/triển khai các hệ thống CNTT/Viễn thông quy mô quy mô vừa/lớn.</p>
			    		<p>&emsp;• Phát triển phần mềm: phân tích nghiệp vụ hoặc lập trình.</p>
			    		<p>&emsp;• Có chứng chỉ các giải pháp CNTT và mạng, Cloud, An toàn thông tin…</p><br>
			    		
			    		<h4>Địa điểm làm việc:</h4>
			    		<p>- Hà Nội: 124 Hoàng Quốc Việt, Nghĩa Tân, Cầu Giấy, Hà Nội.</p>
			    		<p>- Hồ Chí Minh: Tầng 8, tòa nhà Waseco, Số 10 Phổ Quang, Tân Bình, TP HCM.</p><br>
			    		<h4>Yêu cầu hồ sơ:</h4>
			    		<p>01 bản Tiếng Việt hoặc tiếng Anh nêu khả năng, kinh nghiệm, quá trình công tác, mức lương mong muốn, bảng điểm và các bằng cấp chứng chỉ photo (nếu có).</p><br>
			    		
			    		<h4>Thông tin liên hệ: </h4>
			    		<p>•	Mrs: Lã Thu Hồng</p>
			    		<p>•	Địa chỉ: Số 124 Hoàng Quốc Việt - Phường Nghĩa Tân - Quận Cầu Giấy - Hà Nội.</p>
			    		<p>•	Email liên hệ: hrm@ansv.vn</p>
			    	</div>
			    </div>
			    <div class="swipe-tab-content">
			    	<div id="title" class="text-center mb-2">
			    		<h3>Kỹ Sư Triển Khai (Lương Lên Tới 350-400Tr/năm + Thưởng Định Kỳ)</h3>
			    	</div>
			    	<div id="content" class="text-jutify">
			    		<p>Từ 185 triệu đồng/năm trở lên (thỏa thuận theo năng lực).</p>
			    		<p>Luôn tạo điều kiện học các chứng chỉ quốc tế.</p>
			    		<p>Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p><br>
			    		
			    		<h4>Mô tả công việc</h4>
			    		<p>Hình thức làm việc: Toàn thời gian.</p>
			    		<p>Số lượng: 10 người.</p>
			    		<p>Thu nhập: Từ 185 triệuđồng/năm trở lên (thỏa thuận theo năng lực).</p>
			    		<p>Thời gian làm việc: Từ thứ 2 đến thứ 6. Sáng từ 8h00 -12h00, chiều từ 13h15 - 17h15.</p><br>
			    		
			    		<h4>Mô tả chi tiết công việc:</h4>
			    		<p>Tham gia trực tiếp triển khai, tích hợp hệ thống, hỗ trợ kỹ thuật, quản lý các dự án của Công ty về các lĩnh vực:</p>
			    		<p>&emsp;- Mạng di động (4G/5G) phần RAN và phần Core, mạng trục IP Backbone, hệ thống truyền dẫn quang, mạng băng rộng cố định hữu tuyến.</p>
			    		<p>&emsp;- Tích hợp hệ thống, AI, Cloud, Big Data, IPCC, OCS, …</p>
			    		<p>&emsp;- Chuyển đổi số cho chính phủ và doanh nghiệp: Hệ thống quản trị và giám sát IOC, các lĩnh vực ngành dọc trong Smartcity, Hệ thống Camera giám sát và giao thông thông minh, bệnh viện thông minh, ngôi nhà thông minh, Nông nghiệp thông minh, Quan trắc môi trường thông minh,…</p>
			    		<p>&emsp;- Xây dựng giải pháp và thực hiện lập trình các hệ thống CNTT.</p>
			    		<p>&emsp;- Hệ thống thiết bị đầu cuối Wifi Carrier, Wifi Mesh, GPON-ONT, SET-TOP-BOX,…</p><br>
			    		
			    		<h4>Quyền lợi dành cho Ứng viên</h4>
			    		<p>- Liên tục được đào tạo chuyên môn tại Công ty và có cơ hội được đào tạo tại nước ngoài.</p>
			    		<p>- Được tiếp cận các công nghệ mới nhất 5G, IoT, Cloud, Big Data, AI/ML, OCS, ….</p>
			    		<p>- Cơ hội thăng tiến trong chuyên môn, nghề nghiệp.</p>
			    		<p>- Môi trường làm việc năng động, sáng tạo, nhiều thử thách, phát huy tối đa sở trường.</p>
			    		<p>- Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p>
			    		<p>- Chế độ phúc lợi đầy đủ: Bảo hiểm, công tác phí, nghỉ mát, team-building, khám sức khỏe định kỳ,…</p><br>
			    		
			    		<h4>Yêu cầu công việc</h4>
			    		<p>- Tốt nghiệp đại học chuyên ngành điện tử viễn thông, CNTT.</p>
			    		<p>- Khả năng giao tiếp và đọc hiểu các tài liệu Tiếng Anh khá trở lên.</p>
			    		<p>- Có tinh thần cầu tiến, trách nhiệm, chủ động, chịu được áp lực cao trong công việc và có kỹ năng làm việc nhóm.</p>
			    		<p>- Ưu tiên các ứng viên có chứng chỉ quốc tế về lĩnh vực CNTT và Điện tử Viễn thông.</p><br>
			    		
			    		<h4>Địa điểm làm việc:</h4>
			    		<p>- Hà Nội: 124 Hoàng Quốc Việt, Nghĩa Tân, Cầu Giấy, Hà Nội.</p>
			    		<p>- Hồ Chí Minh: Tầng 8, tòa nhà Waseco, Số 10 Phổ Quang, Tân Bình, TP HCM.</p><br>
			    		<h4>Yêu cầu hồ sơ:</h4>
			    		<p>01 bản Tiếng Việt hoặc tiếng Anh nêu khả năng, kinh nghiệm, quá trình công tác, mức lương mong muốn, bảng điểm và các bằng cấp chứng chỉ photo (nếu có).</p><br>
			    		
			    		<h4>Thông tin liên hệ: </h4>
			    		<p>•	Mrs: Lã Thu Hồng</p>
			    		<p>•	Địa chỉ: Số 124 Hoàng Quốc Việt - Phường Nghĩa Tân - Quận Cầu Giấy - Hà Nội.</p>
			    		<p>•	Email liên hệ: hrm@ansv.vn</p>
			    	</div>
			    </div>
			    <div class="swipe-tab-content">
					<div id="title" class="text-center mb-2">
			    		<h3>Lập Trình Viên C#, .NET, SQL (Lương Lên Tới 350-400Tr/năm + Thưởng Định Kỳ)</h3>
			    	</div>
			    	<div id="content" class="text-jutify">
			    		<p>Từ 228 triệu đồng/năm trở lên (thỏa thuận theo năng lực).</p>
			    		<p>Liên tục đào tạo chuyên môn.</p>
			    		<p>Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p><br>
			    		
			    		<h4>Mô tả công việc</h4>
			    		<p>Hình thức làm việc: Toàn thời gian.</p>
			    		<p>Số lượng: 10 người.</p>
			    		<p>Thu nhập: Từ 228 triệu đồng/năm trở lên (thỏa thuận theo năng lực).</p>
			    		<p>Thời gian làm việc: Từ thứ 2 đến thứ 6. Sáng từ 8h00 -12h00, chiều từ 13h15 - 17h15.</p><br>
			    		<h4>Mô tả chi tiết công việc:</h4>
			    		<p>- Tham gia phân tích, thiết kế và phát triển phần mềm trên nền tảng Web/ Deskto App/ Mobile cho các dự án chuyển đổi số lĩnh vực: Doanh nghiệp, nông nghiệp, y tế,…</p>
			    		<p>- Thiết kế, xây dựng và maintance các module, chức năng của các dự án phần mềm phục vụ các dự án triển khai tích hợp hệ thống của công ty.</p>
			    		<p>- Phát triển, chỉnh sửa giao diện người dùng (UX, UI, GUI,…).</p><br>
			    		
			    		<h4>Quyền lợi dành cho Ứng viên</h4>
			    		<p>- Liên tục được đào tạo chuyên môn trước, sau khi làm việc chính thức tại Công ty.</p>
			    		<p>- Được tiếp cận các công nghệ mới nhất 5G, IoT, Cloud, Big Data, AI/ML, OCS, ….</p>
			    		<p>- Cơ hội thăng tiến trong chuyên môn, nghề nghiệp.</p>
			    		<p>- Môi trường làm việc năng động, sáng tạo, nhiều thử thách, phát huy tối đa sở trường.</p>
			    		<p>- Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p>
			    		<p>- Chế độ phúc lợi đầy đủ: Bảo hiểm, công tác phí, nghỉ mát, team-building, khám sức khỏe định kỳ,…</p><br>
			    		
			    		<h4>Yêu cầu công việc</h4>
			    		<p>- Chuẩn bị tốt nghiệp hoặc tốt nghiệp ĐH ngành CNTT, công nghệ phần mềm, toán tin hoặc các trung tâm đào tạo CNTT.</p>
			    		<p>- Khả năng giao tiếp và đọc hiểu các tài liệu Tiếng Anh khá trở lên.</p>
			    		<p>- Có một trong các kinh nghiệm sau là một lợi thế:</p>
			    		<p>&emsp;o Có kinh nghiệm lập trình bằng ngôn ngữ lập trình Back-end: Java, Nodejs, PHP…</p>
			    		<p>&emsp;o Xây dựng thiết kế Database, sử dụng ngôn ngữ SQL truy vấn và xử lý dữ liệu…</p>
			    		<p>&emsp;o Sử dụng các loại Design Pattern trong lập trình.</p>
			    		<p>&emsp;o Hiểu biết về Resfull API, SOAP API, Webhook..</p>
			    		<p>- Có tinh thần cầu tiến, trách nhiệm, chủ động, chịu được áp lực cao trong công việc và có kỹ năng làm việc nhóm.</p><br>
			    		
			    		<h4>Địa điểm làm việc:</h4>
			    		<p>- Hà Nội: 124 Hoàng Quốc Việt, Nghĩa Tân, Cầu Giấy, Hà Nội.</p>
			    		<p>- Hồ Chí Minh: Tầng 8, tòa nhà Waseco, Số 10 Phổ Quang, Tân Bình, TP HCM.</p><br>
			    		<h4>Yêu cầu hồ sơ:</h4>
			    		<p>01 bản Tiếng Việt hoặc tiếng Anh nêu khả năng, kinh nghiệm, quá trình công tác, mức lương mong muốn, bảng điểm và các bằng cấp chứng chỉ photo (nếu có).</p><br>
			    		
			    		<h4>Thông tin liên hệ: </h4>
			    		<p>•	Mrs: Lã Thu Hồng.</p>
			    		<p>•	Địa chỉ: Số 124 Hoàng Quốc Việt - Phường Nghĩa Tân - Quận Cầu Giấy - Hà Nội.</p>
			    		<p>•	Email liên hệ: hrm@ansv.vn</p>
			    	</div>
				</div>
			    <div class="swipe-tab-content">
					<div id="title" class="text-center mb-2">
			    		<h3>Chuyên Viên Kinh Doanh (Thu Nhập Lên Tới 500-600Tr/năm + Thưởng Dự Án)</h3>
			    	</div>
			    	<div id="content" class="text-jutify">
			    		<p>Lên tới 500 - 600 triệu đồng/năm (thỏa thuận theo năng lực).</p>
			    		<p>Được tham dự án công nghệ mới nhất 5G, IoT, Cloud, Big Data, AI/ML, OCS, ….</p>
			    		<p>Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p><br>
			    		
			    		<h4>Mô tả công việc</h4>
			    		<p>Hình thức làm việc: Toàn thời gian.</p>
			    		<p>Số lượng: 10 người.</p>
			    		<p>Thu nhập: Từ 228 triệu đồng/năm trở lên (thỏa thuận theo năng lực).</p>
			    		<p>Thời gian làm việc: Từ thứ 2 đến thứ 6. Sáng từ 8h00 -12h00, chiều từ 13h15 - 17h15.Sẵn sàng làm ngoài giờ khi dự án vào thời gian cần gấp.</p><br>
			    		
			    		<h4>Mô tả chi tiết công việc:</h4>
			    		<p>- Tìm kiếm, thiết lập Business network với các khách hàng quan trọng trong khối Chính phủ (Bộ tài chính, công an, quốc phòng, tài nguyên môi trường…), khối tài chính - ngân hàng (các ngân hàng top bank, công ty tài chính…), nhà mạng viễn thông và các doanh nghiệp lớn khác trên địa bàn cả nước.</p>
			    		<p>- Có sự hiểu biết và các quan hệ tốt với các nhà cung cấp hàng đầu thế giới trong các lĩnh vực CNTT và Viễn thông, sẵn sàng tìm hiểu và thiết lập mối quan hệ với các nhà cung cấp mới tiềm năng và nằm trong định hướng phát triển kinh doanh.</p>
			    		<p>- Triển khai kế hoạch kinh doanh các sản phẩm, giải pháp và dịch vụ của Công ty.</p>
			    		<p>- Tìm kiếm thông tin liên quan tới các sản phẩm, giải pháp nằm trong xu thế phát triển trong giai đoạn 2022 đến 2025 để cung cấp cho các khách hàng hiện tại và tương lai.</p>
			    		<p>- Triển khai công tác chăm sóc khách hàng Nhà mạng Viễn thông/ Doanh nghiệp/Tổ chức/ Chính phủ.</p><br>
			    		
			    		<h4>Quyền lợi dành cho Ứng viên</h4>
			    		<p>- Liên tục được đào tạo chuyên môn và có cơ hội được đào tạo tại nước ngoài.</p>
			    		<p>- Phát triển nghề nghiệp khi được tiếp cận và tham gia các dự án công nghệ mới nhất 5G, IoT, Cloud, Big Data, AI/ML, OCS, ….</p>
			    		<p>- Môi trường làm việc năng động, sáng tạo, nhiều thử thách, phát huy tối đa sở trường.</p>
			    		<p>- Xét duyệt tăng lương 1- 2 lần/năm và thưởng theo kết quả sản xuất kinh doanh các dịp lễ, tết.</p>
			    		<p>- Chế độ phúc lợi đầy đủ: Bảo hiểm, công tác phí, nghỉ mát, team-building, khám sức khỏe định kỳ,…</p><br>
			    		
			    		<h4>Yêu cầu công việc</h4>
			    		<p>- Bằng cấp chuyên môn tối thiểu: Tốt nghiệp Đại học chuyên ngành CNTT, điện tử - viễn thông hoặc các chuyên ngành tương đương.</p>
			    		<p>- Ít nhất 2 năm kinh nghiệm ở vị trí tương đương như Account Manager các khách hàng lớn.</p>
			    		<p>- Có kiến thức tốt về kinh doanh, marketing, truyền thông, phân tích thị trường.</p>
			    		<p>- Chủ động trong công việc. Có khả năng thuyết trình, đàm phán, giải quyết vấn đề.</p>
			    		<p>- Ưu tiên các ứng viên có kinh nghiệm kinh doanh hoặc triển khai các sản phẩm/giải pháp CNTT, điện tử viễn thông.</p>
			    		<p>- Sẵn sàng đi công tác trong nước, quốc tế khi có yêu cầu của dự án.</p><br>
			    		
			    		<h4>Địa điểm làm việc:</h4>
			    		<p>- Hà Nội: 124 Hoàng Quốc Việt, Nghĩa Tân, Cầu Giấy, Hà Nội.</p>
			    		<p>- Hồ Chí Minh: Tầng 8, tòa nhà Waseco, Số 10 Phổ Quang, Tân Bình, TP HCM.</p><br>
			    		<h4>Yêu cầu hồ sơ:</h4>
			    		<p>01 bản Tiếng Việt hoặc tiếng Anh nêu khả năng, kinh nghiệm, quá trình công tác, mức lương mong muốn, bảng điểm và các bằng cấp chứng chỉ photo (nếu có).</p><br>
			    		
			    		<h4>Thông tin liên hệ: </h4>
			    		<p>•	Mrs: Lã Thu Hồng.</p>
			    		<p>•	Địa chỉ: Số 124 Hoàng Quốc Việt - Phường Nghĩa Tân - Quận Cầu Giấy - Hà Nội.</p>
			    		<p>•	Email liên hệ: hrm@ansv.vn</p>
			    	</div>
				</div>
			    
			  </div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
		
			
		
	</section> 
	<script type="text/javascript">
		$(function () {
			'use strict';
	
			var $swipeTabsContainer = $('.swipe-tabs'),
				$swipeTabs = $('.swipe-tab'),
				$swipeTabsContentContainer = $('.swipe-tabs-container'),
				currentIndex = 0,
				activeTabClassName = 'active-tab';
	
			$swipeTabsContainer.on('init', function(event, slick) {
				$swipeTabsContentContainer.removeClass('invisible');
				$swipeTabsContainer.removeClass('invisible');
	
				currentIndex = slick.getCurrent();
				$swipeTabs.removeClass(activeTabClassName);
		       	$('.swipe-tab[data-slick-index=' + currentIndex + ']').addClass(activeTabClassName);
			});
	
			$swipeTabsContainer.slick({
				//slidesToShow: 3.25,
				slidesToShow: 4,
				slidesToScroll: 1,
				arrows: false,
				infinite: false,
				swipeToSlide: true,
				touchThreshold: 10
			});
	
			$swipeTabsContentContainer.slick({
				asNavFor: $swipeTabsContainer,
				slidesToShow: 1,
				slidesToScroll: 1,
				arrows: false,
				infinite: false,
				swipeToSlide: true,
		    draggable: false,
				touchThreshold: 10
			});
	
	
			$swipeTabs.on('click', function(event) {
		        // gets index of clicked tab
		        currentIndex = $(this).data('slick-index');
		        $swipeTabs.removeClass(activeTabClassName);
		        $('.swipe-tab[data-slick-index=' + currentIndex +']').addClass(activeTabClassName);
		        $swipeTabsContainer.slick('slickGoTo', currentIndex);
		        $swipeTabsContentContainer.slick('slickGoTo', currentIndex);
		    });
	
		    //initializes slick navigation tabs swipe handler
		    $swipeTabsContentContainer.on('swipe', function(event, slick, direction) {
		    	currentIndex = $(this).slick('slickCurrentSlide');
				$swipeTabs.removeClass(activeTabClassName);
				$('.swipe-tab[data-slick-index=' + currentIndex + ']').addClass(activeTabClassName);
			});
		});
	</script>
</body>
</html>