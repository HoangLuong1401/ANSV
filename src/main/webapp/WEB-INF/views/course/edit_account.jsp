<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>ANSV | Đổi Mật Khẩu</title>

<link rel="stylesheet" href="<c:url value="/assets/course/style/detail.css"/>" />
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<section style="justify-content: center">

    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">
                    <img src="https://www.tutorialrepublic.com/examples/images/avatar.png" alt="Avatar">
                </div>
                <h4 class="modal-title">Đổi mật khẩu</h4>
            </div>
            <div class="modal-body">
                <form name="myForm" method="POST" action="<c:url value="/user/khoa-hoc/changepassed" />" onsubmit="return validateForm()">
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="Enter password" required="required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password1" placeholder="Retype" required="required">

                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Xác nhận</button>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
            </div>
        </div>
    </div>

</section>

<script type="text/javascript">
    const passField = document.querySelector("input");
    const showBtn = document.querySelector("span i");
    showBtn.onclick = (() => {
        if (passField.type === "password") {
            passField.type = "text";
            showBtn.classList.add("hide-btn");
        } else {
            passField.type = "password";
            showBtn.classList.remove("hide-btn");
        }
    });

    function validateForm() {
        // Get form via form name:
        var myForm = document.forms["myForm"];

        var u = myForm["password"].value;
        var p = myForm["password1"].value;

        if (u == "") {
            alert("Please enter your Password");
            myForm["password"].focus(); // Focus
            return false;
        }
        if (p == "") {
            alert("Please enter you Password");
            myForm["password1"].focus(); // Focus
            return false;
        }

        if (u == p) {
            alert("Đổi mật khẩu thành công!")
        } else {
            alert("mk không khớp, vui lòng nhập lại!")
            return false;
        }

        return true;
    }
</script>