<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
    <title>Admin | Notification</title>
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
                                Admin: <b>Adding Notification</b>
                            </h3>
                            <p class="category">Thêm mới thông báo</p>
                        </div>
                        <div class="col-md-4">
                            <a href="<c:url value='/admin/khoa-hoc/quan-ly/notification' />" style="float: right;">
                                <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Notification</b></button>
                            </a>
                        </div>
                    </div>
                    <div class="content">
                        <c:if test="${not empty error}">
                            <br><font color="red">${ error }</font>
                        </c:if>
                        <div class="row">
                            <div class="col-md-12">

                                <c:url value="/admin/khoa-hoc/quan-ly/saveNotification" var="saveSlideshow" />
                                <form:form action="${saveSlideshow}" method="POST" modelAttribute="notifi">
                                    <div class="col-md-12" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>Tiêu đề: </td>
                                                <td class="pt-4" colspan="2">
                                                    <form:input path="title" class="form-control" required="required"></form:input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Nội dung: </td>
                                                <td class="pt-4" colspan="2">
                                                    <form:textarea path="content" class="form-control" rows="4"  required="required"></form:textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Người tạo: </td>
                                                <td>
                                                    <form:input path="create_by" value="${ username }" class="form-control" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="center">
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <button type="submit" class="btn btn-success" id="submitbtn" style="display: initial">
                                                        Thêm thông báo
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
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
</body>