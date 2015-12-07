<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>《北校区大气PM2.5中多环芳烃分析》</title>
<style>
</style>
</head>

<body>

     
    <!--主题部分-->
    <div class="listbox">
    	<h1></h1>
        <c:forEach items="${course}" var="c">
            <c:forEach items="${c.value.subEntitys}" var="p">
        <div class="list first">
        	<h2>${p.value.title}</h2>
                <c:forEach items="${p.value.subEntitys}" var="t">
            <a href="${ctx}/student/project?project_title=${p.value.title}&task_title=${t.value.title}">${t.value.title}</a>
                </c:forEach>
        </div>
            </c:forEach>
        </c:forEach>
        <div class="list">
        	<h2>汽修喷漆车间废水中苯系物分析</h2>
            <a href="#" target="_blank">环节一   接受任务</a>
            <a href="#" target="_blank">环节二   制定方案</a>
            <a href="#" target="_blank">环节三   实施分析</a>
            <a href="#" target="_blank">环节四   交付验收</a>
            <a href="#" target="_blank">环节五   总结与拓展</a>
        </div>

        <div class="list end">
        	<h2>南三区土壤中塑化剂分析</h2>
            <a href="#" target="_blank">环节一   接受任务</a>
            <a href="#" target="_blank">环节二   制定方案</a>
            <a href="#" target="_blank">环节三   实施分析</a>
            <a href="#" target="_blank">环节四   交付验收</a>
            <a href="#" target="_blank">环节五   总结与拓展</a>
        </div>
    </div>
    <!--主题部分end-->
    
     <!--底部-->
    
     <!--底部end-->
       <script>
           $(function(){
               $(".text02").hide();
           });
       </script>
</body>
</html>
