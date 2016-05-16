<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>答案管理</title>
	<!--  style type="text/css">
		.heading_list{
			color:#333333;
			font-size:18px;
			font-weight: bold;
		}
	</style> -->

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
                                            <a href="${ctx }/answer?course=${pro.projectName}"
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
<div class="md-card">
    <div class="md-card-content">
        <div><b>当前位置:>>答案管理</b></div>
	<table id="dt_default" class="uk-table" >
		<thead><tr><th>序号</th><th>学生</th><th>班级</th><th>课程</th></thead>
		<tbody>
		<c:forEach items="${list}" var="l"  varStatus="status">
			<tr>
                <td>${status.index+1}</td>
                <td><a href="${ctx}/answer/${l.user.id}?course=${l.course}">${l.user.name}</a></td>
				<td>${l.user.ssClass.className}</td>
                <td>${l.course}</td>
                </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
</div>

</body>
</html>
