<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Admin | News</title>
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
                                Admin: <b>Updating News</b>
                            </h3>
                            <p class="category">Chỉnh sửa nội dung tin tức</p>
                        </div>
                        <div class="col-md-4">
                            <a href="<c:url value='/admin/web/quan-ly/news' />" style="float: right;">
                                <button type="button" class="btn btn-success btn-fill btn-wd"><b>List News</b></button>
                            </a>
                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12" style="padding-top: 2%;">
                                <c:url value="/admin/web/quan-ly/updateNews?${_csrf.parameterName}=${_csrf.token}" var="updateNews" />
                                <form:form action="${updateNews}" method="POST" modelAttribute="news" enctype="multipart/form-data">

                                    <div class="col-md-8">
                                        <table class="table">
                                            <tr>
                                                <td class="pt-4" colspan="2">
                                                    <form:textarea path="title" class="form-control" rows="4" id="news_title" required="required"></form:textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <form:textarea path="summary" class="form-control" rows="4" id="news_summary" required="required"></form:textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <form:select path="news_type" class="form-control" id="select2">
                                                        <form:option value="0">Loại tin tức...</form:option>
                                                        <c:forEach var="item" items="${ listNews_type }" varStatus="index">
                                                            <form:option value="${item.id}">${item.name}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </td>
                                                <td style="width: 50%">
                                                    <form:input path="url" class="form-control" placeholder="Link đến bài viết chi tiết..." required="required" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-md-4">

                                        <div class="row">
                                            <div class="col-md-3" style="padding-top: 6px;">
                                                Mã bài viết:
                                            </div>
                                            <div class="col-md-9">
                                                <form:input path="id" class="form-control" readonly="true" required="required" />
                                            </div>
                                        </div>

                                        <form:input type="hidden" path="updated_by" value="${ display_name }" class="form-control" readonly="true" required="required" />
                                        <form:input path="img" class="form-control" id="img_name" placeholder="Hình ảnh..." readonly="true" required="required" />

                                        <div class="container-upload-file center">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h3 class="white"><b>Chọn ảnh trước khi đăng bài</b></h3>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-10 col-md-offset-1 center">
                                                    <div class="btn-container">
                                                        <!--the three icons: default, ok file (img), error file (not an img)-->
                                                        <h1 class="imgupload">
                                                            <i class="fas fa-image"></i>
                                                        </h1>
                                                        <h1 class="imgupload ok">
                                                            <i class="fa fa-check"></i>
                                                        </h1>
                                                        <h1 class="imgupload stop">
                                                            <i class="fa fa-times"></i>
                                                        </h1>
                                                        <!-- Định dạng file cho phép được upload -->
                                                        <p id="namefile">File cho phép! (png, jpg, jpeg)</p>
                                                        <!--our custom btn which which stays under the actual one-->
                                                        <button type="button" id="btnup" class="btn btn-primary btn-lg">
                                                            Chọn ảnh của bạn!
                                                        </button>
                                                        <!--this is the actual file input, is set with opacity=0 beacause we wanna see our custom one-->
                                                        <input type="file" value="" name="fileup" id="fileup">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <input type="submit" value="Đăng bài!" class="btn btn-primary" id="submitbtn" onclick="return validate_form()">
                                                    <button type="button" class="btn btn-default" disabled="disabled" id="fakebtn">
                                                        Đăng bài! <i class="fa fa-minus-circle"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="padding: 0 6px 0 23px;">
                                        <div class="col-md-12">
                                            <br><br>
                                            <form:textarea path="content" class="form-control" rows="10" id="news_content" required="required"></form:textarea>
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
<script src="<c:url value="/assets/admin/js/admin_upload_file.js" />"></script>
<script src="<c:url value='/assets/ckeditor/handmade-ckeditor.js' />"></script>

</body>
