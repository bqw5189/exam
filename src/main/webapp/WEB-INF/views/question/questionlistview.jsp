<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>试题查看</title>
<!-- kendo UI -->
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="${ctx}/static/altair/bower_components/kendo-ui/styles/kendo.material.min.css" />
</head>
<script>
	$(document).ready(function(){
		$("search_LIKE_questionCont").focus();
	});
</script>
<body>

<div class="md-card">
    <div class="md-card-content">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-large-1-1">
                <ul id="kUI_menu">
         	<c:forEach items="${course }" var="cour">
	            	 <li class="has_submenu">
	            	 <span class="icon-folder-open" ></span>
	                     	${cour.courseName }
	                     <ul>
	                     	<c:forEach items="${cour.project }" var="pro">
	                         <li>
	                         <span class="icon-leaf" ></span>
	                          <a href="${ctx }/questionsee/${pro.id}"
	                         <c:if test="${ projectId==pro.id}">
	                         		class="text-success"
	                         </c:if>
	                         >${pro.projectName }</a></li>
	                         </c:forEach>
	                     </ul>
	                 </li>
	            </c:forEach>
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
                    <div><b>当前位置：>>试题查看</b></div>

                </div>
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
		<c:if test="${question.totalElements == 0}">
			没有找到记录
		</c:if>
		<c:if test="${question.totalElements > 0}">


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
                     <ol type="A">
		         	<c:forEach items="${ que.selectItems}" var="item">
		         	    <li>
		         		${item.selectCont }&nbsp;&nbsp;&nbsp;&nbsp;
		         		<c:if test="${item.isAnswer==1 }">
		         			<img alt="" src="${ctx }/static/images/button_ok.png">
						</c:if>
                        </li>
						</br>
					<c:set var="itemno" value="${itemno+1 }"></c:set>
		         	</c:forEach>
                     </ol>
		         </div> 
				<c:set var="no" value="${no+1 }"></c:set>
			</c:forEach>
			<tags:pagination paginationSize="10" page="${question }"></tags:pagination>
		</div>

		</c:if>
	</div>
</div>
</body>
</html>