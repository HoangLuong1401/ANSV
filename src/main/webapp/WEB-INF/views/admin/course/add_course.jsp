<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <title>Admin | Course</title>
</head>
<body>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

<style>
    /*just bg and body style*/
    .container-upload-file {
        background-color: #1e2832;
        padding-bottom: 20px;
        margin-top: 10px;
        border-radius: 5px;
    }
    .center {
        text-align: center;
    }
    .btn-container {
        background: #fff;
        border-radius: 5px;
        padding-bottom: 20px;
        margin-bottom: 20px;
    }
    .white {
        color: white;
    }
    .imgupload {
        color: #1e2832;
        padding-top: 20px;
        font-size: 7em;
    }
    #namefile {
        color: black;
    }
    .btn-primary {
        border-color: #ff3f3f !important;
        color: #ffffff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        background-color: #ff3f3f !important;
        border-color: #ff3f3f !important;
    }

    /*these two are set to not display at start*/
    .imgupload.ok {
        display: none;
        color: green;
    }
    .imgupload.stop {
        display: none;
        color: red;
    }

    /*this sets the actual file input to overlay our button*/
    #fileup {
        opacity: 0;
        -moz-opacity: 0;
        filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
        width: 200px;
        cursor: pointer;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        bottom: 40px;
        height: 50px;
    }

    /*switch between input and not active input*/
    #submitbtn {
        padding: 5px 50px;
        display: none;
    }
    #fakebtn {
        padding: 5px 40px;
    }

    textarea {
        /* resize: none; */
        resize: vertical; /* user can resize vertically, but width is fixed */
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="col-md-8">
                            <h3 class="title">
                                Admin: <b>Adding Course</b>
                            </h3>
                            <p class="category">Thêm mới khóa học</p>
                        </div>
                        <div class="col-md-4">
                            <a href="<c:url value='/admin/khoa-hoc/quan-ly/course' />" style="float: right;">
                                <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Course</b></button>
                            </a>
                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <c:url value="/admin/khoa-hoc/quan-ly/saveCourse?${_csrf.parameterName}=${_csrf.token}" var="saveCourse" />
                                <form:form action="${saveCourse}" method="POST" modelAttribute="course" enctype="multipart/form-data">
                                    <div class="col-md-7" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>Tên khóa học: </td>
                                                <td><form:input id="name_course" path="name" class="form-control" required="required" onchange="check_data_course()" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ban: </td>
                                                <td>
                                                    <form:select path="id_depenment" class="form-control">
                                                        <form:option value="0">Chọn ban ...</form:option>
                                                        <c:forEach var="item" items="${ department }" varStatus="index">
                                                            <form:option value="${item.id}">${item.name}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Thể loại: </td>
                                                <td>
                                                    <form:select path="id_type" class="form-control">
                                                        <form:option value="0">Thể loại bài giảng ...</form:option>
                                                        <c:forEach var="item" items="${ type_course }" varStatus="index">
                                                            <form:option value="${item.id}">${item.name_tpye}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Content: </td>
                                                <td class="pt-4" colspan="2">
                                                    <form:textarea path="description" required="required" rows="4" cols="61"></form:textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Updated by: </td>
                                                <td>
                                                    <form:input path="create_by" value="${ username }" class="form-control" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="center">
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <button type="submit" class="btn btn-success"  id="submitbtn" style="display: initial">
                                                        Thêm khóa học
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <hr style="width: 100%;color: black">
                            <div class="col-md-12" style="padding-top: 1%;padding-left: 0px; padding-right: 5px;">
                                <c:url value="/admin/khoa-hoc/quan-ly/type/save" var="saveType" />
                                <form:form action="${saveType}" method="POST" modelAttribute="typeC">
                                    <table class="table table-striped">
                                        <tr>
                                            <td>
                                                Thêm thể loại video
                                            </td>
                                            <td><form:input id="idT" path="id" class="form-control" readonly="true" /></td>
                                        </tr>
                                        <tr>
                                            <td>Tên thể loại: </td>
                                            <td><form:input id="nameT" path="name_tpye" class="form-control" required="required"  /></td>
                                        </tr>

                                        <tr>
                                            <td>Mô tả: </td>
                                            <td>
                                                <form:input id="descriptoinT"  path="description_type"  class="form-control"  required="required" />
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="submit" value="Thêm thể loại" class="btn btn-success" id="submitType">
                                    <input type="submit" value="Clear" class="btn btn-success" id="clearT">
                                </form:form>
                            </div>
                            <div class="col-md-12" style="padding-top: 1%;padding-left: 0px; padding-right: 5px;">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Tên</th>
                                        <th>Mô tả</th>
                                        <td>Sửa</td>
                                        <th style="width: 82px;" class="text-center">Xóa</th>

                                    </tr>
                                    <c:if test="${not empty type_course}">
                                        <c:forEach var="v" items="${type_course}" varStatus="index">
                                            <tr style="border: 1px black solid" id="${v.id}">
                                                <td class="idT" style="display: none">${v.id}</td>
                                                <td class="name">${v.name_tpye}</td>
                                                <td class="descriptionT">${v.description_type}</td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-fill btn-wd editType" style="min-width: 74px;">
                                                        <b>Edit</b>
                                                    </button>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;" onclick="delete_a_type(${v.id})">
                                                        <b>Delete</b>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<c:url value='/assets/ckeditor/handmade-ckeditor.js' />"></script>

<script>

    jQuery(document).ready(
        function($) {
            $("#submitbtn").hide();
            $("#idT").hide();
            $("#clearT").hide();
        }
    );

    jQuery(document).ready(
        function($) {
            $("#clearT").click(function () {
                $("#idT").val(0);
                $("#idT").hide();

                $("#nameT").val("");
                $("#descriptoinT").val("");

                $("#submitType").attr('value', 'Thêm thể loại');

            });
        }
    );


    jQuery(document).ready(
        function($) {
            $(".editType").click(function() {
                var $row = $(this).closest("tr");    // Find the row
                var $text = $row.find(".name").text(); // Find the text
                var $text2 = $row.find(".descriptionT").text(); // Find the text
                var $text3 = $row.find(".idT").text(); // Find the text

                $("#nameT").val($text);
                $("#descriptoinT").val($text2);

                $("#idT").show();
                $("#idT").val($text3);
                // Let's test it out
                $("#submitType").attr('value', 'Edit');
                $("#clearT").show();
            });
        }
    );


    <c:url value="/admin/khoa-hoc/quan-ly/search" var="url_search" />
    function check_data_course(){
        jQuery(document).ready(
            function($) {
                var query = $("#name_course").val();
                if(query.length >=2){
                    $.ajax({
                        type : "GET",
                        url: "${url_search}",
                        method: 'GET',
                        data: {query:query},
                        success: function(data){
                            $("#submitbtn").hide();
                            if(data == 0){
                                $("#submitbtn").show();
                            }
                        }
                    });
                }else {
                    $("#submitbtn").hide();
                }
            }
        );
    }


    <c:url value="/admin/khoa-hoc/quan-ly/type/delete" var="deleteType" />
    function delete_a_type(id){
        jQuery(document).ready(
            function($) {
                    $.ajax({
                        type : "GET",
                        url: "${deleteType}",
                        method: 'GET',
                        data: {id:id},
                        success: function(data){
                            if(data == "DELETE SUCCESSFULL"){
                                $('#'+id).remove();
                                alert(data)

                            }else {
                                alert("Không thể xóa thể loại này,\n thể loại này có thể liên kết đến " +data+
                                    " khóa học")
                            }
                        }
                    });

            }
        );
    }

</script>
</body>