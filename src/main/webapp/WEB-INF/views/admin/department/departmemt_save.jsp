<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>Admin | Department</title>
</head>
<body>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

<link href="<c:url value="/assets/admin/css/admin_upload_file.css" />" rel="stylesheet">

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="col-md-8">
                            <h3 class="title">
                                Admin: <b>Adding Department</b>
                            </h3>
                            <p class="category">Thêm một ban cho khóa học</p>
                        </div>
                        <div class="col-md-4">
                            <a href="<c:url value='/admin/khoa-hoc/quan-ly/ban' />" style="float: right;">
                                <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Department</b></button>
                            </a>
                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <c:url value="/admin/khoa-hoc/quan-ly/ban/insert" var="saveDepartment" />
                                <form:form action="${saveDepartment}" method="POST" modelAttribute="department" id="form_Department">
                                    <div class="col-md-7" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>Tên: </td>
                                                <td><form:input path="name" class="form-control" required="required"/></td>
                                            </tr>
                                            <tr>
                                                <td>Tên Đầy Đủ: </td>
                                                <td><form:input path="full_name" class="form-control" required="required"/></td>
                                            </tr>
                                            <tr>
                                                <td>Người Tạo: </td>
                                                <td><form:input path="create_by" class="form-control" value="${ username }" readonly="true" /></td>
                                            </tr>

                                        </table>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="container-upload-file center" style="background: none">
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12" style="text-align: -webkit-center">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <input type="submit" value="Thêm Ban" class="btn btn-success" style="display: block">
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>