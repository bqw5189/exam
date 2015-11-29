<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title><sitemesh:title/></title>

    <link href="${ctx}/static/student/css/main.css" rel="stylesheet"  />
    <script type="text/javascript">
        var ctx="${ctx}/static/student/";
    </script>
    <script src="${ctx}/static/student/js/jquery.js" type="text/javascript"></script>
    <script src="${ctx}/static/student/js/all.js" type="text/javascript"></script>
    <style>
    </style>
</head>

<body>
    <!--头部-->
    <div class="topbox">
        <img src="${ctx}/static/student/img/logo.png" class="logo" />
        <img src="${ctx}/static/student/img/text02.png" class="text02" />
    </div>

    <!--头部 end-->

    <!--导航-->
    <div class="navbox">
        <ul>
            <li><a href="#" target="_blank">首页</a><i></i></li>
            <li><a href="#" target="_blank">课程导学</a><i></i></li>
            <li><a href="#" target="_blank" class="onhere">课程学习</a><i></i></li>
            <li><a href="#" target="_blank">模拟实验室</a><i></i></li>
            <li><a href="#" target="_blank">习题库</a><i></i></li>
            <li><a href="#" target="_blank">参考资料</a><i></i></li>
            <li><a href="#" target="_blank">名词索引</a><i></i></li>
            <li><a href="#" target="_blank">视频索引</a><i></i></li>
            <li><a href="#" target="_blank">动画索引</a><i></i></li>
            <li><a href="#" target="_blank">图片索引</a></li>
        </ul>
    </div>
    <!--导航end-->
<sitemesh:body/>

</body>
</html>
