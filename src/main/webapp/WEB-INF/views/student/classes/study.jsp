﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>《${courseName}》</title>
<style>
</style>
</head>

<body>

     
    <!--主题部分-->
    <div class="listbox" style="width: 1000px;border: 0px">
    	<h1></h1>
        <c:set var="listClass" value="first,a,end"/>
        <c:set var="listClassArray" value="${fn:split(listClass, ',')}"/>
        <c:forEach items="${course}" var="c">
            <c:if test="${courseName == c.key}">
            <c:forEach items="${c.value.subEntitys}" var="p" varStatus="i">
        <div class="list ${listClassArray[i.index]}">
        	<h2>${p.value.title}</h2>
                <c:forEach items="${p.value.subEntitys}" var="t">
            <a href="${ctx}/student/project?course_name=${courseName}&project_title=${p.value.title}&task_title=${t.value.title}">${t.value.title}</a>
                </c:forEach>
        </div>
            </c:forEach>
            </c:if>
        </c:forEach>
        <%--<div class="list first">--%>
            <%--<h2>高碑店污水处理厂活性污泥中铬元素分析</h2>--%>
            <%--<a href="#" target="_blank">环节一   接受任务</a>--%>
            <%--<a href="#" target="_blank">环节二   制定方案</a>--%>
            <%--<a href="#" target="_blank">环节三   实施分析</a>--%>
            <%--<a href="#" target="_blank">环节四   交付验收</a>--%>
            <%--<a href="#" target="_blank">环节五   总结与拓展</a>--%>
        <%--</div>--%>
        <%--<div class="list a">--%>
        	<%--<h2>高碑店污水处理厂活性污泥中铬元素分析</h2>--%>
            <%--<a href="#" target="_blank">环节一   接受任务</a>--%>
            <%--<a href="#" target="_blank">环节二   制定方案</a>--%>
            <%--<a href="#" target="_blank">环节三   实施分析</a>--%>
            <%--<a href="#" target="_blank">环节四   交付验收</a>--%>
            <%--<a href="#" target="_blank">环节五   总结与拓展</a>--%>
        <%--</div>--%>

        <%--<div class="list end">--%>
        	<%--<h2>南三区土壤中塑化剂分析</h2>--%>
            <%--<a href="#" target="_blank">环节一   接受任务</a>--%>
            <%--<a href="#" target="_blank">环节二   制定方案</a>--%>
            <%--<a href="#" target="_blank">环节三   实施分析</a>--%>
            <%--<a href="#" target="_blank">环节四   交付验收</a>--%>
            <%--<a href="#" target="_blank">环节五   总结与拓展</a>--%>
        <%--</div>--%>
    </div>
    <!--主题部分end-->
    
     <!--底部-->
    

</body>
</html>
