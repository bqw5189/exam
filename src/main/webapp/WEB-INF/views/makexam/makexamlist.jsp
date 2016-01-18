<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="reqUrl" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<html>
<head>
<title>试卷管理</title>
    <!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />
</head>
<body>
<c:if test="${not empty message}">
	<div data-uk-alert="" class="uk-alert uk-alert-danger">
    <a class="uk-alert-close uk-close" href="#"></a> ${message}
</div>
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
                                <a href="${ctx }/makexam/${pro.id}"
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
        <div><b>当前位置：>>制定试卷</b></div>
		    <c:if test="${null!=projectId}">
					    <div class="row-fluid" align="right">
								<a href="${ctx }/makexam/create/${projectId}" class="md-btn md-btn-flat md-btn-flat-primary" id="add_btn">新增试卷</a>
					    </div>
				    </c:if>
        <table id="dt_default" class="uk-table" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th width="5%">序号</th>
                <th width="30%">试卷名称</th>
                <th width="30%">试卷说明</th>
                <th width="5%">答题时间(分钟)</th>
                <th width="10%">创建时间</th>
                <th width="5%">状态</th>
                <th width="15%">操作</th>
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
                    <td>${ exam.examBeginDate}</td>
                    <td>
                        <c:if test="${exam.state==1 }">开始考试</c:if>
                        <c:if test="${exam.state==0 }">未考试</c:if>
                        <c:if test="${exam.state==2 }">考试完成</c:if>
                        <c:if test="${exam.state==3 }">已排名</c:if>
                    </td>
                    <td>
                        <c:if test="${exam.state==0 }">
                            <a href="#" class="delete-exam" data-id="${exam.id}" data-project-id="${projectId}"><i class="md-icon material-icons"></i></a>
                            <a href="${ctx }/makexam/update/${exam.id}?projectId=${projectId}" ><i class="md-icon material-icons"></i>修改</a>
                        </c:if>
                        <c:if test="${exam.state==0 }">
                            <a href="${ctx }/makexam/oper/${exam.id}?state=1&projectId=${projectId}">
					             <i class="material-icons"></i>开始考试</a>
                        </c:if>
                        <c:if test="${exam.state==1 }">
                            <a href="${ctx }/makexam/oper/${exam.id}?state=2&projectId=${projectId}" class="md-btn md-btn-flat md-btn-flat-primary"><i class="md-icon material-icons"></i>结束考试</a>
                        </c:if>
                        <c:if test="${exam.state==2 }">
                            <a href="javascript:void(0);" onclick="ordeResult(${exam.id})" class="md-btn md-btn-flat md-btn-flat-primary"><i class="material-icons"></i>排名</a>
                        </c:if>
                        <c:if test="${exam.state==3 }">
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
    $(function(){
        $("search_LIKE_questionCont").focus();
        $(".delete-exam").click(function(){
            var id = $(this).attr("data-id");
            var project_id = $(this).attr("data-project-id");
            window.location.href="${ctx }/makexam/delete/"+id+"?projectId="+project_id;
        });
    });

	function ordeResult(id){
		<%--$.ajax({--%>
			<%--url:"${reqUrl}/api/v1/ajaxmakexam/order/"+id,--%>
			<%--data:{},--%>
			<%--dataType:"json",--%>
			<%--success:function (data){--%>
				<%--location.reload(true);				--%>
				<%--},--%>
			<%--error:function(data){--%>
				<%--location.reload(true);--%>
			<%--}--%>
		<%--});--%>
		
	}

	</script>

</body>
</html>