<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | ${course.name}</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />
<link rel="stylesheet" href="<c:url value="/assets/course/style/comment.css"/>" />
<link rel="stylesheet" href="<c:url value="/assets/course/style/course_view.css"/>" />
<style>

    .flex-wrapper {
        display: flex;
        flex-flow: row wrap;
        text-align: center;
        justify-content: center;
    }

    .video-wrapper {
        min-width: 40%;
        max-width: 750px;
        height: 100%;
        margin:  10px 10px;
        flex: 1 1 auto;
    }

    @media only screen and (max-width: 500px) {
        .video-wrapper {
            min-width: 360px;
        }
    }

    .ratio-keeper {
        position: relative;
        padding-top: 56.25%;
        top: 60px;
        margin-bottom: 75px;
    }

    .video-frame {
        position: absolute;
        top: 0; left: 0;
        width: 100%;
        height: 100%;
    }
    .star-widget input{
        display: none;
    }
    .star-widget label{
        font-size: 15px;
        color: #444;
        float: right;
        transition: all 0.2s ease;
    }
    input:not(:checked) ~ label:hover,
    input:not(:checked) ~ label:hover ~ label{
        color: #fd4;
    }
    input:checked ~ label{
        color: #fd4;
    }


</style>
<section style="background-color: #f2f2f2;">
    <div class="container" style="width: 80%">
        <c:if test="${not empty listVideo}">
        <div class="flex-wrapper">
            <div class="video-wrapper">
                <div class="ratio-keeper">
                    <c:if test="${not empty videof}">
                        <iframe class="video-frame" src="https://www.youtube.com/embed/${videof.url}?rel=0" frameborder="0" allowfullscreen></iframe>
                    </c:if>
                    <c:if test="${not empty url}">
                        <iframe class="video-frame" src="https://www.youtube.com/embed/${url}?rel=0" frameborder="0" allowfullscreen></iframe>
                    </c:if>
                </div>
            </div>
        </div>
        </c:if>
        <div class="section info-play info-program">
            <div class="section-content">
                <div class="outside-des">
                    <div class="box-description">
                        <h1>
                            <strong alt="${course.name}">${course.name}</strong>
                        </h1>
                        <c:if test="${not empty listVideo}">
                            <div style="text-align: center;">
                                <c:forEach items="${listVideo}" var="video" varStatus="index"><a href="<c:url value="/user/khoa-hoc/${departments}/${course.id}/${video.url}"/>"><img src="https://img.youtube.com/vi/${video.url}/hqdefault.jpg" style="width: 200px;height: 180px"/></a></c:forEach>
                            </div>
                        </c:if>
                        <strong style="font-size: 25px;">Phòng ban: </strong>

                        <h3 style="font-size: 25px;"><a href="<c:url value="/user/khoa-hoc/${departments}"/>" >${departments}</a></h3>
                        <div>
                            <c:if test="${not empty docs}">
                                <div class="carousel__wrap mt-3" style="text-align: -webkit-center;">
                                    <p style="color: black">Tài liệu liên quan</p>
                                    <c:forEach items="${docs}" var="doc">
                                        <a style="font-size: 30px" target="_blank" href="${doc.url_doc}">${doc.name_doc}</a>
                                        <br>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div><!-- END .box-description -->
                </div><!-- END .outside-des -->
            </div><!-- END .section-content fluid -->
        </div>
        <div class="section user-tool-play user-tools" style="height: 100px">
            <div class="section-content fluid">
                <div class="user-rate _rating " style="float: left; position: relative">
                    <div class="star-widget" style="float: inherit">
                        <input type="radio" name="rate" id="rate-5">
                        <label style="font-size: 35px" for="rate-5" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-4">
                        <label style="font-size: 35px" for="rate-4" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-3">
                        <label style="font-size: 35px" for="rate-3" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-2">
                        <label style="font-size: 35px" for="rate-2" class="fas fa-star"></label>
                        <input type="radio" name="rate" id="rate-1">
                        <label style="font-size: 35px" for="rate-1" class="fas fa-star"></label>
                    </div>
                    <br>
                    <c:if test="${not empty markss}">
                        <strong style="font-size: 15px;" class="user-vote _uservote">(${markss}/5)</strong>
                    </c:if>
                    <c:if test="${empty markss}">
                        <strong style="font-size: 15px;" class="user-vote _uservote">(0/5)</strong>
                    </c:if>
                    <c:if test="${not empty numberVote}">
                        <strong style="font-size: 15px;" class="vote-count _votecount" itemprop="reviewCount">${numberVote} lượt đánh giá</strong>
                    </c:if>
                    <c:if test="${empty numberVote}">
                        <strong style="font-size: 15px;" class="vote-count _votecount" itemprop="reviewCount">0 lượt đánh giá</strong>
                    </c:if>
                </div><!-- END .user-rate -->
            </div><!-- END .section-content fluid -->
        </div>

        <div class="mid-wrap grid12">
            <div class="section row126">
                <div class="section-content fluid">
                    <div class="block-comment">
                        <a id="_comment" name="comment"></a>
                                <div class="title-bar nav-comment group" style="">
                                    <div class="head-title-comment">Bình Luận</div>
                                </div><!-- END .title-bar group -->
                                    <div id="_zingCommentContent" class="comment" style="">
                                        <div id="comment_form" class="form-group">
                                            <textarea id="comment_text" spellcheck="false" class="comment-textarea" placeholder="Hãy chia sẻ cảm nghĩ của bạn về video này."></textarea>
                                        </div>

                                        <p class="comment-noti">
                                            <span>Nhấn Shift + Enter để xuống dòng. Bình luận phải dài hơn 50 ký tự.</span>
                                            <a href="javascript:void(0);" id="_btnCommentSubmit"
                                               class="button button-green">Bình luận</a>
                                        </p>
                                    </div>
                                <!-- END .comment-form -->
                            <!-- END .comment -->
                        </div><!-- END .section-content -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section>
    <div class="col-lg-8" style="z-index: 33;margin: 20px auto;position: relative;top: 15px">
        <div class="course_review">
            <c:forEach items="${listCmt}" var="vote">
                <c:if test="${not empty vote}">
                    <div class="course_review__item">
                        <div class="course_review__item__pic">
                            <img src="<c:url value="/assets/course/img/avatar.png"/>" alt="avatar" style="height: 50px;width: 50px;border-radius: 50%;"/>
                        </div>
                        <div class="course_review_item_text">
                            <h6 style='color: black'>${vote.username} <span style="float: right;color: black">${vote.dayup}</span></h6>
                            <p style="color: black">${vote.cmt}</p>
                        </div>
                    </div>
                </c:if>
                </c:forEach>
            </div>
        </div>
