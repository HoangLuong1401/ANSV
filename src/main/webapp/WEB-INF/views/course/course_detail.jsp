<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | ${course.name}</title>
<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />
<link rel="stylesheet" href="<c:url value="/assets/course/style/comment.css"/>" />
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel2@2.2.2/dist/assets/owl.carousel.min.css" />
<script src="<c:url value="/assets/course/js/swiper.min.js"/>" charset="utf-8"></script>


<video style="min-width: 100%; min-height: 100%;position: fixed;right: 0;bottom: 0;" playsinline autoplay muted loop>
    <source class="h-100" src="https://mdbootstrap.com/img/video/Lines.mp4" type="video/mp4" />
</video>
<div class="container" style="margin:39px auto">
    <div class="row">
        <div class="col-lg-12 my-auto" style="text-align: center;
                                                  font-size: 29px;
                                                   padding-top: 10px;z-index: 9;">
            <p style="color: white;padding-top: 20px;">${course.name}</p>
            <p class="id_c" style="display: none">${course.id}</p>
            <div class="col-lg-10 mx-auto py-4" style="padding-top: 0px !important;padding-bottom: 0px !important;">
                <c:if test="${not empty listVideo}">
                <div class="embed__container">
                    <div id="player"></div>
                </div>
                <div class="carousel__wrap mt-3" style="text-align: -webkit-center;">
                    <div class="owl-carousel">
                        <c:forEach items="${listVideo}" var="video" varStatus="index">
                        <c:if test="${index.first}">
                        <div data-video="${video.url}" class="item video-thumb active">
                            </c:if>
                            <c:if test="${not index.first}">
                            <div data-video="${video.url}" class="item video-thumb">
                                </c:if>
                                <img src="https://img.youtube.com/vi/${video.url}/hqdefault.jpg"/>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    </c:if>
                </div>
                <c:if test="${not empty docs}">
                    <div class="carousel__wrap mt-3" style="text-align: -webkit-center;">
                        <p style="color: whitesmoke">Tài liệu liên quan</p>
                        <c:forEach items="${docs}" var="doc">
                            <a target="_blank" href="${doc.url_doc}">${doc.name_doc}</a>
                            <br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div class="row">
        <div style="display: grid;height: 100%;place-items: center;text-align: center;background: #000">
            <form id="FormComment" action="#" class="vote_card" style="z-index:99;border-radius: 5px;background-color: #f2f2f2;padding: 14px;width: auto;
                                                                                                        margin: 0 auto;">
                <div style="display: flex; width: 100%;">
                    <div class="range">
                        <div class="slideValue">
                            <span class="spanValue">50</span>
                        </div>
                        <div class="file">
                            <div class="value left">0</div>
                            <input type="range" min = "0" max="100" value="50" name="" class="inputPenge">
                            <div class="value right">100</div>
                        </div>
                    </div>
                    <div style="padding-left:10px">
                        <input type="number" id="inputBoxs" name="lastname" placeholder="Enter number">
                    </div>
                </div>
                <div>
                    <textarea id="subject" name="subject" placeholder="Write something.." cols="30" rows="5"></textarea>
                </div>


                <input id="summitCmt" class="btn" value="Post" readonly style="float:right; width: 130px;margin-top: 10px;">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
    </div>

    <div class="row">

        <div class="col-lg-8" style="z-index: 33;margin: 20px auto;">
            <div class="course_review">
                <c:forEach items="${listVote}" var="vote">
                    <c:if test="${not empty vote}">
                    <div class="course_review__item">
                        <div class="course_review__item__pic">
                            <img src="<c:url value="/assets/course/img/avatar.png"/>" alt="avatar" />
                        </div>
                        <div class="course_review_item_text">
                            <h6>${vote.username} -<p class="stars" style="--rating: ${vote.marks_vote};"></p> <span style="float: right;">${vote.date_cmt}</span></h6>
                            <p>${vote.cmt}</p>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>


<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>
<!-- main scripts -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/owl.carousel2@2.2.2/dist/owl.carousel.min.js"></script>
<script src="<c:url value="/assets/course/js/detail.js"/>"></script>
<script src="<c:url value="/assets/video/js/main.js"/>"></script>
<script>
    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '315',
            width: '560',
            videoId: '${videof.url}',
            playerVars: {
                color: 'white',
                showinfo: 0,
                rel: 0,
                enablejsapi: 1,
                modestbranding: 1,
                showinfo: 0,
                ecver: 2,
                autohide:1,
            },
            events: {
                onStateChange: onPlayerStateChange,
                onReady: function () {
                 console.log("Video is really!!")
                },
            },
        });
        function onPlayerStateChange(e) {
            // console.log('state');
            // console.log(e.data)
            // // if (e.data == YT.PlayerState.ENDED) {
            // //     console.log(YT.PlayerState.ENDED);
            // // }
            console.log("Video is start!!")
            //Add function for remember time see video
        }
    }

    try {
        fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
            return true;
        }).catch(function(e) {
            var carbonScript = document.createElement("script");
            carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
            carbonScript.id = "_carbonads_js";
            document.getElementById("carbon-block").appendChild(carbonScript);
        });
    } catch (error) {
        console.log(error);
    }

</script>