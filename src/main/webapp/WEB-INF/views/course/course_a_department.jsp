<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | ${department}</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />

<section id="course" class="public-course">
    <div class="container">
        <h2 class="public-course__heading">Tất Cả Khóa học ban ${department}</h2>
        <div class="row">
            <c:if test="${not empty course }">
                <c:forEach var="c" items="${course}">
                    <div class="col-12 col-lg-4 col-sm-6">
                        <div class="course-item" style="--progress: 75%">
                            <a href="<c:url value="/user/khoa-hoc/${c.id}"/>">
                                <div class="course-item__img" style="background-image: url(${c.url_img})"></div>
                            </a>
                            <div class="course-item-body">
                                <div class="course-item-body__heading texth1" title="${c.name}" style="overflow: hidden;text-overflow: ellipsis;
                                                                                                                   display: -webkit-box;
                                                                                                                   -webkit-line-clamp: 1;/* number of lines to show */
                                                                                                                           line-clamp: 1;
                                                                                                                   -webkit-box-orient: vertical;">
                                    <a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="color: black;text-decoration: none">   ${c.name} </a>
                                </div>
                                <div class="course-item-body__desc text" title="${c.description}" style="overflow: hidden;text-overflow: ellipsis;
                                                                                                                   display: -webkit-box;
                                                                                                                   -webkit-line-clamp: 1; /* number of lines to show */
                                                                                                                           line-clamp: 1;
                                                                                                                   -webkit-box-orient: vertical;">
                                    <a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="color: black;text-decoration: none">   ${c.description} </a>
                                </div>
                                <div class="course-item-body__user">
                                    <i class="fas fa-users"></i>
                                    100
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</section>
<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>
<script src="<c:url value="/assets/course/js/detail.js"/>"></script>