</section>

<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>

<script src="<c:url value="/assets/course/js/detail.js"/>"></script>
<script>
    jQuery(document).ready(function ($) {
        var mark = 0;
        <c:if test="${not empty markss}">$('#rate-'+${markss}).prop("checked", true);</c:if>
        $("#rate-1").click(function() {
            $(".user-vote").text("(1/5)");
            mark = 1;
            $.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/vote",
                contentType : "application/json",
                data: {id_c: ${course.id},mark : mark},
                dataType : 'json',
                success: function(data) {
                    alert("Bạn đã hoàn thành đánh giá cho Khóa học")
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
        $("#rate-2").click(function() {
            $(".user-vote").text("(2/5)");
            mark = 2;
            $.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/vote",
                contentType : "application/json",
                data: {id_c: ${course.id},mark : mark},
                dataType : 'json',
                success: function(data) {
                    alert("Bạn đã hoàn thành đánh giá cho Khóa học")
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
        $("#rate-3").click(function() {
            $(".user-vote").text("(3/5)");
            mark = 3;
            $.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/vote",
                contentType : "application/json",
                data: {id_c: ${course.id},mark : mark},
                dataType : 'json',
                success: function(data) {
                    alert("Bạn đã hoàn thành đánh giá cho Khóa học")
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
        $("#rate-4").click(function() {
            $(".user-vote").text("(4/5)");
            mark = 4;
            $.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/vote",
                contentType : "application/json",
                data: {id_c: ${course.id},mark : mark},
                dataType : 'json',
                success: function(data) {
                    alert("Bạn đã hoàn thành đánh giá cho Khóa học")
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
        $("#rate-5").click(function() {
            $(".user-vote").text("(5/5)");
            mark = 5;
            $.ajax({
                type: "GET", url: "/ANSV/user/khoa-hoc/vote", contentType : "application/json", data: {id_c: ${course.id},mark : mark},
                dataType : 'json',
                success: function(data) {alert("Bạn đã hoàn thành đánh giá cho Khóa học")}, error: function(e) {console.log(e);}
            });
        });


        $("#_btnCommentSubmit").click(function() {
            if($("#comment_text").val().length > 50 ){
                $.ajax({
                    type: "GET",
                    url: "/ANSV/user/khoa-hoc/comment",
                    contentType : "application/json",
                    data: {id_c: ${course.id}, comments : $("#comment_text").val()},
                    dataType : 'json',
                    success: function(data) {
                        var result = "<div class=\"course_review__item\">\n" +
                            "<div class=\"course_review__item__pic\">\n" +
                            "                        <img src=\"/ANSV/assets/course/img/avatar.png\"/></div>\n" +
                            "                    <div class=\"course_review_item_text\">\n" +
                            "                        <h6 style='color: black'>"+data.username+"<span style=\"float: right;color: black\">"+data.dayup+"</span></h6>\n" +
                            "                        <p style='color: black'>"+data.cmt+"</p></div></div>";
                        $(".course_review").html(result);
                    },
                    error: function(e) {console.log(e);}
                });
            }else {alert(" Bình luận phải dài hơn 50 ký tự.")}
        });
    });
</script>