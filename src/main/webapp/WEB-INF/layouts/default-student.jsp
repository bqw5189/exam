<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title><sitemesh:title/></title>

    <link href="${ctx}/static/student/css/main.css" rel="stylesheet"  />
    <link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet"  />
    <link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet"  />
    <link href="${ctx}/static/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" rel="stylesheet"  />

    <script type="text/javascript">
        var ctx="${ctx}/static/student/";
    </script>

    <script src="${ctx}/static/student/js/jquery.js" type="text/javascript"></script>
    <script src="${ctx}/static/student/js/all.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="${ctx}/static/angular/angular.js" type="text/javascript"></script>
    <script src="${ctx}/static/angular/angular-animate.js" type="text/javascript"></script>


    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="${ctx}/static/fancyBox/lib/jquery.mousewheel.pack.js?v=3.1.3"></script>

    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="${ctx}/static/fancyBox/source/jquery.fancybox.pack.js?v=2.1.5"></script>


    <script>
        var student = angular.module("student",[],function($compileProvider) {});
        student.filter('trustHtml', function ($sce) {

            return $sce.trustAsHtml;

        });

        student.config(['$sceProvider', function($sceProvider) {
            $sceProvider.enabled(false);
        }]);
    </script>
    <style>
    </style>
</head>

<body ng-app="student">
    <!--头部-->
    <div class="topbox">
        <img src="${ctx}/static/student/img/logo.png" class="logo" />
        <img src="${ctx}/static/student/img/text02.png" class="text02" />
        <span style="position: absolute;right: 0px">欢迎,<shiro:principal property="name"></shiro:principal> <a href="${ctx}/logout">退出</a></span>
    </div>

    <!--头部 end-->

    <!--导航-->
    <div class="navbox">
        <ul>
            <c:forEach items="${nav}" var="nav">
                <li><a href="${ctx}/${nav.value}" class="<c:if test="${nav.key==curent}"> onhere</c:if>">${nav.key}</a><i></i></li>
            </c:forEach>
        </ul>
    </div>
    <!--导航end-->
<sitemesh:body/>

</body>
</html>
