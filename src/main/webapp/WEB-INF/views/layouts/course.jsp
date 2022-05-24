<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<head>
    <title><dec:title default="Master-Layout" /></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/bootstrap.min.css"/>" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/formtest.css"/>" />
    <link href="<c:url value="/assets/user/img/logo/logo_ansv_big_new-removebg-preview.png" />" rel="icon">
    <link href="<c:url value="/assets/user/img/logo_ansv.png" />" rel="apple-touch-icon">

    <style>
        #myBtn {
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            left: 30px; /* Place the button 30px from the right */
            z-index: 1; /* Make sure it does not overlap */
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
<body style="background: lightblue;">
<div id="app">
    <%@include file="/WEB-INF/views/layouts/course/header.jsp"%>

    <dec:body/>

    <c:if test="${show == 1}">
        <%@include file="/WEB-INF/views/layouts/course/footer.jsp"%>
    </c:if>
</div>

<button id="myBtn" class="search-switch">
    <a href="#" class="search-switch btn"><i class="fas fa-search"></i></a>
</button>

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="fa fa-times"></i></div>
        <form class="search-model-form" >
            <input type="text" id="search-input" placeholder="Search here....." onchange="doSearch()">
            <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}" id="token" />
            <div class="btn" id="search_button" onclick="goSearch()" style="margin: 0;"><i class="fas fa-search"></i></div>

            <div>
                <p style="color: white" id="out-search"></p>
            </div>
        </form>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

    jQuery(document).ready(
        function($) {
            $("#search_button").hide();
        }
    );

    function doRead(id){
        jQuery(document).ready(
            function($) {
                $.ajax({type : "GET",
                    url : "<c:url value="/user/khoa-hoc/processNotifications"/>",
                    data : {id:id},
                    success : function(e) {
                        //css
                        $("#"+id).css("opacity","0.6");
                        $("div > div > div","#"+id).css("color","#333");
                    },
                    error : function (error) {
                        alert( error );
                    }});
            });
    }

    <c:url value="/user/khoa-hoc/search/" var="url_search" />
    function doSearch(){
        jQuery(document).ready(
            function($) {
                var query = $("#search-input").val();

                if(query.length >=2){
                    $.ajax({
                        type : "GET",
                        url: "${url_search}",
                        method: 'GET',
                        data: {query:query},
                        success: function(data){
                            document.getElementById("out-search").innerHTML = "Kết quả tìm kiếm khóa học: " + data;
                            $("#search_button").show();
                            if(data == 0){
                                $("#search_button").hide();
                            }
                        }
                    });
                }else {
                    $("#search_button").hide();
                }
            }
        );
    }


    function goSearch(){
        jQuery(document).ready(
            function($) {
                var query = $("#search-input").val();
                location.href = '${url_search}'+query;
            }
        );
    }

    jQuery(document).ready(
        function ($) {
            $('.search-switch').on('click', function () {
                $('.search-model').fadeIn(400);
            });

            $('.search-close-switch').on('click', function () {
                $('.search-model').fadeOut(400, function () {
                    $('#search-input').val('');
                });
            });
        });
    // Search model
    // Search model

</script>

</body>
