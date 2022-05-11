<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.6.0/flatly/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/assets/video/css/main.css"/>" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel2@2.2.2/dist/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />
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

        #backBtn{
            position: fixed; /* Fixed/sticky position */
            bottom: 58px; /* Place the button at the bottom of the page */
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
    </style>
</head>
<body>
<video style="min-width: 100%; min-height: 100%;position: fixed;right: 0;bottom: 0;" playsinline autoplay muted loop>
    <source class="h-100" src="https://mdbootstrap.com/img/video/Lines.mp4" type="video/mp4" />
</video>
<div id="jquery-script-menu" style="height: 0px; background:none; border:none;z-index: auto;">
    <div class="container" style="margin:39px auto">
        <div class="row">
            <div class="col-lg-12 my-auto" style="text-align: center;
                                                  font-size: 29px;
                                                   padding-top: 10px;">
                <p style="color: white">${course.name}</p>
                <div class="col-lg-10 mx-auto py-4" style="padding-top: 0px !important;">
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
                    </div></c:if>
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
</div>
</div>
<button id="backBtn" onclick="window.history.back()">
    <div class="btn"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
</button>
<!-- main scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            },
            events: {
                onStateChange: onPlayerStateChange,
                onReady: function () {
                    $('.ytp-expand-pause-overlay .ytp-pause-overlay').css(
                        'display',
                        'none'
                    );
                    $('.video-thumb').click(function () {
                        console.log('clicked');
                        var $this = $(this);
                        if (!$this.hasClass('active')) {
                            player.loadVideoById($this.attr('data-video'));
                            $('.video-thumb').removeClass('active');
                            $this.addClass('active');
                        }
                    });
                },
            },
        });
        function onPlayerStateChange(e) {
            console.log('state');
            if (e.data == YT.PlayerState.ENDED) {
                document.getElementById('playerWrap').classList.add('shown');
            }
        }
        document.getElementById('playerWrap').addEventListener('click', function () {
            player.seekTo(0);
            document.getElementById('playerWrap').classList.remove('shown');
        });
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
</body>
</html>
