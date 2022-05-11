<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Admin | Course</title>

<body>
<style>
    .news_pt {
        padding-top: 2%;
    }

    .news_image {
        display: block;
        margin-left: auto;
        margin-right: auto;
        max-width: 100%;
    }

    /* Style the tab */
    .tab {
        float: left;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
        width: 18%;


    }

    /* Style the buttons inside the tab */
    .tab button {
        display: block;
        background-color: inherit;
        color: black;
        padding: 22px 16px;
        width: 100%;
        border: none;
        outline: none;
        text-align: left;
        cursor: pointer;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Create an active/current "tab button" class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        float: left;
        padding: 0px 12px;
        border: 1px solid #ccc;
        width: 82%;
        border-left: none;
        height: auto;
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-8">
                                <h3 class="title">
                                    Admin: <b>Chi tiết khóa học</b>
                                </h3>
                                <p class="category">Xem chi tiết khóa học</p>
                            </div>
                            <div class="col-md-4">
                                <a href="<c:url value='/admin/khoa-hoc/quan-ly/course' />" style="float: right;">
                                    <button type="button" class="btn btn-success btn-fill btn-wd"><b>List Course</b></button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="content"><hr style="margin-top: 0; margin-bottom: -1%;">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <div class="row news_pt">
                                    <div class="col-md-12" style="font-size: 20px;">
                                        <b>
                                            Thể loại:
                                            <font color="#FF6600"><i>
                                                <c:forEach items="${type_course}" var="type">
                                                    <c:if test="${type.id == course.id_type}">
                                                        ${type.name_tpye}
                                                    </c:if>
                                                </c:forEach>
                                            </i></font>
                                        </b>
                                        <br>
                                        <b>
                                            Ban:
                                            <font color="#FF6600"><i>
                                                <c:forEach items="${department}" var="dep">
                                                    <c:if test="${dep.id == course.id_depenment}">
                                                        ${dep.name} - ${dep.full_name}
                                                    </c:if>
                                                </c:forEach>
                                            </i></font>
                                        </b>
                                        <hr style="margin-top: 1%; margin-bottom: -1%; height: 2px; background-color: black;">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <h3><b>${course.name}</b></h3>
                                    </div>
                                </div>

                                <div class="row news_pt">
                                    <div class="col-md-12">
                                        ${course.description}
                                    </div>
                                </div>

                                <div class="row news_pt">
                                    <div class="col-md-12">
                                        Số lượng video:
                                        <c:if test="${not empty videos}">
                                            ${videos.size()}
                                        </c:if>
                                        <c:if test="${ empty videos }">
                                            Hiện tại khóa học chưa có video nào
                                            <br>
                                            Hãy thêm video ở phía dưới
                                        </c:if>
                                    </div>
                                    <div class="col-md-12">
                                        Số lượng tài liệu:
                                        <c:if test="${not empty docs}">
                                            ${docs.size()}
                                        </c:if>
                                        <c:if test="${ empty docs }">
                                            Hiện tại khóa học chưa có tài liệu nào
                                            <br>
                                            Hãy thêm tài liệu ở phía dưới
                                        </c:if>
                                    </div>
                                </div>

                                <div class="row news_pt">
                                    <div class="col-md-8">
                                    </div>
                                    <div class="col-md-2" style="display: flex; justify-content: flex-end">Người đăng:</div>
                                    <div class="col-md-2">
                                        <i>
                                            ${course.create_by}<hr style="margin: 0;">${course.create_date}
                                        </i>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row center">
                            <div class="tab">
                                <button class="tablinks" onclick="openBar(event, 'video')" id="defaultOpen">Video</button>
                                <button class="tablinks" onclick="openBar(event, 'doc')">Document</button>
                            </div>
                            <div id="video" class="tabcontent">
                                <c:url value="/admin/khoa-hoc/quan-ly/video/delete/${course.id}" var="urlDelete" />
                                <c:url value="/admin/khoa-hoc/quan-ly/video/save_${course.id}" var="saveVideo" />
                                <div class="col-md-12" style="padding-top: 1%;padding-left: 0px; padding-right: 5px;">
                                    <form:form action="${saveVideo}" method="POST" modelAttribute="video">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>
                                                    Thêm Video
                                                </td>
                                                <td>
                                                    (*) Ex: https://www.youtube.com/watch?v=<mark style="color: red; background-color: yellow">L6joGUdc6y4</mark>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tên video: </td>
                                                <td><form:input path="name" class="form-control" required="required"  /></td>
                                            </tr>

                                            <tr>
                                                <td>Id video: </td>
                                                <td>
                                                    <form:input path="url"  class="form-control"  required="required" />
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="submit" value="Thêm Video" class="btn btn-primary" id="submitbtn">
                                    </form:form>
                                </div>
                                <div class="col-md-12" style="padding-top: 1%;padding-left: 0px; padding-right: 5px;">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Tên</th>
                                            <th>Link</th>
                                            <th style="width: 82px;" class="text-center">Xem</th>
                                            <th style="width: 82px;" class="text-center">Xóa</th>

                                        </tr>
                                        <c:if test="${not empty videos}">
                                            <c:forEach var="v" items="${videos}" varStatus="index">
                                                <tr style="border: 1px black solid">
                                                    <td>${v.name}</td>
                                                    <td>${v.url}</td>
                                                    <td>
                                                        <a target="_blank" href="<c:url value='/user/khoa-hoc/${course.id}' />" style="float: right;">
                                                            <button type="button" class="btn btn-info btn-fill" style="min-width: 74px;">
                                                                <b>View</b>
                                                            </button>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;"
                                                                onclick="window.location.href = '${urlDelete}_${v.id}'">
                                                            <b>Delete</b>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </table>
                                </div>
                            </div>

                            <div id="doc" class="tabcontent">
                                <div class="col-md-12" style="padding-top: 1%;padding-left: 0px">
                                    <c:url value="/admin/khoa-hoc/quan-ly/doc/delete/${course.id}" var="deleteDoc" />
                                    <c:url value="/admin/khoa-hoc/quan-ly/doc/save_${course.id}" var="saveDoc" />
                                    <form:form action="${saveDoc}" method="POST" modelAttribute="doc">
                                        <table class="table table-striped">
                                            <tr>
                                                <td>
                                                    Thêm Document
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tên doc: </td>
                                                <td><form:input path="name_doc" class="form-control" required="required"  /></td>
                                            </tr>

                                            <tr>
                                                <td>url: </td>
                                                <td>
                                                    <form:input path="url_doc"  class="form-control"  required="required" />
                                                </td>
                                            </tr>
                                        </table>
                                        <input type="submit" value="Thêm tài liệu" class="btn btn-primary" id="submitbtn">
                                    </form:form>
                                </div>
                                <div class="col-md-12" style="padding-top: 1%;padding-left: 10px;">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Tên</th>
                                            <th>Link</th>
                                            <th style="width: 82px;" class="text-center">Xem</th>
                                            <th style="width: 82px;" class="text-center">Xóa</th>

                                        </tr>
                                        <c:if test="${not empty docs}">
                                            <c:forEach var="v" items="${docs}">
                                                <tr style="border: 1px black solid">
                                                    <td style="word-break: break-word;">${v.name_doc}</td>
                                                    <td style="word-break: break-word;">${v.url_doc}</td>
                                                    <td>
                                                        <a target="_blank" href="<c:url value='/user/khoa-hoc/${course.id}' />" style="float: right;">
                                                            <button type="button" class="btn btn-info btn-fill" style="min-width: 74px;">
                                                                <b>View</b>
                                                            </button>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;"
                                                                onclick="window.location.href = '${deleteDoc}_${v.id_doc}'">
                                                            <b>Delete</b>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty docs}">
                                            Hiện tại chưa có Tài liệu nào !!!
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
</div>

<script>
    function openBar(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();

</script>
</body>