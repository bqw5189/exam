<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户管理</title>
	<!--  style type="text/css">
		.heading_list{
			color:#333333;
			font-size:18px;
			font-weight: bold;
		}
	</style> -->
    <script>
        function uploadFile(){
            var uploadForm = document.getElementById("uploadForm");
            if(undefined != uploadForm){
                modal = UIkit.modal.blockUI('<div class=\'uk-text-center\'><div class="md-preloader"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="16" width="16" viewbox="0 0 75 75"><circle cx="37.5" cy="37.5" r="33.5" stroke-width="8" /></svg></div> 导入学生...</div>');
                uploadForm.submit();
            }
        }
    </script>
</head>

<body>
<c:if test="${not empty message}">
    <div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
</c:if>
<div class="md-card">
    <div class="md-card-content">
        <div><b>当前位置:>>用户管理</b></div>
        <div class="row-fluid" align="right">
            <a href="${ctx }/register" class="md-btn md-btn-flat md-btn-flat-primary" id="add_btn">新增用户</a>
        </div>
	<table id="dt_default" class="uk-table" >
		<thead><tr><th>所属班级</th><th>登录名</th><th>用户名</th><th>注册时间<th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.ssClass.className}</a></td>
				<td><a href="${ctx}/admin/user/update/${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>
					<fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒" />
				</td>
				<td><a href="${ctx}/admin/user/delete/${user.id}" class="md-btn md-btn-flat md-btn-flat-primary"><i class="md-icon material-icons"></i></a>
                    <a href="${ctx}/admin/user/update/${user.id}" class="md-btn md-btn-flat md-btn-flat-primary"><i class="md-icon material-icons"></i></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
</div>
    <div class="md-fab-wrapper">
        <div class="row-fluid" align="right">
            <form name="uploadForm" id="uploadForm" class="form-search " action="${ctx}/register/upload" method="post" enctype="multipart/form-data">
                <input type="hidden" name="projectId"  value="1">
                <div class="uk-grid">
                    <div class="uk-width-1-1">
                        <div class="uk-form-file uk-text-primary">
                            <a href="javascript:void(0)" class="md-fab md-fab-accent"> <i class="uk-icon-folder-open"></i> </a>
                            <input type="file"  name="file" id="file" onchange="uploadFile()">
                        </div>
                    </div>
                </div>
            </form>
        </div>


    </div>
</body>
</html>
