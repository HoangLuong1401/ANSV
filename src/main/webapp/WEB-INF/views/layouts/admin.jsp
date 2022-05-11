<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="<c:url value='/assets/admin/img/favicon.ico' />">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title><dec:title default="Master-Layout" /></title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="<c:url value='/assets/admin/css/bootstrap.min.css' />" rel="stylesheet" />

    <!--  Light Bootstrap Dashboard core CSS    -->
    <link href="<c:url value='/assets/admin/css/light-bootstrap-dashboard.css?v=1.4.1' />" rel="stylesheet" />

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<c:url value='/assets/admin/css/demo.css' />" rel="stylesheet" />

    <!-- Fonts and icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="<c:url value='/assets/admin/css/pe-icon-7-stroke.css' />" rel="stylesheet" />

    <!-- Select 2 (CSS) -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <!-- Alertify CSS -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- Bootstrap theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>

    <!-- Jquery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>

    <!-- ===== ckeditor ===== -->
    <script src="<c:url value='/assets/ckeditor/ckeditor.js' />"></script>
    <script src="<c:url value='/assets/ckeditor/adapters/jquery.js' />"></script>

    <style type="text/css">
        .select2-container .select2-selection--single {
            height: 34px;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 34px;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow b {
            margin-top: 1px;
        }
    </style>

</head>
<body>
<div class="wrapper">


    <!-- Menu -->
    <%@include file="/WEB-INF/views/layouts/admin/menu.jsp"%>


    <div class="main-panel">


        <!-- Header -->
        <%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>


        <dec:body />


        <!-- Footer -->
        <%--			<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>--%>


    </div>
</div>


</body>

<script type="text/javascript">
    $(document).ready(function() {
        $('#select2').select2();

        $(function() {
            $("#content").ckeditor({
                toolbar : 'Basic',
                uiColor : '#F7D358'
            });
        });
    });

    function validate_form() {
        select = document.getElementById('select2');

        if (select.value != 0) {
            return true;
        }
        alertify.error('Bạn chưa chọn loại tin tức!');
        return false;

    }
</script>

<!--   Core JS Files  -->
<%-- <script src="<c:url value='/assets/admin/js/jquery.min.js' />" type="text/javascript"></script> --%>
<script src="<c:url value='/assets/admin/js/bootstrap.min.js' />" type="text/javascript"></script>
<script src="<c:url value='/assets/admin/js/perfect-scrollbar.jquery.min.js' />" type="text/javascript"></script>

<!--  Forms Validations Plugin -->
<script src="<c:url value='/assets/admin/js/jquery.validate.min.js' />"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<%-- <script src="<c:url value='/assets/admin/js/moment.min.js' />"></script> --%>

<!--  Date Time Picker Plugin is included in this js file -->
<%-- <script src="<c:url value='/assets/admin/js/bootstrap-datetimepicker.min.js' />"></script> --%>

<!--  Select Picker Plugin -->
<%-- <script src="<c:url value='/assets/admin/js/bootstrap-selectpicker.js' />"></script> --%>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="<c:url value='/assets/admin/js/bootstrap-switch-tags.min.js' />"></script>

<!--  Charts Plugin -->
<%-- <script src="<c:url value='/assets/admin/js/chartist.min.js' />"></script> --%>

<!--  Notifications Plugin    -->
<script src="<c:url value='/assets/admin/js/bootstrap-notify.js' />"></script>

<!-- Sweet Alert 2 plugin -->
<script src="<c:url value='/assets/admin/js/sweetalert2.js' />"></script>

<!-- Vector Map plugin -->
<%-- <script src="<c:url value='/assets/admin/js/jquery-jvectormap.js' />"></script> --%>

<!--  Google Maps Plugin    -->
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->

<!-- Wizard Plugin    -->
<%-- <script src="<c:url value='/assets/admin/js/jquery.bootstrap.wizard.min.js' />"></script> --%>

<!--  Bootstrap Table Plugin    -->
<script src="<c:url value='/assets/admin/js/bootstrap-table.js' />"></script>

<!--  Plugin for DataTables.net  -->
<script src="<c:url value='/assets/admin/js/jquery.datatables.js' />"></script>

<!-- Select 2 (JS) -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<!-- JavaScript (JS) -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!--  Full Calendar Plugin    -->
<%-- <script src="<c:url value='/assets/admin/js/fullcalendar.min.js' />"></script> --%>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="<c:url value='/assets/admin/js/light-bootstrap-dashboard.js?v=1.4.1' />"></script>

<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="<c:url value='/assets/admin/js/demo.js' />"></script>

</html>
