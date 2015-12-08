<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/admin/user/update" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<fieldset>
			<legend><b>当前位置:>>用户管理>>用户修改</b></legend>
				<div class="md-card"> 
			     	<div class="md-card-content"> 
				     <div class="parsley-row"> 
						<label for="register_username">登录名:</label>
							<input type="text" value="${user.loginName}" class="md-input" disabled="" required=""/>
					</div>
					<div class="parsley-row"> 
						<label for="register_username">用户名:</label>
							<input type="text" id="name" name="name" value="${user.name}" class="md-input" required=""/>
					</div>
					<div class="parsley-row"> 
						<label for="register_username">所属班级:</label>
								<select name="ssClass.id">
									<c:forEach var="s" items="${classLists }">
										<option value="${s.id }" 
										<c:if test="${ssClass.id==s.id }">selected="selected" </c:if>
										>${s.className }</option>
									</c:forEach>
								</select>
					</div>
					<div class="parsley-row"> 
						<label for="register_password">密码:</label>
							<input type="password" id="plainPassword" name="plainPassword" class="md-input" placeholder="...Leave it blank if no change"/>
					</div>
					<div class="parsley-row">
						<label for="register_password_repeat" class="control-label">确认密码:</label>
							<input type="password" id="confirmPassword" name="confirmPassword" class="md-input" equalTo="#plainPassword" />
					</div>
					<div class="parsley-row">
						<label for="register_date">注册日期:</label>
							<span class="help-inline" style="padding:5px 0px"><fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></span>
					</div>
					<div class="form-actions" align="center">
						<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;	
						<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
