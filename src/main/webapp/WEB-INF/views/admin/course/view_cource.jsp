<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Admin | Course</title>

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
                                    Admin: <b>Khóa học (${course.size()})</b>
                                </h3>
                                <p class="category">Quản trị khóa học</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value="/admin/khoa-hoc/quan-ly/course/detail" var="urlDetails" />
                                <c:url value="/admin/khoa-hoc/quan-ly/course/save" var="urlSave" />
                                <c:url value="/admin/khoa-hoc/quan-ly/course/update" var="urlUpdate" />
                                <c:url value="/admin/khoa-hoc/quan-ly/course/delete" var="urlDelete" />
                                <a href="${urlSave}" style="float: right;">
                                    <button type="button" class="btn btn-primary btn-fill btn-wd"><b>Thêm khoa học</b></button>
                                </a>
                                <a href="<c:url value='/user/khoa-hoc/tat-ca' />" target="_blank">
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
                                            <th width="20%">Tiêu đề</th>
                                            <th>Hình ảnh</th>
                                            <th>Thể loại</th>
                                            <th>Người đăng</th>
                                            <td align="center" style="width: 105px;"><b>Thao tác</b></td>
                                        </tr>
                                        <c:forEach items="${course}" var="c">
                                            <tr style="border: 1px black solid">
                                                <td>
                                                    <a href="${urlDetails}/${c.id}" style="color: black">${c.name}</a>
                                                </td>
                                                <td>
                                                    <a href="${urlDetails}/${c.id}">
                                                        <img src="<c:url value="/assets/course/img/course/${c.url_img}"/>" width="150px" />
                                                    </a>

                                                </td>
                                                <td>
                                                    <c:forEach items="${type_course}" var="type">
                                                        <c:if test="${type.id == c.id_type}">
                                                            ${type.name_tpye}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                        ${c.create_by}<hr style="margin: 5px 0 5px 0;">
                                                    <i>${c.create_date}</i>
                                                </td>
                                                <c:if test="${username eq c.create_by}">
                                                    <td style="padding-left: 10px;">
                                                        <a href="${urlUpdate}/${c.id}">
                                                            <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 80px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </a>
                                                        <c:if test="${ course.size() > 5 }">
                                                            <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 80px; margin-top: 3px;"
                                                                    onclick="return deleteNews(${c.id})">
                                                                <b>Delete</b>
                                                            </button>
                                                        </c:if>
                                                    </td>
                                                </c:if>
                                                <c:if test="${username ne c.create_by}">
                                                    <td style="padding-left: 10px;">
                                                        <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 80px;" disabled>
                                                            <b>Edit</b>
                                                        </button>
                                                        </a>
                                                        <c:if test="${ course.size() > 5 }">
                                                            <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 80px; margin-top: 3px;" disabled
                                                                    onclick="return deleteNews(${c.id})">
                                                                <b>Delete</b>
                                                            </button>
                                                        </c:if>
                                                    </td>
                                                </c:if>

                                            </tr>
                                        </c:forEach>
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
