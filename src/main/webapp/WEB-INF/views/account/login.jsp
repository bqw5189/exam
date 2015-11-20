<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no" />
    <link rel="icon" type="image/png" href="${ctx}/static/altair/assets/img/favicon-16x16.png" sizes="16x16" />
    <link rel="icon" type="image/png" href="${ctx}/static/altair/assets/img/favicon-32x32.png" sizes="32x32" />
    <title>在线考试 - 登录</title>
    <link href="${ctx}/static/altair/fonts.googleapis.com/fonts.css" rel="stylesheet" type="text/css" />
    <!-- uikit -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/uikit/css/uikit.almost-flat.min.css" />
    
  <!-- flag icons --> 
  <link rel="stylesheet" href="${ctx}/static/altair/assets/icons/flags/flags.min.css" media="all" /> 
  <!-- altair admin --> 
  <link rel="stylesheet" href="${ctx}/static/altair/assets/css/main.min.css" media="all" /> 
  
    <!-- altair admin login page -->
    <link rel="stylesheet" href="${ctx}/static/altair/assets/css/login_page.min.css" />

</head>
<body class="login_page">
<%
    String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
    if(error != null){
%>

<div data-uk-alert="" class="uk-alert uk-alert-danger">
    <a class="uk-alert-close uk-close" href="#"></a> 登录失败，重新录入
</div>
<%
    }
%>

<div class="login_page_wrapper">
    <div class="md-card" id="login_card">
        <div class="md-card-content large-padding" id="login_form">
            <div class="login_heading">
                <div class="user_avatar"></div>
            </div>
            
            <form id="loginForm" action="${ctx}/login" method="post" class="uk-form-stacked">
                
                <div class="parsley-row"> 
                    <label for="username">登录名</label>
                    <input class="md-input" type="text" id="username" name="username" required=""/>
                </div>
                <div class="parsley-row">
                    <label for="password">密码</label>
                    <input class="md-input" type="password" id="password" name="password" required/>
                </div>
                 <div class="uk-margin-medium-top">
                	<label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe"/> 记住我</label>
                	<a href="#" id="login_help_show" class="uk-float-right">帮助?</a>
                </div>
                <div class="uk-margin-medium-top" align="center">
                    <button type="submit" class="md-btn md-btn-primary">登陆</button>
                    <a class="md-btn md-btn-primary" href="#" id="signup_form_show">注册</a>
                </div>
            </form>
        </div>
        <div class="md-card-content large-padding" id="register_form" style="display: none"> 
	     <button type="button" class="uk-position-top-right uk-close uk-margin-right uk-margin-top back_to_login"></button> 
	     <h2 class="heading_a uk-margin-medium-bottom">注册一个账号</h2> 
	     <form id="inputForm" action="${ctx}/register" method="post"> 
	     
	      <div class="parsley-row"> 
	       <label for="register_username">登录名</label> 
	       <input class="md-input" type="text" id="loginName" name="loginName" required=""/> 
	      </div> 
	      <div class="parsley-row"> 
	       <label for="register_username">用户名</label> 
	       <input class="md-input" type="text" id="name" name="name" required=""/> 
	      </div> 
	      <div class="parsley-row"> 
	       <label for="register_password">密码</label> 
	       <input class="md-input" type="password" id="plainPassword" name="plainPassword" required=""/> 
	      </div> 
	      <div class="parsley-row"> 
	       <label for="register_password_repeat">确认密码</label> 
	       <input class="md-input" type="password" id="confirmPassword" name="confirmPassword" required=""/> 
	      </div> 
	      <!-- div class="uk-form-row"> 
	       <label for="register_email">E-mail</label> 
	       <input class="md-input" type="text" id="register_email" name="register_email" /> 
	      </div --> 
	      <div class="uk-margin-medium-top" align="center"> 
	       <input id="submit_btn" class="md-btn md-btn-primary md-btn-block md-btn-large" type="submit" value="确认注册"/>&nbsp;	
	      </div> 
	     </form> 
	    </div> 
    </div>
    
</div>



<!-- common functions -->
<script src="${ctx}/static/altair/assets/js/common.min.js"></script>
<!-- uikit functions -->
<script src="${ctx}/static/altair/assets/js/uikit_custom.min.js"></script>
<!-- altair core functions -->
<script src="${ctx}/static/altair/assets/js/altair_admin_common.min.js"></script>
<script>
    // load parsley config (altair_admin_common.js)
    altair_forms.parsley_validation_config();
    </script> 
    
  <script src="${ctx}/static/altair/bower_components/parsleyjs/dist/parsley.min.js"></script> 
<!-- altair login page functions -->
<script src="${ctx}/static/altair/assets/js/pages/login.min.js"></script>

<%-- <script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script> --%>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script>
		/* $(document).ready(function() {
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
		}); */
	</script>
</body>
</html>

