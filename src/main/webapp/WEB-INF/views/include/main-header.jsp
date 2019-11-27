<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- Main Header --%>
<header class="main-header">
    <%-- Logo --%>
    <a href="/" class="logo">
        <%-- mini logo for sidebar mini 50x50 pixels --%>
        <span class="logo-mini"><b>ST</b>M</span>
        <%-- logo for regular state and mobile devices --%>
        <span class="logo-lg"><b>Sejong</b>Track</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <!-- 로그인 기능 넣을 자리-->
        <sec:authorize access="isAnonymous()">
            <a href="${path}/joinView">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <a href="${path}/loginView">로그인</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a href="${path}/memberLogout">로그아웃</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
            <br>안녕하세요 관리자님</br>
        </sec:authorize>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">
                            <%
                                String name = "Guest" ;
                                if (session.getAttribute("id") != null) {
                                    name= session.getAttribute("id").toString();
                                }
                            %>
                            <%=name%>
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                            <p>
                                Alexander Pierce - Web Developer
                                <small>Member since Nov. 2012</small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="#" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
