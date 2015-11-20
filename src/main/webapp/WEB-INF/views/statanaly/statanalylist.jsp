<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>统计分析列表</title>
 <!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />
</head>
<body>
	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
	</c:if>
	<div class="md-card">
    <div class="md-card-content">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-large-1-1">
                <ul id="kUI_menu">
                    <c:forEach items="${course }" var="cour">
                    <li> ${cour.courseName }
                        <c:if test="${fn:length(cour.project)>0}">
                        <ul>
                            <c:forEach items="${cour.project }" var="pro">
                            <li>
                                <a href="${ctx }/statanaly/${pro.id}"
                                        <c:if test="${ projectId==pro.id}">
                                            class="text-success"
                                        </c:if>
                                        >${pro.projectName }</a>
                            </li>
                            </c:forEach>
                        </ul>
                        </c:if>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
        <table id="dt_default" class="uk-table" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>序号</th>
                <th>试卷名称</th>
                <th>试卷说明</th>
                <th>答题时间(分钟)</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="no" value="1"></c:set>
            <c:forEach items="${makexam }" var="exam">
                <tr>
                    <td>${ no}</td>
                    <td>${ exam.examName }</td>
                    <td>${ exam.examRemark}</td>
                    <td>${ exam.examTime}</td>
                    <td>
                        <c:if test="${exam.state==1 }">开始考试</c:if>
                        <c:if test="${exam.state==0 }">未考试</c:if>
                        <c:if test="${exam.state==2 }">考试完成</c:if>
                        <c:if test="${exam.state==3 }">已排名</c:if>
                    </td>
                    <td>
                        <c:if test="${exam.state==3 }">
							<a href="${ctx }/statanaly/statanalyquery/${exam.id}" id="analy_btn" class="md-btn md-btn-flat md-btn-flat-primary"><i class="material-icons"></i>统计分析</a>
						</c:if>
						<c:if test="${exam.state!=3 }">
							<a href="${ctx }/examresult/seeresult/${exam.id}">查看考试结果</a>
						</c:if>
                    </td>
                </tr>
                <c:set var="no" value="${no+1 }"></c:set>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
</body>
</html>