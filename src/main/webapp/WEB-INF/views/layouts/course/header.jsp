<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <div class="container">
        <nav class="nav-pc">
            <div class="nav__left">
                <a href="<c:url value="/user/khoa-hoc/trang-chu"/>" class="nav_logo">
                    <img src="<c:url value="/assets/course/img/ansv_logo.png"/>" alt="logo" />
                </a>
                <div class="nav-list">
                    <div class="nav-list__item">
                        <a href="<c:url value="/user/khoa-hoc/trang-chu"/>">Trang chủ</a>
                    </div>
                    <c:if test="${not empty departments}">
                        <div class="nav-list__item">
                            <a href="<c:url value="/user/khoa-hoc/${departments}"/>"><i class="fas fa-chevron-right" style="color: #fc9404"></i>${departments}</a>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="nav__right">
                <div class="nav__avt">
                    <img src="<c:url value="/assets/course/img/avatar.png"/>" alt="avatar" />
                </div>

                <div class="nav__user-name"><span>${display_name}</span></div>
                <span class="nav_separate"></span>
                <div class="nav-notify">
                    <div class="nav-notify-btn js-progress">
                        <i class="nav-notify-btn__icon fas fa-bookmark"></i>
                        <div class="nav-notify-btn__tooltip">
                            Khóa học của tôi
                        </div>
                        <c:if test="${not empty history}">
                        <ul class="nav-right-dropdown">
                            <h6 class="nav-right-dropdown__heading">
                                Khóa học của tôi
                            </h6>
                            <div class="nav-mobile btn__close">
                                <img src="<c:url value="/assets/course/img/close-black.svg"/>" alt="avatar" />
                            </div>

                            <div class="nav-right-dropdown__scroll">

                                <c:forEach items="${history}" var="h">
                                <li class="course"><div class="course__img">
                                        <img src="<c:url value="/assets/course/img/courses.png"/>" alt="avatar" /></div>
                                    <div class="course-desc"><div class="course-desc__title">${h.name}
                                               </div><%--div class="course-desc__time">${h.name}</div>--%></div>
                                </li>
                                </c:forEach>
                            </div>
                        </ul>
                        </c:if>
                        <c:if test="${empty history}">
                            <ul class="nav-right-dropdown">
                                <h6 class="nav-right-dropdown__heading">Khóa học của tôi</h6>
                                <div class="nav-mobile btn__close">
                                    <img src="<c:url value="/assets/course/img/close-black.svg"/>" alt="avatar" />
                                </div>
                                <div class="nav-right-dropdown__scroll">
                                    <li class="course">
<%--                                        <div class="course__img">--%>
<%--                                            <img src="<c:url value="/assets/course/img/courses.png"/>" alt="avatar" />--%>
<%--                                        </div>--%>
                                        <div class="course-desc"><div class="course-desc__title">
                                                    Hiện bạn chưa tham gia khóa học nào !!
                                            </div>
                                        </div>
                                    </li>
                                </div>
                            </ul>
                        </c:if>
                    </div>
                    <div class="nav-notify-btn js-notify">
                        <i class="nav-notify-btn__icon fas fa-bell"></i>
                        <div class="nav-notify-btn__tooltip">
                            Thông báo
                        </div>
                        <ul class="dropdown-notify">
                            <h6 class="dropdown-notify-header" style="background-color: lightblue">
                                <div class="notify-header__main">
                                    Thông báo
                                </div>
                            </h6>
                            <div class="nav-mobile btn__close">
                                <img src="<c:url value="/assets/course/img/close-black.svg" />" alt="" />
                            </div>
                            <div class="dropdown-notify__scroll">
                                <c:if test="${not empty notificationUnR}">
                                    <c:forEach items="${notificationUnR}" var="noti">
                                        <li class="notify" id="${noti.id}" onclick="return doRead(${noti.id})">
                                            <div class="notify__message">
                                                <div class="notifice-message__main" style="color: black;">
                                                    <div>
                                                            ${noti.content}
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <hr style="margin: 0px; color: red">
                                    </c:forEach>
                                </c:if>
                                <c:if test="${not empty notification}">
                                    <c:forEach items="${notification}" var="noti">
                                        <li class="notify" id="${noti.id}" style="opacity: 0.6;">
                                            <div class="notify__message">
                                                <div class="notifice-message__main" style="color: black;">
                                                    <div>
                                                            ${noti.content}
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <hr style="margin: 0px; color: red">
                                    </c:forEach>
                                </c:if>
                            </div>
                        </ul>
                    </div>
                    <i class=""></i>
                    <div class="nav-notify-btn js-user">
                        <i class="nav-notify-btn__icon--hide-on-mobile nav-notify-btn__icon
                                            fas fa-sign-out-alt"></i>
                        <i class="nav-mobile nav-notify-btn__icon fas fa-bars"></i>
                        <!-- <div class="nav-notify-btn__tooltip">
                            Đăng xuất
                        </div> -->
                        <div class="user-dropdown">
                            <div class="nav-mobile user-info">
                                <div class="user-info__main">
                                    <img src="<c:url value="/assets/course/img/avatar.png"/>" alt="avatar" />
                                    <span>${display_name}</span>
                                </div>
                            </div>
                            <div class="nav-mobile btn__close">
                                <img src="<c:url value="/assets/course/img/close-black.svg"/>" alt="avatar" />
                            </div>
                            <ul>
                                <li class="nav-mobile">
                                    <a href="<c:url value="/user/khoa-hoc/trang-chu"/>"><i class="fas fa-home"></i>
                                        <span>Trang chủ</span></a>
                                </li>
                                <li class="nav-mobile">
                                    <a href="#course"><i class="fas fa-book"></i>
                                        <span>Khóa học</span></a>
                                </li>
                                <li class="nav-mobile">
                                    <a href="#footer"><i class="fas fa-book"></i>
                                        <span>Liên hệ</span></a>
                                </li>
                                <li>
                                    <a href="<c:url value="/user/khoa-hoc/changepass" />"><i class="fas fa-user"></i><span style="background: none; border: none; padding: 0px 16px">Đổi mật khẩu</span></a>
                                </li>
                                <li>
                                    <form style="padding: 5px 0px 0px 0px" action="<c:url value="/j_spring_security_logout" />" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <i class="fas fa-sign-out-alt"></i><input style="background: none; border: none; padding: 0px 16px" type="submit" value="Đăng xuất" />
                                    </form>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>
