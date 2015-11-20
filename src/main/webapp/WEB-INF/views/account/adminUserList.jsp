<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="k-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a>${message}</div>
	</c:if>
	<div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
	<table id="dt_default" class="uk-table" >
		<thead><tr><th>登录名</th><th>用户名</th><th>注册时间<th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td><a href="${ctx}/admin/user/update/${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>
					<fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" />
				</td>
				<td><a href="${ctx}/admin/user/delete/${user.id}" class="md-btn md-btn-flat md-btn-flat-primary"><i class="md-icon material-icons"></i></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
</div>
	
</body>
</html>
