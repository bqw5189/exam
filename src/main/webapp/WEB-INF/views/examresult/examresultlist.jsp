<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="reqUrl" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<html>
<head>
<title>查看考试结果</title>
<!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />
</head>
<body>
	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
	</c:if>
        <div class="md-card">
	    <div class="md-card-content">
	        <div class="uk-grid" data-uk-grid-margin="">
	            <div class="uk-width-large-1-1">
	                <ul id="kUI_menu">
	                    <c:forEach items="${course }" var="cour">
	                    <li> ${cour.courseName }
	                        <c:if test="${fn:length(cour.project)>0}">
	                        <ul>
	                            <c:forEach items="${cour.project }" var="pro">
	                            <li>
	                                <a href="${ctx }/examresult/${pro.id}"
	                                        <c:if test="${ projectId==pro.id}">
	                                            class="text-success"
	                                        </c:if>
	                                        >${pro.projectName }</a>
	                            </li>
	                            </c:forEach>
	                        </ul>
	                        </c:if>
	                    </li>
	                    </c:forEach>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
   <div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
        <div><b>当前位置：>>学生答题情况>>查看考试结果</b></div>
        <table id="dt_default" class="uk-table" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>序号</th>
                <th>试卷名称</th>
                <th>试卷说明</th>
                <th>答题时间(分钟)</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="no" value="1"></c:set>
            <c:forEach items="${makexam }" var="exam">
                <tr>
                    <td>${ no}</td>
                    <td>${ exam.examName }</td>
                    <td>${ exam.examRemark}</td>
                    <td>${ exam.examTime}</td>
                    <td>
                        <c:if test="${exam.state==1 }">开始考试</c:if>
                        <c:if test="${exam.state==0 }">未考试</c:if>
                        <c:if test="${exam.state==2 }">考试完成 未排名</c:if>
                        <c:if test="${exam.state==3 }">已排名</c:if>
                    </td>
                    <td>
                        <c:if test="${exam.state==2 }">
						<a href="javascript:void(0);" onclick="ordeResult(${exam.id})" class="md-btn md-btn-flat md-btn-flat-primary"><i class="material-icons"></i>排名</a>
						</c:if>
						<c:if test="${exam.state>0 }">
						<a href="${ctx }/examresult/seeresult/${exam.id}" class="md-btn md-btn-flat md-btn-flat-primary"><i class="material-icons"></i>查看考试结果</a>
						</c:if>
                    </td>
                </tr>
                <c:set var="no" value="${no+1 }"></c:set>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<%--<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
     
        
	<script type="text/javascript">
	$(document).ready(function(){
		$("search_LIKE_questionCont").focus();
	});
	function ordeResult(id){
		$.get("${reqUrl}/api/v1/ajaxmakexam/order/"+id,function(data){
			location.reload();
		});
		<%--$.ajax({--%>
			<%--url:"${reqUrl}/api/v1/ajaxmakexam/order/"+id,--%>
			<%--data:{},--%>
			<%--dataType:"json",--%>
			<%--success:function (data){--%>
				<%--alert(1);--%>
				<%--location.reload();--%>
				<%--},--%>
			<%--error:function(data){--%>
				<%--//location.reload(true);--%>
			<%--}--%>
		<%--});--%>
		
	}
	</script>
</body>
</html>