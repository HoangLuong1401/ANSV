<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="sidebar" data-color="blue"
     data-image="<c:url value='/assets/admin/img/full-screen-image-3.jpg' />">
    <!--	Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
                    Tip 2: you can also add an image using data-image tag	-->

    <div class="logo">
        <a href="<c:url value="/admin/khoa-hoc/quan-ly/ban" />" class="simple-text logo-mini">	<b>AD</b></a>
        <a href="<c:url value="/admin/khoa-hoc/quan-ly/ban" />" class="simple-text logo-normal">	<b>ADMIN - COURSE</b>	</a>
    </div>

    <div class="sidebar-wrapper">
        <div class="user">
            <div class="info">
                <div class="photo">
                    <img src="<c:url value='/assets/admin/img/admin.jpg' />" />
                </div>

                <a data-toggle="collapse" href="#collapseExample" class="collapsed">
					<span> ${display_name}
				</span>
                </a>
            </div>
        </div>

        <ul class="nav" id="phu_luc">
            <c:if test="${redirect == 1}">
                <li>
                    <a href="<c:url value="/admin/khoa-hoc/quan-ly/ban" />">
                        <i class="pe-7s-film"></i><p>Ban</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/khoa-hoc/quan-ly/course" />">
                        <i class="fa fa-eye"></i><p>Khóa Học</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/khoa-hoc/quan-ly/notification" />">
                        <i class="pe-7s-photo-gallery"></i><p>Thông Báo</p>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/admin/khoa-hoc/quan-ly/user"/>">
                        <i class="pe-7s-user"></i><p>Thành Viên</p>
                    </a>
                </li>
                <%--				<li>--%>
                <%--					<a href="<c:url value="/admin/news/list" />">--%>
                <%--						<i class="pe-7s-photo-gallery"></i><p>Quản Lý User</p>--%>
                <%--					</a>--%>
                <%--				</li>--%>

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