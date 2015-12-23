<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>答案管理</title>
	<!--  style type="text/css">
		.heading_list{
			color:#333333;
			font-size:18px;
			font-weight: bold;
		}
	</style> -->

</head>

<body>
<c:if test="${not empty message}">
    <div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
</c:if>

<div class="md-card">
    <div class="md-card-content">
        <div><b>当前位置:>>答案管理</b></div>
	<table id="dt_default" class="uk-table" >
		<thead><tr><th>学生</th><th>标题</th><th>答案</th></tr></thead>
		<tbody>
		<c:forEach items="${list}" var="l">
			<tr>
				<td>${l.email}</td>
                <td>${l.title}</td>
                <td>${l.answer}</td>
                </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
</div>

</body>
</html>
