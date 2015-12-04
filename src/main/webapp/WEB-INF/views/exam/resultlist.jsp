<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>考试得分</title>
</head>

<body>
	<form id="submitForm" action="" method="post" class="form-horizontal">
	<fieldset>
	<legend><small>考试得分</small></legend>
	<div class="md-card">
    <div class="md-card-content">
	<table id="dt_default" class="uk-table">
		<tbody>	
			<tr>
				<td align="center"><center><strong>${examvo.examName }</strong></center>本次答卷得分：<font color="red" size="6">${sumScore }</font></td>
			</tr>
			<tr>
				<td align="center">${examvo.examRemark }</td>
			</tr>
			<c:set var="indexno" value="1" />
			<c:forEach items="${examvo.questionList}" var="que">
			<c:if test="${null!=que.typeRemark&&''!=que.typeRemark }">
				<tr>
					<td><font color="red">${que.typeRemark }</font></td>
				</tr>
			</c:if>
				<tr>
					<td>${indexno} 、${que.questionCont }</td>
				</tr>
				<c:forEach items="${resultlist}" var="result">
					<c:if test="${result.examQuestionId==que.id}">
						<c:forEach items="${que.selectItems}" var="item">
							<c:if test="${que.type==1 }">
								<tr>
									<td>
										<input type='radio' name='${que.id }' id='${item.id}' value='${item.id}'
										<c:if test="${result.chooseQuestionId==item.id}">
										
										<c:set var="reply" value="学生答案：${item.selectCont}" />
										 checked=true
										 </c:if>
										 >
										 <c:if test="${que.questionAnswerId==item.id}"><c:set var="answer" value="正确答案：${item.selectCont}" /> </c:if>
										 ${item.selectCont }
										 <c:if test="${que.questionAnswerId==item.id}"></font></c:if>
										 <c:if test="${que.questionAnswerId==item.id&&result.chooseQuestionId==item.id }">
										 <c:set var="score" value="得分：${que.questionScore}" /></c:if>
										 </input>
									</td>
								</tr>
							</c:if>
							<c:if test="${que.type==2 }">
								<tr>
									<td>
										<input type='checkbox' name='${que.id }' id='${item.id}' value='${item.id}'
										<c:if test="${fn:contains(result.chooseQuestionId,item.id)}">
										 checked=true
										 </c:if>
										 >
										 <c:if test="${fn:contains(que.questionAnswerId,item.id)}"><font color="red"></c:if>
										 ${item.selectCont }
										 <c:if test="${fn:contains(que.questionAnswerId,item.id)}"></font></c:if>
										 </input>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
				<c:set var="indexno" value="${indexno+1 }"></c:set>
				<tr>
					<td>
						<font color="red"><c:out value="${answer }"></c:out>   <c:out value="${ reply}"></c:out>    <c:out value="${score }"></c:out></font>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div align="center">
		<c:if test="${role=='user' }">
		<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="window.location='${ctx}/examlist'"/>
		</c:if>
		<c:if test="${role=='teacher' }">
		<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
		</c:if>
	</div>
	</div>
	</div>
	</form>
	</fieldset>
</body>
</html>