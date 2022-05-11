<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <title>Admin | HighLight</title>
</head>
<body>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

<style>
    /*just bg and body style*/
    .container-upload-file {
        background-color: #1e2832;
        padding-bottom: 20px;
        margin-top: 10px;
        border-radius: 5px;
    }
    .center {
        text-align: center;
    }
    .btn-container {
        background: #fff;
        border-radius: 5px;
        padding-bottom: 20px;
        margin-bottom: 20px;
    }
    .white {
        color: white;
    }
    .imgupload {
        color: #1e2832;
        padding-top: 20px;
        font-size: 7em;
    }
    #namefile {
        color: black;
    }
    .btn-primary {
        border-color: #ff3f3f !important;
        color: #ffffff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        background-color: #ff3f3f !important;
        border-color: #ff3f3f !important;
    }

    /*these two are set to not display at start*/
    .imgupload.ok {
        display: none;
        color: green;
    }
    .imgupload.stop {
        display: none;
        color: red;
    }

    /*this sets the actual file input to overlay our button*/
    #fileup {
        opacity: 0;
        -moz-opacity: 0;
        filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
        width: 200px;
        cursor: pointer;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        bottom: 40px;
        height: 50px;
    }

    /*switch between input and not active input*/
    #submitbtn {
        padding: 5px 50px;
        display: none;
    }
    #fakebtn {
        padding: 5px 40px;
    }

    textarea {
        /* resize: none; */
        resize: vertical; /* user can resize vertically, but width is fixed */
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="col-md-8">
                            <h3 class="title">
                                Admin: <b>Adding News</b>
                            </h3>
                            <p class="category">Đăng bài tin tức</p>
                        </div>
                        <div class="col-md-4">
                            <a href="<c:url value='/admin/news/list' />" style="float: right;">
                                <button type="button" class="btn btn-success btn-fill btn-wd"><b>List News</b></button>
                            </a>
                        </div>
                    </div>
                    <div class="content" style="padding-top: 6%;">
                        <div class="row">
                            <div class="col-md-12">
                                <c:url value="/admin/saveNews?${_csrf.parameterName}=${_csrf.token}" var="saveNews" />

                                <form:form action="${saveNews}" method="POST" modelAttribute="news" enctype="multipart/form-data">



                                    <div class="col-md-8" style="padding-top: 1%;">
                                        <table class="table table-striped">
                                            <tr>
                                                <td width="20%">Hình ảnh: </td>
                                                <td>
                                                    <form:input path="img" class="form-control" id="img_name" readonly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Title: </td>
                                                <td><form:input path="title" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Content: </td>
                                                <td>
                                                        <%-- <form:input path="content" class="form-control" /> --%>
                                                    <form:textarea path="content" class="form-control" rows="6"></form:textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Url: </td>
                                                <td><form:input path="url" class="form-control" /></td>
                                            </tr>
                                            <tr>
                                                <td>Updated by: </td>
                                                <td>
                                                    <form:input path="updated_by" value="${ username }" class="form-control" readonly="true" />
                                                </td>
                                            </tr>
                                            <!-- <tr>
                                                <td></td>
                                                <td><button type="submit">Submit</button></td>
                                            </tr> -->
                                        </table><br><br>
                                        <a href="javascript:void(0)" onclick="history.go(-1);">Previous page</a>
                                    </div>



                                    <div class="col-md-4">
                                        <div class="container-upload-file center">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h3 class="white"><b>Chọn ảnh trước khi đăng bài</b></h3>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-10 col-md-offset-1 center">
                                                    <div class="btn-container">
                                                        <!--the three icons: default, ok file (img), error file (not an img)-->
                                                        <h1 class="imgupload">
                                                            <i class="fas fa-image"></i>
                                                        </h1>
                                                        <h1 class="imgupload ok">
                                                            <i class="fa fa-check"></i>
                                                        </h1>
                                                        <h1 class="imgupload stop">
                                                            <i class="fa fa-times"></i>
                                                        </h1>
                                                        <!-- Định dạng file cho phép được upload -->
                                                        <p id="namefile">File cho phép! (png, jpg, jpeg)</p>
                                                        <!--our custom btn which which stays under the actual one-->
                                                        <button type="button" id="btnup" class="btn btn-primary btn-lg">
                                                            Chọn ảnh của bạn!
                                                        </button>
                                                        <!--this is the actual file input, is set with opacity=0 beacause we wanna see our custom one-->
                                                        <input type="file" value="" name="fileup" id="fileup">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--additional fields-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
                                                    <input type="submit" value="Đăng bài!" class="btn btn-primary" id="submitbtn">
                                                    <button type="button" class="btn btn-default" disabled="disabled" id="fakebtn">
                                                        Đăng bài! <i class="fa fa-minus-circle"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script>
    $("#fileup").change(function () {
        //here we take the file extension and set an array of valid extensions
        var res = $("#fileup").val();
        var arr = res.split("\\");
        var filename = arr.slice(-1)[0];
        filextension = filename.split(".");
        filext = "." + filextension.slice(-1)[0];
        valid = [".png", ".jpg", ".jpeg"];

        //if file is not valid we show the error icon, the red alert, and hide the submit button
        if (valid.indexOf(filext.toLowerCase()) == -1) {
            $(".imgupload").hide("slow");
            $(".imgupload.ok").hide("slow");
            $(".imgupload.stop").show("slow");

            $("#namefile").css({ color: "red", "font-weight": 700 });
            $("#namefile").html("File " + filename + " không hợp lệ!");

            $("#submitbtn").hide();
            $("#fakebtn").show();
        } else {
            //if file is valid we show the green alert and show the valid submit
            $(".imgupload").hide("slow");
            $(".imgupload.stop").hide("slow");
            $(".imgupload.ok").show("slow");

            $("#namefile").css({ color: "green", "font-weight": 700 });
            $("#namefile").html(filename);

            document.getElementById("img_name").value = filename;

            $("#submitbtn").show();
            $("#fakebtn").hide();
        }
    });
</script>

</body>