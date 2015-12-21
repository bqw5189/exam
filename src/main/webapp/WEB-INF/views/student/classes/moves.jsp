﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>《北校区大气PM2.5中多环芳烃分析》</title>

    <style>
        .nav-tabs > .active > a, .nav-tabs > .active > a:hover, .nav-tabs > .active > a:focus{
            background-color: #f88825;
        }
    </style>
</head>

<body>
<!--主题部分-->
<div class="tearchpagebox">

    <!--左边菜单-->
    <ul class="nav nav-tabs">
        <li class="active"><a href="${ctx}/student/classes/flash?taskName=北校区大气PM2.5中多环芳烃分析">北校区大气PM2.5中多环芳烃分析</a></li>
        <li class=""><a href="${ctx}/student/classes/flash?taskName=汽修喷漆车间废水中苯系物分析">汽修喷漆车间废水中苯系物分析</a></li>
        <li class=""><a  href="${ctx}/student/classes/flash?taskName=南三区土壤中塑化剂分析">南三区土壤中塑化剂分析</a></li>
        <input type="search" ng-model="q" />

    </ul>
    <div class="rightData" style="width: 1000px" ng-init="words = [ <c:forEach items="${resources}" var="r">{type:'${r[5]}', file:'${r[6]}'},</c:forEach> ]">
        <a title="" data-fancybox-group="gallery" href="${ctx}/static/pmfj/{{word.file}}" class="fancybox" ng-repeat="word in words |filter:{type : 'MOVIE'}| filter:q as results"><img style="width:120px;height:120px;margin: 5px" src="${ctx}/static/pmfj/{{word.file}}" ></a>
        <%--<ol>--%>

        <%--<li style="line-height:30px" ng-repeat="word in words |filter:'IMG'| filter:q as results"><b>{{word.type}}</b>{{word.file}} </li>--%>
        <%--</ol>--%>
    </div>

    <script type="text/javascript">
        $(function(){$('.fancybox').fancybox();});
    </script>
</div>

</body>
</html>
