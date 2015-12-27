<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>选项管理</title>
 <!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />
</head>
<body>
	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
	</c:if>
<div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
        <div><b>当前位置：>>试题管理>>试题选项</b></div>
    	<div align="right">
		<a href="${ctx }/question/createitem/${questionId}" class="md-btn md-btn-flat md-btn-flat-primary" id="add_btn" >新增选项</a>
		</div>
	     <table id="dt_default" class="uk-table" >
		<thead><tr><th style="width:8%">序号</th><th style="width:62%">选项内容</th><th style="width:12%">是否为答案</th><th style="width:8%">操作</th>
		</tr></thead>
		<tbody>
			<c:set var="no" value="1"></c:set>
			<c:forEach items="${itemlist }" var="item">
				<tr>
					<td>${ no}</td>
					<td>
					${item.selectCont }
					</td>
					<td>
						<c:if test="${item.isAnswer==1 }">是</c:if>
						<c:if test="${item.isAnswer==0 }">否</c:if>
					</td>
					<td>
					<a href="#" class="deleteItem" data-id="${item.id}" data-questionid="${quesionId}"><i class="md-icon material-icons"></i></a>
					<a href="${ctx }/question/updateitem/${item.id}"><i class="md-icon material-icons"></i></a>
					</td>
				</tr>
				<c:set var="no" value="${no+1 }"></c:set>
			</c:forEach>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<div align="center" >
				<a href="${ctx}/question" class="md-btn md-btn-primary">返回</a>
				<font color="red">注意：指定正确答案后试卷才生效</font>
				</div>
	</div>
</div>
<script>
    $(function(){
        $(".deleteItem").click(function(){
            var id = $(this).attr("data-id");
            var questionid = $(this).attr("data-questionid");
            if(confirm("确定要删除选项吗？")){
                window.location.href="${ctx }/question/deleteitem/"+id+"questionId="+questionid;
            }
        });


    })
</script>
</body>

</html>