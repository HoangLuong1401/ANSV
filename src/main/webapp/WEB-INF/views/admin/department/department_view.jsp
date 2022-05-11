<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Admin | Department</title>

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
                                    Admin: <b>Ban (${department.size()})</b>
                                </h3>
                                <p class="category">Quản trị ban<br>${ statusLogin }</p>
                            </div>
                            <div class="col-md-3">
                                <c:url value="/admin/khoa-hoc/quan-ly/ban/save" var="urlSave" />
                                <c:url value="/admin/khoa-hoc/quan-ly/ban/update" var="urlUpdate" />
                                <c:url value="/admin/khoa-hoc/quan-ly/ban/delete" var="urlDelete" />

                                <a href="${urlSave}" style="float: right;">
                                    <button type="button" class="btn btn-primary btn-fill btn-wd"><b>Add Department</b></button>
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
                                            <th>Tên Ban</th>
                                            <th>Tên Đầy Đủ</th>
                                            <th>Người Tạo</th>
                                            <th>Ngày Tạo</th>
                                            <th style="width: 82px;" class="text-center">Sửa</th>
                                            <th style="width: 82px;" class="text-center">Xóa</th>
                                        </tr>
                                        <c:if test="${not empty department}">
                                            <c:forEach var="dep" items="${department}">
                                                <tr style="border: 1px black solid">
                                                    <td>${dep.name}</td>
                                                    <td>${dep.full_name}</td>

                                                    <td>${dep.create_by}</td>
                                                    <td>${dep.create_date}</td>
                                                    <c:if test="${username eq dep.create_by}">
                                                        <td>
                                                            <button type="button" onclick="return editDepartment(${dep.id})" class="btn btn-warning btn-fill btn-wd" style="min-width: 58px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;"
                                                                    onclick="return deleteDepartment(${dep.id},${dep.courseList.size()})">
                                                                <b>Delete</b>
                                                            </button>
                                                        </td>
                                                    </c:if>

                                                    <c:if test="${username ne dep.create_by}">
                                                        <td>
                                                            <button type="button" onclick="return editDepartment(${dep.id})" class="btn btn-warning btn-fill btn-wd" disabled style="min-width: 58px;">
                                                                <b>Edit</b>
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-danger btn-fill btn-wd" style="min-width: 74px;" disabled
                                                                    onclick="return deleteDepartment(${dep.id},${dep.courseList.size()})">
                                                                <b>Delete</b>
                                                            </button>
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
    function deleteDepartment(id, lengh) {
        var string = 'Dữ liệu đã xoá sẽ không thể hoàn tác ! \n';
        if(lengh != 0){
            string += 'Dữ liệu bị xóa liên quan đến ' + lengh + ' khóa học!';
        }
        swal({
            title: 'Bạn chắc chứ?',
            text: string,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xóa!',
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

    function editDepartment(id) {
        setTimeout(function () {
            window.location.href = '${urlUpdate}/'+id;
        }, 100);

    }

</script>

</body>
