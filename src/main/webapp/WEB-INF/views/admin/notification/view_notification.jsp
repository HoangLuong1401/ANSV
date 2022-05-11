<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Admin | Notification</title>

<body>
<style>

    .text_de {
        position: relative;
        font-size: 14px;
        color: black;
        width: 508px; /* Could be anything you like. */
    }

    .text-concat_de {
        position: relative;
        display: inline-block;
        word-wrap: break-word;
        overflow: hidden;
        max-height: 1.7em; /* (Number of lines you want visible) * (line-height) */
        line-height: 1.2em;
        text-align:justify;
    }

    .text-concat_de:hover + .hide_text {
        display: block;
        font-size: 11px;
        /*visibility: hidden;*/
        width: 640px;
        color: whitesmoke;
        text-align: left;
        border-radius: 6px;
        padding: 5px 6px;
        left: 10%;
        position: absolute;
        z-index: 1;
        /* white-space: pre-wrap; */
        border: 2px solid;
        border-color: black;
        background-color: #5073e6;
    }

    .hide_text{
        display: none;
    }

</style>
<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-9">
                                <h3 class="title">
                                    Admin: <b>Thông báo (${notifi.size()})</b>
                                </h3>
                                <p class="category">Quản trị mục thông báo</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value="/admin/khoa-hoc/quan-ly/notification/save" var="urlSave" />
                                <c:url value="/admin/khoa-hoc/quan-ly/notification/update" var="urlUpdate" />
                                <c:url value="/admin/khoa-hoc/quan-ly/notification/delete" var="urlDelete" />
                                <a href="${urlSave}" style="float: right;">
                                    <button type="button" class="btn btn-primary btn-fill btn-wd"><b>Thêm thông báo</b></button>
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
                                            <th>Nội Dung</th>
                                            <th>Người Tạo</th>
                                            <th>Ngày Tạo</th>
                                            <td align="center" style="width: 105px;"><b>Thao tác</b></td>
                                        </tr>
                                        <c:forEach items="${notifi}" var="no">
                                            <tr style="border: 1px black solid">

                                                <td class="text_de" >
                                                    <div class="text-concat_de">
                                                            ${no.title}
                                                    </div>
                                                    <div class="hide_text">
                                                            ${no.content}
                                                    </div>
                                                </td>

                                                <td>${no.create_by}</td>
                                                <td>${no.create_date}</td>
                                                <c:if test="${username eq no.create_by}">

                                                    <td style="padding-left: 10px;">
                                                        <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 80px;"
                                                                onclick="return editNotification(${no.id})">
                                                            <b>Edit</b>
                                                        </button>
                                                        </a>
                                                        <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 80px; margin-top: 3px;"
                                                                onclick="return deleteNotification(${no.id})">
                                                            <b>Delete</b>
                                                        </button>
                                                    </td>

                                                </c:if>

                                                <c:if test="${username ne no.create_by}">

                                                    <td style="padding-left: 10px;">
                                                        <button type="button" class="btn btn-warning btn-fill btn-wd" style="min-width: 80px;" disabled>
                                                            <b>Edit</b>
                                                        </button>
                                                        </a>
                                                        <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 80px; margin-top: 3px;" disabled
                                                        <b>Delete</b>
                                                        </button>
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
    function deleteNotification(id) {
        swal({
            title: 'Bạn chắc chứ?',
            text: 'Dữ liệu đã xoá sẽ không thể hoàn tác!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Thực hiện xóa!!',
            cancelButtonText: 'Hoàn Tác',
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

    function editNotification(id) {
        setTimeout(function () {
            window.location.href = '${urlUpdate}/'+id;
        }, 100);
    }
</script>

</body>
