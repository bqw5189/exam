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
                                <a href="${ctx }/question/${pro.id}"
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
<div class="md-card">
<div class="md-card-content"> 
		<form class="form-search " action="#">
			<input type="hidden" name="projectId" id="projectId" value="${projectId}">
			<div data-uk-grid-margin="" class="uk-grid">
       <div class="uk-width-medium-3-10">
        <div class="md-input-wrapper"><label for="product_search_name"></label><input type="text" id="product_search_name" name="search_LIKE_questionCont" class="md-input" value="${param.search_LIKE_questionCont}"><span class="md-input-bar"></span></div>

       </div>
       <div class="uk-width-medium-2-10 uk-text-center">
	        <button type="submit" class="md-btn md-btn-primary uk-margin-small-top" id="search_btn">搜索</button>
       </div>
      </div>
       </form>
     </div>
 </div>
<div class="md-card uk-margin-medium-bottom">
    <div class="md-card-content">
		<c:if test="${null!=projectId}">
	    <div class="row-fluid" align="right">

            <form name="uploadForm" id="uploadForm" class="form-search " action="${ctx}/question/upload/${projectId}" method="post" enctype="multipart/form-data">
                <input type="hidden" name="projectId"  value="${projectId}">
                <div class="uk-grid">
                    <div class="uk-width-1-1">
                        <div class="uk-form-file uk-text-primary">
                            题库导入
                            <input type="file"  name="file" id="file" onchange="uploadFile()">
                        </div>
                        <a href="${ctx }/question/create/${projectId}" class="md-btn md-btn-flat md-btn-flat-primary" id="add_btn" >新增试题</a>
                    </div>
                </div>
            </form>
	    </div>
	    </c:if>
	    <div class="uk-accordion" data-uk-accordion="" style="width:100%"> 
				<c:set var="no" value="1"></c:set>
				<c:forEach items="${question.content }" var="que">
				<h3 class="uk-accordion-title">	
					${ no}、${ que.questionCont}&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${que.type==1 }">单选</c:if>
					<c:if test="${que.type==2 }">多选</c:if>
					(${ que.questionScore})
					</h3>
		         <div class="uk-accordion-content">
		          <c:set var="itemno" value="1"></c:set>
		         	<c:forEach items="${ que.selectItems}" var="item">
		         	${ itemno}、
		         		${item.selectCont }&nbsp;&nbsp;&nbsp;&nbsp;
		         		<c:if test="${item.isAnswer==1 }">
		         			<img alt="" src="${ctx }/static/images/button_ok.png">
						</c:if>
						</br>
					<c:set var="itemno" value="${itemno+1 }"></c:set>
		         	</c:forEach>
		         </div> 
				<c:set var="no" value="${no+1 }"></c:set>
				<div align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${ctx }/question/delete/${que.id}?projectId=${projectId}"><i class="md-icon material-icons"></i></a> 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${ctx }/question/update/${que.id}"><i class="md-icon material-icons"></i></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${ctx }/question/itemlist/${que.id}"><img alt="" src="${ctx }/static/images/edit_add.png"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</c:forEach>
			<tags:pagination paginationSize="10" page="${question }"></tags:pagination>
		</div>
	</div>
</div>

</body>
</html>