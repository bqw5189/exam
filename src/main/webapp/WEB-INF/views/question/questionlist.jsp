<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>试题管理</title>
 <!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />

    <script>
        function uploadFile(){
            var uploadForm = document.getElementById("uploadForm");
            if(undefined != uploadForm){
                modal = UIkit.modal.blockUI('<div class=\'uk-text-center\'><div class="md-preloader"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="16" width="16" viewbox="0 0 75 75"><circle cx="37.5" cy="37.5" r="33.5" stroke-width="8" /></svg></div> 导入题库...</div>');
                uploadForm.submit();
            }
        }
    </script>
    <style>
        #page_content_inner {
            padding: 24px 24px 0px;
        }
    </style>
</head>
<body>

<div id="top_bar">
    <div class="md-top-bar">
        <div class="uk-width-large-8-10 uk-container-center">
            <c:forEach items="${course }" var="cour">
                <div data-uk-dropdown="" class="uk-button-dropdown" aria-haspopup="true" aria-expanded="false">
                    <button class="md-btn"> ${cour.courseName } <c:if test="${fn:length(cour.project)>0}"><i class="material-icons"></i></c:if></button>
                    <c:if test="${fn:length(cour.project)>0}">
                        <div class="uk-dropdown uk-dropdown-small" style="min-width: 160px;">
                            <ul class="uk-nav uk-nav-dropdown uk-panel">
                                <c:forEach items="${cour.project }" var="pro">
                                    <li>
                                        <a href="${ctx }/question/${pro.id}"
                                                <c:if test="${ projectId==pro.id}">
                                                    class="text-success"
                                                </c:if>
                                                >${pro.projectName }</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
</div>

	<c:if test="${not empty message}">
		<div data-uk-alert="" class="uk-alert uk-alert-danger uk-width-large-8-10 uk-container-center"><a class="uk-alert-close uk-close" href="#"></a> ${message}</div>
        <br/>
	</c:if>


<div class="md-card-list-wrapper" id="mailbox">
    <div class="uk-width-large-8-10 uk-container-center">
        <div class="md-card-list">

            <div class="md-card-list-header heading_list">
                题库
            </div>
            <ul class="hierarchical_slide">
                <c:forEach items="${question.content }" var="que">
                <li>
                    <div class="md-card-list-item-menu" data-uk-dropdown="{mode:'click'}">
                        <a href="#" class="md-icon material-icons"></a>
                        <div class="uk-dropdown uk-dropdown-flip uk-dropdown-small">
                            <ul class="uk-nav">
                                <li><a href="${ctx }/question/update/${que.id}"><i class="material-icons"></i> 修改</a></li>
                                <li><a href="${ctx }/question/itemlist/${que.id}"><i class="material-icons"></i> 管理</a></li>
                                <li><a href="${ctx }/question/delete/${que.id}?projectId=${projectId}"><i class="material-icons"></i> 删除</a></li>
                            </ul>
                        </div>
                    </div> <span class="md-card-list-item-date">${ que.questionScore}</span>

                    <div class="md-card-list-item-avatar-wrapper">
                        <span class="md-card-list-item-avatar md-bg-cyan"><c:if test="${que.type==1 }">单</c:if>
					<c:if test="${que.type==2 }">多</c:if></span>
                    </div>
                    <div class="md-card-list-item-subject">
                        <span>${ que.questionCont}</span>
                    </div>
                    <div class="md-card-list-item-content-wrapper">
                        <div class="md-card-list-item-content">
                            <ol style="list-style-type: upper-alpha">
                                <c:forEach items="${ que.selectItems}" var="item">
                                <li>${item.selectCont } <c:if test="${item.isAnswer==1 }">
                                    <i class="uk-icon-check"></i>
                                </c:if></li>
                                </c:forEach>
                            </ol>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <br/>
    <tags:pagination paginationSize="10" page="${question }"></tags:pagination>
    <br/>
</div>
<c:if test="${null!=projectId}">
<div class="md-fab-wrapper">
    <div class="row-fluid" align="right">
        <form name="uploadForm" id="uploadForm" class="form-search " action="${ctx}/question/upload/${projectId}" method="post" enctype="multipart/form-data">
            <input type="hidden" name="projectId"  value="${projectId}">
            <div class="uk-grid">
                <div class="uk-width-1-1">
                    <div class="uk-form-file uk-text-primary">
                        <a href="javascript:void(0)" class="md-fab md-fab-accent"> <i class="uk-icon-archive"></i> </a>
                        <input type="file"  name="file" id="file" onchange="uploadFile()">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <a href="${ctx }/question/create/${projectId}" class="md-fab md-fab-accent"> <i class="material-icons"></i> </a>
</div>
</c:if>
<%--<div class="md-card">--%>
<%--<div class="md-card-content"> --%>
		<%--<form class="form-search " action="#">--%>
			<%--<input type="hidden" name="projectId" id="projectId" value="${projectId}">--%>
			<%--<div data-uk-grid-margin="" class="uk-grid">--%>
       <%--<div class="uk-width-medium-3-10">--%>
        <%--<div class="md-input-wrapper"><label for="product_search_name"></label><input type="text" id="product_search_name" name="search_LIKE_questionCont" class="md-input" value="${param.search_LIKE_questionCont}"><span class="md-input-bar"></span></div>--%>

       <%--</div>--%>
       <%--<div class="uk-width-medium-2-10 uk-text-center">--%>
	        <%--<button type="submit" class="md-btn md-btn-primary uk-margin-small-top" id="search_btn">搜索</button>--%>
       <%--</div>--%>
      <%--</div>--%>
       <%--</form>--%>
     <%--</div>--%>
 <%--</div>--%>

</body>
</html>