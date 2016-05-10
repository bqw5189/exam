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

    <!-- altair admin login page -->
    <link rel="stylesheet" href="${ctx}/static/login/css/login.css" />

</head>
<body class="login_page">
<%
    String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
    if(error != null){
%>

<script>
    alert("登录失败，重新录入");
</script>
<%
    }
%>

<!--中间-->
<div class="midbox">
    <div class="logo"></div>
    <div class="mid">
        <div class="loginbox">
            <form id="loginForm" action="${ctx}/login" method="post">
                <div class="yhm"> <b class="people"></b>
                    <label>用户名:</label><br/>
                    <input  type="text" id="username" name="username" required=""/>
                    <i></i> </div>
                <div class="mm"> <b class="key"></b>
                    <label>密码<span>码</span>:</label><br/>
                    <input  type="password" id="password" name="password" required value=""/>
                    <i></i> </div>

                <!--下拉模块-->
                <div class="selectbox_L">
                    <div class="selectInput_L">
                        <select name="className">
                            <option value="student">北校区大气PM2.5中多环芳烃分析</option>
                            <option value="ysfx">南校区大气PM2.5中元素分析</option>
                        </select>
                    </div>
                </div>
                <!--下拉模块 end-->

                <div class="login_buttom"> <a  class="on" href="javascript:void(0);" id="submitSignin" style="margin-right:8px;">登&nbsp;录</a> </div>
            </form>
        </div>
        <!--loginbox end-->

    </div>
    <div class="bottom">技术支持：北京东方仿真软件技术有限公司<br/>地址：北京朝阳区小关东里10号院润宇大厦707&nbsp;&nbsp;&nbsp;邮编：100027&nbsp;&nbsp;&nbsp;电话：010-64971654/6492</div>
</div>
<!--中间 end-->






 <script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/login/js/login.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script>
        $(function(){
            $("#submitSignin").click(function(){
                if ("" === $("#username").val()){
                    alert("请输入用户名！");
                    return;
                }

                if ("" === $("#password").val()){
                    alert("请输入密码！");
                    return;
                }
                $("#loginForm").submit();
            });
        });
	</script>
</body>
</html>

