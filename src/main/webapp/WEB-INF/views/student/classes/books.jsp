<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="<%=org.apache.shiro.SecurityUtils.getSubject().getPrincipal()%>"/>
<c:set var="className" value="${principal.className}"/>


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
    <c:if test="${param['type'] == null}">
        <c:set var="defaultActive" value="active"></c:set>
    </c:if>
    <!--左边菜单-->
    <c:if test="${className != 'ysfx'}">
         <ul class="nav nav-tabs">
            <li class="${defaultActive}<c:if test="${param['type'] == '北校区大气PM2.5中多环芳烃分析'}"> active </c:if>"><a href="${ctx}/student/classes/books?type=北校区大气PM2.5中多环芳烃分析">北校区大气PM2.5中多环芳烃分析</a></li>
            <li class="<c:if test="${param['type'] == '汽修喷漆车间废水中苯系物分析'}"> active </c:if>"><a href="${ctx}/student/classes/books?type=汽修喷漆车间废水中苯系物分析">汽修喷漆车间废水中苯系物分析</a></li>
            <li class="<c:if test="${param['type'] == '南三区土壤中塑化剂分析'}"> active </c:if>"><a  href="${ctx}/student/classes/books?type=南三区土壤中塑化剂分析">南三区土壤中塑化剂分析</a></li>
            <input type="text" ng-model="q"  placeholder="请输入搜索关键字"/>
        </ul>
    </c:if>
    <c:if test="${className == 'ysfx'}">
    <ul class="nav nav-tabs">
        <li class="${defaultActive}<c:if test="${param['type'] == '南校区大气PM2.5中元素分析'}"> active </c:if>"><a href="${ctx}/student/classes/books?type=南校区大气PM2.5中元素分析">南校区大气PM2.5中元素分析</a></li>
        <li class="<c:if test="${param['type'] == '高碑店污水处理厂活性污泥中铬元素分析'}"> active </c:if>"><a href="${ctx}/student/classes/books?type=高碑店污水处理厂活性污泥中铬元素分析">高碑店污水处理厂活性污泥中铬元素分析</a></li>
        <li class="<c:if test="${param['type'] == '南校区自备井水质异味排查'}"> active </c:if>"><a  href="${ctx}/student/classes/books?type=南校区自备井水质异味排查">南校区自备井水质异味排查</a></li>
        <input type="text" ng-model="q"  placeholder="请输入搜索关键字"/>
    </ul>
    </c:if>

    <div class="rightData" style="width: 980px" ng-init="words = [<c:forEach items="${resources}" var="r">{title:'${r[6]}', file:'${r[6]}'},</c:forEach>]">
        <ol style="padding-left: 20px">
            <li ng-repeat="word in words| filter:q as results"  style="list-style-type: decimal;padding-top: 10px;color: #f97112">
                <a title="" data-fancybox-group="gallery" href="${ctx}/static/${resourcePath}/ckzl/{{word.file}}" class="fancybox"  style="color: #000">{{word.title}}</a>
            </li>
        </ol>

        <%--<ol>--%>

        <%--<li style="line-height:30px" ng-repeat="word in words |filter:'IMG'| filter:q as results"><b>{{word.type}}</b>{{word.file}} </li>--%>
        <%--</ol>--%>
    </div>
</div>
        
</body>
</html>
