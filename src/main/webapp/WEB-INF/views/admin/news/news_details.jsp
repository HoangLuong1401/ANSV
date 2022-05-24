<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>Admin | News</title>
<body>
<style>
    .news_pt {
        padding-top: 2%;
    }

    .news_image {
        display: block;
        margin-left: auto;
        margin-right: auto;
        max-width: 100%;
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card ">
                    <div class="header">
                        <div class="row">
                            <div class="col-md-8">
                                <h3 class="title">
                                    Admin: <b>Tin tức chi tiết</b>
                                </h3>
                                <p class="category">Quản trị viên xem chi tiết bài viết</p>
                            </div>
                            <div class="col-md-4">
                                <a href="<c:url value='/admin/web/quan-ly/news' />" style="float: right;">
                                    <button type="button" class="btn btn-success btn-fill btn-wd"><b>List News</b></button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="content"><hr style="margin-top: 0; margin-bottom: -1%;">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">

                                <div class="row news_pt">
                                    <div class="col-md-12" style="font-size: 20px;">
                                        <b>
                                            Phân loại:
                                            <font color="#FF6600"><i>${ newDetails.classify }</i></font>
                                        </b>
                                        <hr style="margin-top: 1%; margin-bottom: -1%; height: 2px; background-color: black;">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <h3><b>${ newDetails.title }</b></h3>
                                    </div>
                                </div>

<%--                                <div class="row news_pt">--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        ${ newDetails.summary }--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="row news_pt">--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        <img src="<c:url value='/assets/user/img/news/${newDetails.img}' />" class="news_image" />--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="row news_pt">
                                    <div class="col-md-12">
                                        ${ newDetails.content }<hr>
                                    </div>
                                </div>

                                <div class="row news_pt">
                                    <div class="col-md-8">
                                        <b>Link: </b><i>${ newDetails.url }</i>
                                    </div>
                                    <div class="col-md-2" style="display: flex; justify-content: flex-end">Người đăng:</div>
                                    <div class="col-md-2">
                                        <i>
                                            ${ newDetails.updated_by }
                                            <hr style="margin: 0;">
                                            ${ newDetails.updated_at }
                                        </i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>