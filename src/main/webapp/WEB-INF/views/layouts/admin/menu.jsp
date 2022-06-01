<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar" data-color="blue" data-image="<c:url value='/assets/admin/img/full-screen-image-3.jpg' />">
    <!--	Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
                    Tip 2: you can also add an image using data-image tag	-->
    <div class="logo">

        <a href="<c:url value="/admin/web/quan-ly/slideshow" />" class="simple-text logo-mini">	<b>AD</b></a>
        <a href="<c:url value="/admin/web/quan-ly/slideshow" />" class="simple-text logo-normal">	<b>ADMIN<c:if test="${redirect == 1}"> - ANSV</c:if></b>	</a>

    </div>

    <div class="sidebar-wrapper">
        <div class="user">
            <div class="info">
                <div class="photo">
                    <img src="<c:url value='/assets/admin/img/admin.jpg' />" />
                </div>

                <a data-toggle="collapse" href="#collapseExample" class="collapsed">
					<span> ${ display_name } <%//<b class="caret"></b>%>
				</span>
                </a>
            </div>
        </div>

        <ul class="nav" id="phu_luc">
            <c:if test="${ceo == 1}">
                <li>
                    <a href="<c:url value="/admin/web/quan-ly/slideshow"/>">
                        <i class="pe-7s-film"></i><p>Quản Lý ANSV</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/khoa-hoc/quan-ly/ban"/>">
                        <i class="pe-7s-film"></i><p>Quản Lý Khóa Học</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${redirect == 1}">
                <li>
                    <a href="<c:url value="/admin/web/quan-ly/slideshow" />">
                        <i class="pe-7s-film"></i><p>Slideshow</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/web/quan-ly/highlight" />">
                        <i class="fa fa-eye"></i><p>Nổi bật</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/web/quan-ly/news" />">
                        <i class="pe-7s-photo-gallery"></i><p>Tin tức</p>
                    </a>
                </li>

                <c:if test="${show == 1}">
                    <li style=" position: absolute;bottom: 8px;width: 100%;">
                        <a href="<c:url value="/admin/redircet" />">
                            <i class="pe-7s-photo-gallery"></i><p>Redircet | Chuyển hướng</p>
                        </a>
                    </li>
                </c:if>
            </c:if>
        </ul>
    </div>
</div>

<script>
    $(function(){
        var url = window.location.pathname,
            urlRegExp = new RegExp(url.replace(/\/$/,'') + "$"); // create regexp to match current url pathname and remove trailing slash if present as it could collide with the link in navigation in case trailing slash wasn't present there
        // now grab every link from the navigation
        $('.nav li a').each(function(){
            // and test its normalized href against the url pathname regexp
            if(urlRegExp.test(this.href.replace(/\/$/,''))){
                console.log("add class");
                $(this).parent().addClass('active');
            }
        });
    });
</script>