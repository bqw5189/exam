<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                                            <script type="text/javascript">
                                                document.write('<a href="'+encodeURI("${ctx }/document?course=${pro.projectName}")+' <c:if test="${ projectId==pro.id}"> class="text-success" </c:if> ">${pro.projectName }</a>');
                                            </script>
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
        <div><b>当前位置:>>答案管理>>${courseName}</b></div>
        <h2 align="center">${user.name} <small>课程学习中表格文档答题汇总</small></h2>
        <div class="uk-accordion" data-uk-accordion="" style="width:100%">
            <c:set var="no" value="1"></c:set>
            <c:forEach items="${list }" var="l">
                <c:if test="${l.type != 'text'}">
                <h3 class="uk-accordion-title">
                        ${ no}、${l.title}&nbsp;&nbsp;${l.answerDate}
                </h3>
                <div class="uk-accordion-content">
                    <a href="${ctx}/static/temp/${l.fileName}">${l.answer}</a>
                </div>
                <c:set var="no" value="${no+1 }"></c:set>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
