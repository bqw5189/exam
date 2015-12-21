<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>统计分析</title>
</head>

<body>
<div id="mainPage">

	<form id="inputForm" action="#" method="post" class="form-horizontal">
			<div class="md-card">
    		<div class="md-card-content">
                <div><b>当前位置：>>统计分析>>统计列表>>明细</b></div>
			<table id="dt_default" class="uk-table">
					<thead><tr><th style="width:33%">序号</th><th style="width:33%">姓名</th><th style="width:34%">答题情况</th>
					</tr></thead>
					<tbody>
					<c:set var="no" value="1"></c:set>
						<c:forEach items="${analydetail }" var="que">
							<tr>
								<td>
									${ no}
								</td>
								<td>${ que.personName}</td>
								<td>
								<c:if test="${que.isOk==1 }"><img alt="" src="${ctx }/static/images/button_ok.png"></c:if>
								<c:if test="${que.isOk==0 }"><img alt="" src="${ctx }/static/images/button_cancel.png"></c:if>
								</td>
							</tr>
							<c:set var="no" value="${no+1 }"></c:set>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				<div class="form-actions" align="center">
					<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
				</div>
				</div>
			</div>
	</form>
</div>
</body>
</html>
