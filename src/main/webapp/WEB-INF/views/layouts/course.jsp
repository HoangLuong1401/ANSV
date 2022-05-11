<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<html>
<dec:head>
</dec:head>
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
            <div class="btn" id="search_button" onclick="goSearch()"><i class="fas fa-search"></i></div>

            <div>
                <p style="color: white" id="out-search"></p>
            </div>
        </form>

    </div>
</div>


</body>
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
</html>
