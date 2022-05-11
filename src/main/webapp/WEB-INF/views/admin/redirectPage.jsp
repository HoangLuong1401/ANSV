<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin | chuyển hướng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class="container" style="  text-align: center; padding-top: 10px;">
    <img src="<c:url value="/assets/admin/img/imgredir.png"/>" alt="Avatar" class="image" style="width:75%;height: 275px;">
    <div class="middle centered">
        <div class="text ">
            <a href="<c:url value="/admin/web/quan-ly/slideshow"/>" >Quản Lý Web ANSV</a>
        </div>

    </div>
</div>
<div class="container" style="text-align: center; padding-top: 10px;">
    <img src="<c:url value="/assets/admin/img/imgCos.jpg"/>" alt="Avatar" class="image" style="width:75%;height: 275px;">
    <div class="middle">
        <div class="text">
            <a href="<c:url value="/admin/khoa-hoc/quan-ly/ban"/>" >Quản Lý Khóa Học</a>
        </div>
    </div>
</div>

</body>
</html>

