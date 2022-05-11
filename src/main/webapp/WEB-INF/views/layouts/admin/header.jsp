<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-minimize">
            <button id="minimizeSidebar"
                    class="btn btn-warning btn-fill btn-round btn-icon">
                <i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
                    class="fa fa-navicon visible-on-sidebar-mini"></i>
            </button>
        </div>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Administrator</a>
        </div>
        <div class="collapse navbar-collapse">
            <div class="nav navbar-nav navbar-right" style="width: 11%;">
                <form action="<c:url value="/admin/j_spring_security_logout" />" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-secondary btn-fill" style="font-size: 20px;padding-right: 10px;
											background-color: #ffc107; border: none">
                        <i class="fa fa-sign-out" style="font-weight: bold;"></i><b> Log out </b>
                    </button>
                </form>
            </div>

        </div>
    </div>
</nav>