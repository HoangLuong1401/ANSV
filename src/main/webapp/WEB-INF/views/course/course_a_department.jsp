<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | ${department}</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />

<div class="container-fluid" style="background-color: #f2f2f2">
    <div class="wrap-content">
        <div itemprop="containsSeason">
            <div class="breadcrum nmr" style=" background: transparent;">
                <div class="fluid group">
                    <div class="c-list-item">
                        <h2 class="public-course__heading" style="margin-top: 100px">Tất Cả Khóa học ban ${department}</h2>
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
                                        <a class="thumb" itemprop="url" href="<c:url value="/user/khoa-hoc/${department}/${c.id}"/>" style="width: 200px !important;">
                                            <img  width="170px" height="170px" src="<c:url value="/assets/course/img/course/${c.url_img}"/>" alt="ANSV-COURSE" />
                                        </a>
                                        <div class="box-description" style="margin: 0 !important;">
                                            <h2 itemprop="name"><a itemprop="url" href="<c:url value="/user/khoa-hoc/${department}/${c.id}"/>">${c.name}</a></h2>
                                            <meta itemprop="episodeNumber" content="0" />
                                            <div class="info-detail">
                                                <span> <a href="<c:url value="/user/khoa-hoc/${department}"/>">Ban ${department}</a></span><%--<span><i class="icon-clock"></i>00:06:43</span>--%>
                                            </div><!-- END .info-detail -->
                                        </div><!-- END .box-description -->
                                        </div>
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
</div>
<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>
<script src="<c:url value="/assets/course/js/detail.js"/>"></script>

