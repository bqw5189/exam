<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>试题选择</title>
</head>
<body>
<form id="inputForm" action="${ctx}/question/create" method="post" class="form-horizontal">
	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
	</c:if>
	<fieldset>
	<legend><small>试题选择</small></legend>
	<div class="md-card">
    <div class="md-card-content">
         <table id="dt_default" class="uk-table">
					<thead><tr><th style="width:8%">选择</th><th style="width:12%">试题类型</th><th style="width:62%">试题名称</th><th style="width:10%">分值</th>
					<th style="width:8%">操作</th>
					</tr></thead>
					<tbody>
						<c:forEach items="${question }" var="que">
							<tr>
								<td>
									${que.id }<input type="checkbox" name="checkbox" value="${que.id }">
								</td>
								<td>
								<c:if test="${que.type==1 }">单选</c:if>
								<c:if test="${que.type==2 }">多选</c:if>
								</td>
								<td>${ que.questionCont}</td>
								<td>${ que.questionScore}</td>
								<td><a href="${ctx }/questionsee/detail/${que.id}">明细</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				</div>
				<div align="center">
				<input id="submit_btn" class="md-btn md-btn-primary" type="button" value="确定" onclick="win()"/>&nbsp;	
				<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="关闭" onclick="closeWindows()"/>
			</div>
		</div>
		</fieldset>
		</form>
<script>
function win(){ 
    var radios = document.getElementsByTagName("input"); 
     for(var i = 0 ;i<radios.length ; i++){ 
         if(radios[i].type=="checkbox"   && radios[i].checked){ 
            alert(radios[i].value);//txtJDRY是要显示在父页面中那个文本框里的文本框的id 
         } 
     } 
    window.close(); 
 } 
</script>
</body>
</html>