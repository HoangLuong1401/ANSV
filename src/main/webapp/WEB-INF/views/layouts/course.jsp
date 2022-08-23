<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<head>
    <title><dec:title default="Master-Layout" /></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <link rel="stylesheet" href="<c:url value="/assets/course/style/bootstrap.min.css"/>" />
    <link rel="stylesheet" href="<c:url value="/assets/course/style/search.css"/>" />
    <link href="<c:url value="/assets/user/img/logo/logo_ansv_big_new-removebg-preview.png" />" rel="icon">
    <link href="<c:url value="/assets/user/img/logo_ansv.png" />" rel="apple-touch-icon">
    <link rel="stylesheet" href="<c:url value="/assets/video/css/main.css"/>" />
    <script src="<c:url value="/assets/course/js/jQuery-3.6.0.min.js"/>" charset="utf-8"></script>

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
            background: linear-gradient(to right bottom, #6a3079, #485daa, #029fb8, #02b18e, #32b47c);
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
            margin: 20px auto;
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
<div id="app">
    <%@include file="/WEB-INF/views/layouts/course/header.jsp"%>

    <dec:body/>

    <%@include file="/WEB-INF/views/layouts/course/footer.jsp"%>

</div>

<button id="myBtn" class="search-switch">
    <a href="#" class="search-switch btn"><i class="fas fa-search"></i></a>
</button>

<!-- Search model Begin -->
<div class="search-model">
    <form accept-charset="utf-8">
    <div class="search-close-switch"><i class="fa fa-times"></i></div>
    <div class="wrapper">
        <div class="search-input">
            <a href="" target="_blank" hidden></a>
            <input class="input_search" type="text" placeholder="Type to search..">
            <div class="icon"><i class="fas fa-search"></i></div>
            <div class="autocom-box"></div>
        </div>
    </div>
    </form>
</div>
<script src="<c:url value="/assets/course/js/search.js"/>" charset="utf-8"></script>
<script>
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
</script>

</body>
