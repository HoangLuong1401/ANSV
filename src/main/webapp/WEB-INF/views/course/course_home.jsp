<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ANSV | Khóa Học</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/bootstrap.min.css"/>" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/style.css"/>" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/formtest.css"/>" />
    <link href="<c:url value="/assets/user/img/logo/logo_ansv_big_new-removebg-preview.png" />" rel="icon">
    <link href="<c:url value="/assets/user/img/logo_ansv.png" />" rel="apple-touch-icon">

    <style>
        #myBtn {
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            left: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            border: none; /* Remove borders */
            outline: none; /* Remove outline */
            color: white; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            font-size: 18px; /* Increase font size */
            width: 175px;
            background: transparent;
        }

        .btn{
            margin: 0px;
        }
        .search-model {
            display: none;
            position: fixed;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            background: #000;
            z-index: 99999;
        }

        .search-model-form {
            padding: 0 15px;
        }

        .search-model-form input {
            width: 500px;
            font-size: 25px;
            border: none;
            border-bottom: 2px solid #333;
            background: 0 0;
            color: #999;
        }

        .search-close-switch {
            position: absolute;
            width: 50px;
            height: 50px;
            background: #333;
            color: #fff;
            text-align: center;
            border-radius: 50%;
            font-size: 28px;
            line-height: 28px;
            top: 30px;
            cursor: pointer;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }
    </style>
</head>

<body>
<div class="banner">
    <video class="banner__video" autoplay muted loop style="z-index: -1">
        <source src="<c:url value="/assets/course/video/home-backdrop.mp4"/>" type="video/mp4" />
    </video>
</div>

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
                                    <a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="text-decoration: none; color: black"> ${c.name}</a>
                                </div>
                                <div class="course-item-body__desc text" title="${c.description}" style="overflow: hidden;text-overflow: ellipsis;
                                                                                                                   display: -webkit-box;
                                                                                                                   -webkit-line-clamp: 2; /* number of lines to show */
                                                                                                                           line-clamp: 2;
                                                                                                                   -webkit-box-orient: vertical;">
                                    <a href="<c:url value="/user/khoa-hoc/${c.id}"/>" style="text-decoration: none; color: black">  ${c.description}</a>
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

</c:forEach>
<section>
    <div class="container">
        <div class="center">
            <button class="btn"><a style="text-decoration: none; color: whitesmoke"  href="<c:url value="/user/khoa-hoc/tat-ca"/>">Xem Thêm Khoa Học</a></button>
        </div>
    </div>
</section>

<section class="down-banner">
    <div class="down-banner__bkg"></div>
    <div class="down-content container">
        <div class="down-content__heading">
            1000+ người khác đã học. Còn bạn?
        </div>
        <div class="down-content__desc">
            "Học nào bạn. Mê đấy!”
        </div>
        <button class="btn btn--down-content">Thử một lần</button>
    </div>
</section>

<section class="slogan container">
    <div class="row">
        <div class="col-12 col-md-6 col-12--custom">
            <img class="slogan__img" src="<c:url value="/assets/course/img/bg_ansv.jpg"/>" alt="slogan" />
        </div>
        <div class="col-12 col-md-6">
            <div class="slogan-quote">
                <blockquote class="slogan-qoute__blockquote">
                    Đối với mỗi con người chúng ta, việc học tập là vô cùng cần thiết và quan trọng. Học để
                    chúng ta lĩnh hội kiến thức và phục vụ cho công việc, cho cuộc sống sau này. Chính vì thế mà
                    việc học là một việc mỗi con người chúng ta đều phải học. nhưng học như thế nào cho đúng,
                    cho hiệu quả thì ai có thể làm được. nhà triết học Lê- Nin đã có một câu nói về cách học mà
                    chúng ta cần phải học hỏi, đó là "Học, học nữa, học mãi”.
                    <br>
                    "... Học tập là chuyện cả đời, để duy trì được hiệu quả trong công việc, bộ não phải luôn
                    hoạt động. Và muốn bộ não hoạt động hiệu quả nhất, không gì bằng thời gian đọc sách mỗi ngày
                    ..."
                </blockquote>
                <p class="slogan-qoute__author">– Châm ngôn học tập –</p>
            </div>
        </div>
    </div>
</section>

<script src="<c:url value="/assets/course/js/main.js"/>"></script>

</body>
</html>
