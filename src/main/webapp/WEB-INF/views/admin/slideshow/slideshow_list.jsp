<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<title>Admin | Slideshow</title>
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
                                    Admin: <b>Slideshow (${listSlideshow.size()})</b>
                                </h3>
                                <p class="category">Quản trị phần trình diễn slide<br>${ statusLogin }</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value="/admin/web/quan-ly/slideshow/save" var="urlSave" />
                                <c:url value="/admin/web/quan-ly/slideshow/update" var="urlUpdate" />
                                <c:url value="/admin/web/quan-ly/slideshow/delete" var="urlDelete" />
                                <c:if test="${ listSlideshow.size() < 4 }">
                                    <a href="${urlSave}" style="float: right;">
                                        <button type="button" class="btn btn-primary btn-fill btn-wd"><b>Add Slideshow</b></button>
                                    </a>
                                </c:if>
                                <a href="<c:url value='/trang-chu' />" target="_blank">
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
                                            <th>Caption</th>
                                            <th>Content</th>
                                            <th>Url</th>
                                            <th style="width: 82px;" class="text-center">Sửa</th>

                                            <c:if test="${ listSlideshow.size() > 3 }">
                                                <th style="width: 98px;" class="text-center">Xoá</th>
                                            </c:if>

                                        </tr>
                                        <c:if test="${not empty listSlideshow}">
                                            <c:forEach var="slideshow" items="${listSlideshow}" varStatus="index">
                                                <tr style="border: 1px black solid">
                                                    <td>${slideshow.id}</td>
                                                    <td>
                                                        <img src="<c:url value='/assets/user/img/slider/${slideshow.img}' />" width="150px" />
                                                    </td>
                                                    <td>
                                                        <c:if test="${ index.first }">
                                                            <img src="<c:url value='/assets/user/img/header/${slideshow.caption}' />" style="max-width: 100px;" />
                                                        </c:if>
                                                        <c:if test="${ not index.first }">
                                                            ${slideshow.caption}
                                                        </c:if>
                                                    </td>
                                                    <td>${slideshow.content}</td>
                                                    <td>${slideshow.url}</td>
                                                    <td>
                                                        <a href="${urlUpdate}/${slideshow.id}" style="margin-left: 10px;">
                                                            <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 58px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </a>
                                                    </td>

                                                    <c:if test="${ listSlideshow.size() > 3 }">
                                                        <td>
                                                            <c:if test="${ not index.first }">
                                                                <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;"
                                                                        onclick="return deleteSlideshow(${slideshow.id})">
                                                                    <b>Delete</b>
                                                                </button>
                                                            </c:if>
                                                        </td>
                                                    </c:if>

                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </table>
                                </div>
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
    function deleteSlideshow(id) {
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