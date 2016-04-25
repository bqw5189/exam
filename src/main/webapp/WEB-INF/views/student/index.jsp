﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<shiro:hasRole name="teacher">
    <script>
        location.href="${ctx}/login/index"
    </script>
</shiro:hasRole>
<shiro:hasRole name="admin">
    <script>
        location.href="${ctx}/login/index"
    </script>
</shiro:hasRole>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>《北校区大气PM2.5中多环芳烃分析》</title>

    <script type="text/javascript">
        var ctx="${ctx}/static/ysfx/";
    </script>

    <link href="${ctx}/static/ysfx/css/blue.css" rel="stylesheet"  id="linkdom"/>
    <script src="${ctx}/static/ysfx/js/jquery.js" type="text/javascript"></script>
    <script src="${ctx}/static/ysfx/js/all.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>

    <script>
        $(function(){
            if ("ysfx" == "<shiro:principal property="className"></shiro:principal>"){
                $('.hfbox').css('background','#137c94')
                $('#linkdom').attr('href','${ctx}/static/ysfx/css/blue.css')
            }else{
                $('.hfbox').css('background','#1ba627')
                $('#linkdom').attr('href','${ctx}/static/ysfx/css/green.css')
            }
        });
    </script>
<style>
</style>
</head>

<body>
    
    <!--主题部分-->
    <div class="contentbox">
    	<img src="${ctx}/static/student/img/logo.png" class="logo" />
        <img src="${ctx}/static/student/img/text01.png" class="text01" />
        <div class="indexNavbox">

        	<ul>
                <c:forEach items="${nav}" var="nav">
                    <li><a href="${ctx}/${nav.value}" class="<c:if test="${nav.key==curent}"> onhere</c:if>">${nav.key}</a><i></i></li>
                </c:forEach>
            </ul>

        </div>
        
        <div class="rollBox">
        	<span class="img01" dex="1"></span>
            <span class="img02" dex="2"></span>
            <span class="img03" dex="3"></span>
            <span class="img04" dex="4"></span>
            <span class="img05" dex="5"></span>
        </div>
    </div>
    <!--主题部分end-->
        
</body>
</html>
