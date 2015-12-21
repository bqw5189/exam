<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>统计分析列表</title>
</head>

<body>
<div id="mainPage">

	<form id="inputForm" action="#" method="post" class="form-horizontal">
		<input type="hidden" name="examId" id="examId" value="${exam.id}">
			<div class="md-card">
    			<div class="md-card-content">
                    <div><b>当前位置:>>统计分析>>统计列表</b></div>
                    <br>
                    <br>
			<div><b>试卷名称:    ${exam.examName}</b></div>
			<table id="contentTable" class="uk-table">
					<thead><tr><th style="width:8%">序号</th><th style="width:12%">试题类型</th><th style="width:62%">试题名称</th><th style="width:10%">答对率(%)</th>
					<th style="width:8%">操作</th>
					</tr></thead>
					<tbody>
					<c:set var="no" value="1"></c:set>
						<c:forEach items="${analylist }" var="que">
							<tr>
								<td>
									${ no}
								</td>
								<td>
								<c:if test="${que.type==1 }">单选</c:if>
								<c:if test="${que.type==2 }">多选</c:if>
								</td>
								<td>${ que.questionCont}</td>
								<td>${ que.scale}</td>
								<td><a href="${ctx }/statanaly/detail/${que.id}?examId=${exam.id}">明细</a></td>
							</tr>
							<c:set var="no" value="${no+1 }"></c:set>
						</c:forEach>
					</tbody>
				</table>
			<div align="center">
				<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
			</div>
			</div>
		</div>
	</form>
</div>
	<script>
	</script>
</body>
</html>
