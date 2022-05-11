<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>Admin | HighLight</title>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-10">
                                <h3 class="title">
                                    Admin: <b>Thông tin nổi bật (${listHighlight.size()})</b>
                                </h3>
                                <p class="category">Quản trị mục nổi bật</p>
                            </div>
                            <div class="col-md-2">
                                <c:url value="/admin/web/quan-ly/highlight/update" var="urlUpdate" />
                                <a href="<c:url value='/trang-chu#muc-noi-bat' />" target="_blank" style="float: right;">
                                    <button type="button" class="btn btn-success btn-fill btn-wd" style="min-width: 64px;">
                                        <b>Hiển thị</b>
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Mã</th>
                                            <th>Hình ảnh</th>
                                            <th>Chú thích</th>
                                            <th>Tiêu đề</th>
                                            <th>Tiêu đề phụ</th>
                                            <th>Nội dung</th>
                                            <th>Url</th>
                                            <th>Người tạo</th>
                                            <th style="width: 82px;" class="text-center">Sửa</th>

                                        </tr>
                                        <c:if test="${not empty listHighlight}">
                                            <c:forEach var="highlight" items="${ listHighlight }" varStatus="index">
                                                <tr style="border: 1px black solid">
                                                    <td>${ highlight.id }</td>
                                                    <td>
                                                        <img src="<c:url value='/assets/user/img/noi_bat/${highlight.img}' />" width="130px" />
                                                    </td>
                                                    <td>${highlight.header_title}</td>
                                                    <td>${highlight.title}</td>
                                                    <td>${highlight.sub_title}</td>
                                                    <td>${highlight.content}</td>
                                                    <td>${highlight.url}</td>
                                                    <td>
                                                            ${highlight.updated_by}<hr style="margin: 5px 0 5px 0;">
                                                        <i>${highlight.updated_at}</i>
                                                    </td>
                                                    <td>
                                                        <a href="${urlUpdate}/${highlight.id}" style="margin-left: 10px;">
                                                            <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 58px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </a>
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
</div>
</body>