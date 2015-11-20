<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>在线考试</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
	</c:if>
	<div class="md-card">
    <div class="md-card-content">
	<table id="dt_default" class="uk-table">
		<thead><tr><th>试卷名称</th><th>说明</th><th>答题时间<th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${examinfo}" var="exam">
			<tr>
				<td>${exam.examName}</td>
				<td>${exam.examRemark}</td>
				<td>
					${exam.examTime}
				</td>
				<td>
				<c:if test="${exam.isHas>0}">
					<a href="${ctx}/examlist/showexam/${exam.id}">查看答题结果</a>
				</c:if>
				<c:if test="${exam.isHas==0}">
				<a href="${ctx}/examlist/writeexam/${exam.id}">开始答卷</a>
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	 </div>
	</div>
</body>
</html>
