<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>Admin | Department</title>
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
                                    Admin: <b>Updating Department</b>
                                </h3>
                                <p class="category">Cập nhật Ban</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value='/admin/khoa-hoc/quan-ly/ban' var="listSlideshow" />
                                <a href="${listSlideshow}" style="float: right;">
                                    <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Department</b></button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <c:url value="/admin/khoa-hoc/quan-ly/update" var="updateDepartment" />
                                <form:form action="${updateDepartment}" method="POST" modelAttribute="department">
                                    <div class="col-md-7" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>Mã: </td>
                                                <td>
                                                    <form:input path="id" class="form-control" readonly="true" required="required" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tên: </td>
                                                <td><form:input path="name" class="form-control" required="required" id="input_name"/></td>
                                            </tr>
                                            <tr>
                                                <td>Tên Đầy Đủ: </td>
                                                <td><form:input path="full_name" class="form-control" required="required" id="input_full"/></td>
                                            </tr>
                                            <tr>
                                                <td>Người Tạo: </td>
                                                <td><form:input path="create_by" class="form-control" value="${username}" readonly="true" /></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="container-upload-file center" style="background: none">
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <input type="submit" value="UPDATE" class="btn btn-primary" id="submitbtn">
                                                    <button type="button" class="btn btn-default" disabled="disabled" id="fakebtn">
                                                        Thêm Ban
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

<script>
    const input1 = document.querySelector("#input_name");
    const input2 = document.querySelector("#input_full");

    function check(taget) {
        if (input1.value.length === 0 || input2.value.length === 0) {
            $("#submitbtn").hide();
            $("#fakebtn").show();
        } else {
            $("#submitbtn").show();
            $("#fakebtn").hide();
        }
    };

    input1.addEventListener("change",check);
    input2.addEventListener("change",check);

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<c:url value="/assets/admin/js/admin_upload_file.js" />"></script>

</body>