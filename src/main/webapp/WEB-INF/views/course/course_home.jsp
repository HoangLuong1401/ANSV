<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | Khóa Học</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/style.css"/>" />
<link rel="stylesheet" href="<c:url value="/assets/course/style/home_course.css"/>" />
<link rel="stylesheet" href="<c:url value="/assets/course/style/course_view.css"/>" />

<script type="text/javascript" language="javascript" src="https://zingtv-static.zmdcdn.me/skins/tv_v3/js/vendor/jquery/jquery-2.1.1.1.min.js"></script>


<section>
    <div id="app2" class="wrapper2" v-cloak v-bind:class="{'is-previous': isPreviousSlide, 'first-load': isFirstLoad}">
        <div class="slide-wrapper" v-for="(slide, index) in slides" v-bind:class="{ active: index === currentSlide }" v-bind:style="{ 'z-index': (slides.length - index), 'background-image': 'url(' + slide.bgImg + ')' }">
            <div class="slide-inner">
                <div class="slide-bg-text">
                    <p>{{ slide.headlineFirstLine }}</p>
                    <p>{{ slide.headlineSecondLine }}</p>
                </div>
                <div class="slide-rect-filter">
                    <div class="slide-rect" v-bind:style="{'border-image-source': 'url(' + slide.rectImg + ')'}"></div>
                </div>
                <div class="slide-content">
                    <h1 class="slide-content-text">
                        <p>{{ slide.headlineFirstLine }}</p>
                        <p>{{ slide.headlineSecondLine }}</p>
                    </h1><a v-bind:href="slide.sublineLink" class="slide-content-cta">Bắt Đầu Trải Nhiệm</a>
                </div>
                <h2 class="slide-side-text"><span>{{ slide.sublineFirstLine }} / </span><span>{{ slide.sublineSecondLine }}</span></h2>
            </div>
        </div>
        <div class="controls-container">
            <button class="controls-button" v-for="(slide, index) in slides" v-bind:class="{ active: index === currentSlide }" v-on:click="updateSlide(index)">{{ slide.headlineFirstLine }} {{ slide.headlineSecondLine }}</button>
        </div>
        <div class="pagination-container">
            <span class="pagination-item" v-for="(slide, index) in slides" v-bind:class="{ active: index === currentSlide }" v-on:click="updateSlide(index)"></span>
        </div>
    </div>
</section>

<c:forEach items="${department}" var="dep" >
<div class="section row225">
    <!-- program hightlight box-->
    <div class="section-content non-subtitle fluid">
        <div class="title-bar group">
            <a href="<c:url value="/user/khoa-hoc/${dep.name}"/>">
                <h3>${dep.full_name} - ${dep.name}</h3>
            </a>
        </div>
        <div id="_page_${dep.id}" boxtype="0" total="4" class="inner-section _page">

            <c:forEach var="c" items="${dep.courseList}">

                <div class="subtray">

                    <div class="item">

                        <a class="_trackLink" trackingClick="" zTrackingClick="" tracking=""
                           href="<c:url value="/user/khoa-hoc/${dep.name}/${c.id}"/>" >
                            <img class="_slideimg" img_index="0" width="225" height="225"
                                 _src="<c:url value="/assets/course/img/course/${c.url_img}"/>"
                                 src="<c:url value="/assets/course/img/course/${c.url_img}"/>"
                                 alt="ANSV COURSE">
                        </a>

                        <div class="description">
                            <h4 class="title">
                                <a class="_trackLink" trackingClick="" zTrackingClick="" tracking=""
                                   href="<c:url value="/user/khoa-hoc/${dep.name}/${c.id}"/> "
                                   title="${c.name}">
                                        ${c.name}
                                </a>
                            </h4>
                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>
        <!-- END .inner-section -->
    </div>

    <!-- END .section-content -->
    <a href="#" id="prev_${dep.id}" class="prev _prev none"><i class="fas fa-chevron-left" style="top: 11px;position: relative;font-size: 36px;left: 10px;"></i></a>
    <a href="#" id="next_${dep.id}" class="next _next"><i class="fas fa-chevron-right" style="top: 11px;position: relative;font-size: 36px;right: -22px;"></i></a>
</div>
</c:forEach>


<section class="down-banner">
    <div class="down-banner__bkg"></div>
    <div class="down-content container">
        <div class="down-content__heading">
            ${numberUser}+ người khác đã học. Còn bạn?
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>


<script>
    var app = new Vue({
        el: "#app2",
        data: {
            currentSlide: 0,
            isPreviousSlide: false,
            isFirstLoad: true,
            slides: [
                {
                    headlineFirstLine: "ANSV",
                    headlineSecondLine: "COURSE",
                    sublineFirstLine: "Learn for now",
                    sublineSecondLine: "for future",
                    sublineLink:"#start",
                    bgImg: "https://i.postimg.cc/C5yvGSkm/slide0.jpg",
                    rectImg: "https://i.postimg.cc/vTW0XkvM/slide-rect0.jpg"
                }
                <%--{--%>
                    <%--headlineFirstLine: "Nulla",--%>
                    <%--headlineSecondLine: "Auctor",--%>
                    <%--sublineFirstLine: "Il n'y a rien de neuf sous",--%>
                    <%--sublineSecondLine: "le soleil",--%>
                    <%--sublineLink:"<c:url value="/user/khoa-hoc/tat-ca"/>",--%>
                    <%--bgImg: "https://i.postimg.cc/Qx34VNXM/slide1.jpg",--%>
                    <%--rectImg: "https://i.postimg.cc/ryWZ8R2b/slide-rect1.jpg"--%>
                <%--},--%>
                <%--{--%>
                    <%--headlineFirstLine: "Nullam",--%>
                    <%--headlineSecondLine: "Ultricies",--%>
                    <%--sublineFirstLine: "Τίποτα καινούργιο κάτω από",--%>
                    <%--sublineSecondLine: "τον ήλιο",--%>
                    <%--sublineLink:"<c:url value="/user/khoa-hoc/tat-ca"/>",--%>
                    <%--bgImg: "https://i.postimg.cc/t4RBtrnQ/slide2.jpg",--%>
                    <%--rectImg: "https://i.postimg.cc/3JFLGMRF/slide-rect2.jpg"--%>
                <%--},--%>
            ]
        },
        mounted: function () {
            var productRotatorSlide = document.getElementById("app2");
            var startX = 0;
            var endX = 0;

            productRotatorSlide.addEventListener(
                "touchstart",
                (event) => (startX = event.touches[0].pageX)
            );

            productRotatorSlide.addEventListener(
                "touchmove",
                (event) => (endX = event.touches[0].pageX)
            );

            productRotatorSlide.addEventListener(
                "touchend",
                function (event) {
                    var threshold = startX - endX;

                    if (threshold < 150 && 0 < this.currentSlide) {
                        this.currentSlide--;
                    }
                    if (threshold > -150 && this.currentSlide < this.slides.length - 1) {
                        this.currentSlide++;
                    }
                }.bind(this)
            );
        },
        methods: {
            updateSlide(index) {
                index < this.currentSlide
                    ? (this.isPreviousSlide = true)
                    : (this.isPreviousSlide = false);
                this.currentSlide = index;
                this.isFirstLoad = false;
            }
        }
    });

</script>