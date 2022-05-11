<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Admin | Slideshow</title>
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
                        <div class="row">
                            <div class="col-md-9">
                                <h3 class="title">
                                    Admin: <b>Updating Slideshow</b>
                                </h3>
                                <p class="category">Cập nhật trình diễn slide</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value='/admin/web/quan-ly/slideshow' var="listSlideshow" />
                                <a href="${listSlideshow}" style="float: right;">
                                    <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Slideshow</b></button>
                                </a>
                            </div>
                        </div>


                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <c:url value="/admin/web/quan-ly/updateSlideshow?${_csrf.parameterName}=${_csrf.token}" var="updateSlideshow" />
                                <form:form action="${updateSlideshow}" method="POST" modelAttribute="slideshow" enctype="multipart/form-data">

                                    <div class="col-md-7" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>Mã: </td>
                                                <td>
                                                    <form:input path="id" class="form-control" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hình ảnh: </td>
                                                <td>
                                                    <form:input path="img" class="form-control" id="img_name" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Caption: </td>
                                                <td><form:input path="caption" class="form-control" required="required" /></td>
                                            </tr>
                                            <tr>
                                                <td>Content: </td>
                                                <td><form:input path="content" class="form-control" required="required" /></td>
                                            </tr>
                                            <tr>
                                                <td>Url: </td>
                                                <td><form:input path="url" class="form-control" required="required" /></td>
                                            </tr>
                                            <tr>
                                                <td>Updated by: </td>
                                                <td>
                                                    <form:input path="updated_by" value="${ display_name }" class="form-control" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-md-5">
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
                                                    <input type="submit" value="Đăng bài!" class="btn btn-primary" id="submitbtn">
                                                    <button type="button" class="btn btn-default" disabled="disabled" id="fakebtn">
                                                        Đăng bài! <i class="fa fa-minus-circle"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form:form>
                            </div>
                            <div class="col-md-6 col-md-offset-1">
                                <div id="worldMap" style="height: 300px;"></div>
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
<script src="<c:url value="/assets/admin/js/admin_upload_file.js" />"></script>

</body>