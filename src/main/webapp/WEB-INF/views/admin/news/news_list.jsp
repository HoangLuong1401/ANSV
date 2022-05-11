<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<title>Admin | News</title>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-9">
                                <h3 class="title">
                                    Admin: <b>Tin tức (${listNews.size()})</b>
                                </h3>
                                <p class="category">Quản trị tin tức</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value="/admin/web/quan-ly/news/details" var="urlDetails" />
                                <c:url value="/admin/web/quan-ly/news/save" var="urlSave" />
                                <c:url value="/admin/web/quan-ly/news/update" var="urlUpdate" />
                                <c:url value="/admin/web/quan-ly/news/delete" var="urlDelete" />
                                <a href="${urlSave}" style="float: right;">
                                    <button type="button" class="btn btn-primary btn-fill btn-wd"><b>Add News</b></button>
                                </a>
                                <a href="<c:url value='/trang-chu#muc-tin-tuc' />" target="_blank">
                                    <button type="button" class="btn btn-success btn-fill btn-wd" style="min-width: 80px;">
                                        <b>View</b>
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
                                            <th>Tiêu đề</th>
                                            <th>Link</th>
                                            <th>Phân loại</th>
                                            <th>Người đăng</th>
                                            <td align="center" style="width: 105px;"><b>Thao tác</b></td>
                                        </tr>
                                        <c:if test="${not empty listNews}">
                                            <c:forEach var="news" items="${ listNews }" varStatus="index">
                                                <tr style="border: 1px black solid">
                                                    <td>${ news.id }</td>
                                                    <td>
                                                        <a href="${urlDetails}/${news.id}">
                                                            <img src="<c:url value='/assets/user/img/news/${news.img}' />" width="150px" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="${urlDetails}/${news.id}">${news.title}</a>
                                                    </td>
                                                    <td>${news.url}</td>
                                                    <td>
                                                            ${news.classify}
                                                    </td>
                                                    <td>
                                                            ${news.updated_by}<hr style="margin: 5px 0 5px 0;">
                                                        <i>${news.updated_at}</i>
                                                    </td>
                                                    <td style="padding-left: 10px;">
                                                        <a href="${urlUpdate}/${news.id}">
                                                            <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 80px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </a>
                                                        <c:if test="${ listNews.size() > 5 }">
                                                            <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 80px; margin-top: 3px;"
                                                                    onclick="return deleteNews(${news.id})">
                                                                <b>Delete</b>
                                                            </button>
                                                        </c:if>
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

<script>
    function deleteNews(id) {
        swal({
            title: 'Bạn chắc chứ?',
            text: 'Dữ liệu đã xoá sẽ không thể hoàn tác!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xử ló cho anh!',
            cancelButtonText: 'Để ló sống',
            confirmButtonClass: "btn btn-info btn-fill",
            cancelButtonClass: "btn btn-danger btn-fill",
            buttonsStyling: false
        }).then(function() {
            swal({
                title: 'Xoá thành công!',
                text: 'Dữ liệu bị xoá hoàn toàn.',
                type: 'success',
                /* showCancelButton: false, */
                showConfirmButton: false,
                buttonsStyling: true
            }).catch(swal.noop)

            setTimeout(function () {
                window.location.href = '${urlDelete}/'+id;
            }, 500);

        }, function(dismiss) {
            // dismiss can be 'overlay', 'cancel', 'close', 'esc', 'timer'
            if (dismiss === 'cancel') {
                swal({
                    title: 'Hoàn tác',
                    text: 'Dữ liệu được giữ lại!',
                    type: 'error',
                    confirmButtonClass: "btn btn-info btn-fill",
                    buttonsStyling: false
                }).catch(swal.noop)
            }
        });
    }
</script>
</body>