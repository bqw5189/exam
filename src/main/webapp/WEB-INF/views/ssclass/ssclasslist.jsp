<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>班级管理</title>
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
            <div><b>当前位置：>>班级管理</b></div>
        <div align="right">

        </div>
        <table id="dt_default" class="uk-table" >
            <thead><tr><th style="width:8%">序号</th><th style="width:62%">班级名称</th><th style="width:12%">说明</th><th style="width:8%">操作</th>
            </tr></thead>
            <tbody>
            <c:set var="no" value="1"></c:set>
            <c:forEach items="${ssclass }" var="cla">
                <tr>
                    <td>${ no}</td>
                    <td>
                            ${cla.className }
                    </td>
                    <td>
                        ${cla.classRemark}
                    </td>
                    <td>
                        <a href="#" class="class_delete" data-id="${cla.id}"><i class="md-icon material-icons"></i></a>
                        <a href="${ctx }/ssclass/update/${cla.id}"><i class="md-icon material-icons"></i></a>
                    </td>
                </tr>
                <c:set var="no" value="${no+1 }"></c:set>
            </c:forEach>
            </tbody>
            <tfoot>
            </tfoot>
        </table>
    </div>
</div>
<div class="md-fab-wrapper">
    <a href="${ctx }/ssclass/create" class="md-fab md-fab-accent" style="font-size: 12px;color:#fff;padding-top: 16px">新增<br/>班级</a>
</div>
<script>

    $(function(){
        $(function(){
            $("#dt_default").delegate('.class_delete','click', function(){
                var id = $(this).attr("data-id");
                if(confirm("确认删除此班级吗？")){
                    window.location.href="${ctx}/ssclass/delete/"+id;
                }
            });
        });
    });
</script>
</body>
</html>