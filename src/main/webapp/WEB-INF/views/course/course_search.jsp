<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | Khóa Học</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />

<div class="container-fluid" style="background-color: #f2f2f2">

    <div class="wrap-content">

        <div itemprop="containsSeason">
            <div class="breadcrum nmr" style=" background: transparent;">
                <div class="fluid group">
                    <div class="c-list-item">
                        <h2 class="public-course__heading" style="margin-top: 100px">Những khóa học có kết quả trùng với <span style="color: white">${text}</span></h2>
                    </div>
                    <!-- END .c-list-item -->
                </div>
                <!-- END .fluid -->
            </div>
            <div class="mid-wrap grid12">
                <div class="section row225">
                    <div class="section-content fluid">

                        <div class="wide-sub fluid clearfix">
                            <div class="subtray block-item video-item">
                                <c:if test="${not empty course}">
                                    <c:forEach items="${course}" var="c">
                                        <div class="item">
                                            <a class="thumb" itemprop="url" href="<c:url value="/user/khoa-hoc/${c.departmentName}/${c.id}"/>" style="width: 200px !important;">
                                                <img  width="170px" height="170px" src="<c:url value="/assets/course/img/course/${c.url_img}"/>" alt="ANSV-COURSE" />
                                            </a>
                                            <div class="box-description" style="margin: 0 !important;">
                                                <h2 itemprop="name"><a itemprop="url" href="<c:url value="/user/khoa-hoc/${c.departmentName}/${c.id}"/>">${c.name}</a></h2>
                                                <meta itemprop="episodeNumber" content="0" />
                                                <div class="info-detail">
                                                    <span> <a href="<c:url value="/user/khoa-hoc/${c.departmentName}"/>">Ban ${c.departmentName}</a></span>

                                                </div>
                                                <!-- END .info-detail -->
                                            </div>
                                            <!-- END .box-description -->

                                            <!--<div class="_rating _disable rating-score" type="video" id="IWZE99A7">
            <span class="fw7 _score">0.0</span>
        </div>--></div>
                                    </c:forEach>
                                    <!--END .item-->
                                </c:if>
                            </div>
                            <%--<div class="paging">--%>
                            <%--<ul class="pagination txtCenter">--%>
                            <%--<li><a class="active" href="#">1</a></li>--%>
                            <%--<li><a class="" href="#">2</a></li>--%><%--<li><a class="" href="#">3</a></li>--%><%--<li><a class="" href="#">4</a></li>--%><%--<li><a class="" href="#">5</a></li>--%><%--<li><a href="#">Sau</a></li>--%><%--<li><a href="#">Cuối</a></li>--%><%--</ul>--%><%--</div>--%><!--END .paging-->
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
<%--<section id="course" class="public-course">--%>
    <%--<div class="container">--%>
        <%--<h2 class="public-course__heading">Những khóa học có kết quả trùng với <span style="color: white">${text}</span></h2>--%>
        <%--<div class="row">--%>
            <%--<c:if test="${not empty course }">--%>
                <%--<c:forEach var="c" items="${course}">--%>
                    <%--<div class="col-12 col-lg-4 col-sm-6">--%>
                        <%--<div class="course-item" style="--progress: 75%">--%>
                            <%--<a href="<c:url value="/user/khoa-hoc/${c.id}"/>">--%>
                                <%--<div class="course-item__img" style="background-image: url(${c.url_img})"></div>--%>
                            <%--</a>--%>
                            <%--<div class="course-item-body">--%>
                                <%--<div class="course-item-body__heading texth1" title="${c.name}" style="overflow: hidden;text-overflow: ellipsis;--%>
                                                                                                                   <%--display: -webkit-box;--%>
                                                                                                                   <%---webkit-line-clamp: 1; /* number of lines to show */--%>
                                                                                                                           <%--line-clamp: 1;--%>
                                                                                                                   <%---webkit-box-orient: vertical;">--%>
                                    <%--<a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="color: black;text-decoration: none">   ${c.name} </a>--%>
                                <%--</div>--%>
                                <%--<div class="course-item-body__desc text" title="${c.description}" style="overflow: hidden;text-overflow: ellipsis;--%>
                                                                                                                   <%--display: -webkit-box;--%>
                                                                                                                   <%---webkit-line-clamp: 1; /* number of lines to show */--%>
                                                                                                                           <%--line-clamp: 1;--%>
                                                                                                                   <%---webkit-box-orient: vertical;">--%>
                                    <%--<a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="color: black;text-decoration: none">   ${c.description} </a>--%>
                                <%--</div>--%>
                                <%--<div class="course-item-body__user">--%>
                                    <%--<i class="fas fa-users"></i>${c.countUser}--%>
                                    <%--<p class="stars" style="--rating: ${c.startVote};"></p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>
            <%--</c:if>--%>
            <%--<c:if test="${empty course }">--%>
                <%--<p>Hiện không có khoa học trùng với kết quả tìm kiếm</p>--%>
            <%--</c:if>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</section>--%>
<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>
<script src="<c:url value="/assets/course/js/detail.js"/>"></script>
