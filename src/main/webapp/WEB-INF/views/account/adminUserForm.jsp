<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>

<fieldset>
    <legend><b>当前位置:>>用户管理>>用户修改</b></legend>

<div class="md-card" id="login_card">
    <div class="md-card-content large-padding" id="login_form">
        <div class="login_heading">
            <div class="user_avatar"></div>
        </div>

        <form id="inputForm" action="${ctx}/admin/user/update" method="post" class="uk-form-stacked">
            <input type="hidden" name="id" value="${user.id}"/>



            <div class="uk-grid" data-uk-grid-margin="">
                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label for="ss_class_id">所属班级:</label>
                        <select name="user.ssClass.id" id="ss_class_id" class="md-input">
                            <c:forEach var="s" items="${classLists }">
                                <option value="${s.id }"
                                        <c:if test="${user.ssClass.id==s.id }">selected="selected" </c:if>
                                        >${s.className }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label for="register_username">登录名:</label>
                        <input type="text" value="${user.loginName}" id="register_username" class="md-input" disabled="" required=""/>
                    </div>
                </div>
                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label for="plainPassword">密码:</label>
                        <input type="password" id="plainPassword" name="plainPassword" class="md-input"/>
                    </div>
                </div>
                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label for="confirmPassword" class="control-label">确认密码:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="md-input" equalTo="#plainPassword" />
                    </div>
                </div>
                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label>注册日期:</label>
                        <span class="help-inline" style="padding:5px 0px"><fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></span>
                    </div>
                </div>
            </div>
            <div class="uk-margin-medium-top" align="center">
                <input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;
                <input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
            </div>
        </form>
    </div>
</div>
</fieldset>

	<script>
		$(document).ready(function() {
//			//聚焦第一个输入框
//			$("#name").focus();
//			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
