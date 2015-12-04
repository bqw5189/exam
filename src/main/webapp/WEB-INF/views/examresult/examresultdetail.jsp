<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>考试成绩及排名</title>
</head>
<body>
<form id="inputForm" action="${ctx}/examresult/seeresult/${examId}" method="get" class="form-horizontal">
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success">
		<button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<fieldset>
	<legend><small>考试成绩单</small></legend>
	 <div class="md-card uk-margin-medium-bottom">
    	<div class="md-card-content">
				     <table id="dt_default" class="uk-table">
						<thead><tr><th style="width:40%">试卷名称</th><th style="width:20%">姓名</th><th style="width:20%">得分</th><th style="width:20%">排名</th></tr></thead>
					<tbody>
					<c:set value="1" var="no"></c:set>
						<c:forEach items="${examresult }" var="er">
							<tr>
								<td><a href="${ctx}/examlist/showexam/${er.examId}?personId=${er.personId}"/>${ er.examName}</td>
								<td>${er.personName }</td>
								<td>${ er.sumScore}</td>
								<td>${ er.examOrder}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
				</div>
		</div>
		</div>
		</fieldset>
		</form>
</body>
</html>