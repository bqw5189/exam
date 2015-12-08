<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>在线考试 - 注册</title>
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
	
    <link href="${ctx}/static/altair/fonts.googleapis.com/fonts.css" rel="stylesheet" type="text/css" />
    <!-- uikit -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/uikit/css/uikit.almost-flat.min.css" />
    <!-- altair admin login page -->
    <link rel="stylesheet" href="${ctx}/static/altair/assets/css/login_page.min.css" />
    
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					loginName: {
						remote: "${ctx}/register/checkLoginName"
					}
				},
				messages: {
					loginName: {
						remote: "用户登录名已存在"
					}
				}
			});
		});
	</script>
</head>

<body>
	<form id="inputForm" action="${ctx}/register" method="post" class="form-horizontal">
		<fieldset>
			<legend><b>当前位置:>>用户管理>>用户注册</b></legend>
			<div class="md-card"> 
		     <div class="md-card-content"> 
			<div class="uk-width-medium-1-2">
				<label for="loginName" class="control-label">登录名:</label>
					<input type="text" id="user_edit_uname_control" name="loginName" class="md-input" required/>
			</div>
			<div class="uk-width-medium-1-2">
				<label for="name" class="control-label">用户名:</label>
				<input type="text" id="user_edit_uname_control" name="name" class="md-input" required/>
			</div>
			<div class="uk-width-medium-1-2"> 
				<label for="register_username" class="control-label">所属班级:</label>
					<select name="ssClass.id">
						<c:forEach var="s" items="${classLists }">
							<option value="${s.id }" 
							<c:if test="${ssClass.id==s.id }">selected="selected" </c:if>
							>${s.className }</option>
						</c:forEach>
					</select>
			</div>
			<div class="uk-width-medium-1-2">
				<label for="plainPassword" class="control-label">密码:</label>
					<input type="password" id="plainPassword" name="plainPassword" class="md-input" required/>
			</div>
			<div class="uk-width-medium-1-2">
				<label for="confirmPassword" class="control-label">确认密码:</label>
					<input type="password" id="confirmPassword" name="confirmPassword" class="md-input" equalTo="#plainPassword" required/>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
			</div>
			</div>
			</div>
		</fieldset>
	</form>
</body>
</html>
