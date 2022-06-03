<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | Khóa Học</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<c:forEach items="${department}" var="dep">
    <c:if test="${not empty dep.courseList }">
        <section id="course" class="public-course">
        <div class="container">
        <h2 class="public-course__heading">Khóa học ban ${dep.name}</h2>
        <div class="row">
        <c:forEach var="c" items="${dep.courseList}">
            <div class="col-12 col-lg-4 col-sm-6">
                <div class="course-item" style="--progress: 75%">
                    <a href="<c:url value="/user/khoa-hoc/${c.id}"/>">
                        <div class="course-item__img" style="background-image: url(${c.url_img})"></div>
                    </a>
                    <div class="course-item-body">
                        <div class="course-item-body__heading texth1" title="${c.name}" style="overflow: hidden;text-overflow: ellipsis;
                                                                                                                       display: -webkit-box;
                                                                                                                       -webkit-line-clamp: 1; /* number of lines to show */
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
        <div class="container">
            <div class="center">
                <button class="btn"><a style="text-decoration: none; color: whitesmoke"  href="<c:url value="/user/khoa-hoc/tat-ca/${dep.id}"/>">Xem Tất Cả Khóa Học cua của ${dep.name}</a></button>
            </div>
        </div>
    </c:if>
    </div>
    </div>
    </section>
</c:forEach>
<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>

<script src="<c:url value="/assets/course/js/detail.js"/>"></script>
<script>

    jQuery(document).ready(
        function($) {
            if(window.history.length == 1){
                $("#backBtn").hide();
            }else{
                $("#backBtn").show();
            }
        }
    );

</script>

