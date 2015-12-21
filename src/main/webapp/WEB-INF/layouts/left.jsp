<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<c:set var="makexam" value="${ctx}/makexam"/>
<c:set var="questionsee" value="${ctx}/questionsee"/>
<c:set var="examresult" value="${ctx}/examresult"/>
<c:set var="statanaly" value="${ctx}/statanaly"/>
<c:set var="examlist" value="${ctx}/examlist"/>

<c:set var="user" value="${ctx}/admin/user"/>
<c:set var="question" value="${ctx}/question"/>
<c:set var="course" value="${ctx}/course"/>
<c:set var="ssclass" value="${ctx}/ssclass"/>

<!-- main sidebar -->
<aside id="sidebar_main">
    <div class="sidebar_main_header">
        <div class="sidebar_logo">
            <a href="index.html" class="sSidebar_hide"><img src="${ctx}/static/altair/assets/img/logo_main.png" alt="" height="15" width="71" /></a>
            <a href="index.html" class="sSidebar_show"><img src="${ctx}/static/altair/assets/img/logo_main_small.png" alt="" height="32" width="32" /></a>
        </div>

    </div>
    <div class="menu_section">
        <ul>
            <shiro:hasRole name="teacher">
                <li class="<c:if test="${fn:contains(uri,questionsee)}">current_section</c:if>"> <a href="${questionsee}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">试题查看</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,makexam)}">current_section</c:if>"> <a href="${makexam}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">制定试卷</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,examresult)}">current_section</c:if>"> <a href="${examresult}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">学生答题情况</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,statanaly)}">current_section</c:if>"> <a href="${statanaly}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">统计分析</span> </a></li>
            </shiro:hasRole>
            <shiro:hasRole name="admin">
                <li class="<c:if test="${fn:contains(uri,ssclass)}">current_section</c:if>"> <a href="${ssclass}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">班级管理</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,user)}">current_section</c:if>"> <a href="${user}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">用户管理</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,question)}">current_section</c:if>"> <a href="${question}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">试题管理</span> </a></li>
                <li class="<c:if test="${fn:contains(uri,course)}">current_section</c:if>"> <a href="${course}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">课程项目管理</span> </a></li>
                <li class="divider"></li>
            </shiro:hasRole>
            <shiro:hasRole name="student">
                <li class="<c:if test="${fn:contains(uri,examlist)}">current_section</c:if>"> <a href="${examlist}"> <span class="menu_icon"><i class="material-icons"></i></span> <span class="menu_title">在线考试</span> </a></li>
            </shiro:hasRole>
        </ul>
    </div>
</aside>
<!-- main sidebar end -->