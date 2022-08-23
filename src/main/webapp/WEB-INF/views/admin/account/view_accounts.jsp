<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                    Admin: <b>Thành viên(${users.size()})</b>
                                </h3>
                                <p class="category">Quản trị thành viên</p>
                            </div>

                        </div>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tr>
                                            <th width="20%">Tên</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <td align="center" style="width: 105px;"><b>Thao tác</b></td>
                                        </tr>
                                        <c:forEach items="${users}" var="c">
                                            <tr style="border: 1px black solid">
                                                <td>
                                                    <p>${c.display_name}</p>
                                                </td>
                                                <td>
                                                    <p>${c.username}</p>
                                                </td>
                                                <td>
                                                    <select class="form-control role_multi" id="${c.id}" onchange="return changeData(${c.id})" >
                                                        <c:forEach var="item" items="${ role }" varStatus="index">
                                                            <option value="${item.id}" ${item.id == c.role ? 'selected="selected"' : ''}>${item.role_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                   <%--<p>${c.}</p>--%>
                                                </td>
                                                <td>
                                                    <c:if test="${c.enabled == 1}">
                                                        <p style="color: green">Online</p>
                                                    </c:if>
                                                    <c:if test="${c.enabled == 0}">
                                                        <p style="color: red">Lock</p>
                                                    </c:if>
                                                </td>
                                                <c:url value="/admin/khoa-hoc/quan-ly/user/look-user/${c.username}_${c.enabled}" var="urlChange" />
                                                <td style="padding-left: 10px;display: grid;">
                                                <c:if test="${c.enabled == 1}">
                                                        <a class="btn btn-danger btn-fill btn-wd" href="${urlChange}">
                                                            <b style="color: firebrick">Lock Account</b>
                                                        </a>
                                                </c:if>
                                                <c:if test="${c.enabled == 0}">

                                                        <a class="btn btn-fill btn-wd" style="background-color: cornflowerblue;" href="${urlChange}">
                                                            <b style="color: white">Open Account</b>
                                                        </a>

                                                </c:if>
                                                </td>
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
    function changeData(id) {
        let data = document.getElementById(id);
        $.ajax({
            type: "GET",
            url: "/ANSV/admin/khoa-hoc/quan-ly/user/changeRole",
            contentType : "application/json",
            data: {id_u: id, id_r : data.value},
            dataType : 'json',
            success: function(data) {
                if (data == "1"){
                    alert("Update successful")
                }
            },
            error: function(e) {
                console.log(e);
            }
        });

    }
</script>

</body>
