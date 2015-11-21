<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>课程管理</title>
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
        <form class="form-search " action="#">
            <div data-uk-grid-margin="" class="uk-grid">
                <div class="uk-width-medium-3-10">
                    <div class="md-input-wrapper"><label for="product_search_name"></label><input type="text" id="product_search_name" name="search_LIKE_courseName" class="md-input" value="${param.search_LIKE_courseName}"><span class="md-input-bar"></span></div>
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
            <div class="row-fluid" align="right">
                    <div class="uk-grid">
                        <div class="uk-width-1-1">
                            <a href="${ctx }/course/create" class="md-btn md-btn-flat md-btn-flat-primary" id="add_btn" >新增课程</a>
                        </div>
                    </div>
            </div>

        <div class="uk-accordion" data-uk-accordion="" style="width:100%">
            <c:set var="no" value="1"></c:set>
            <c:forEach items="${course.content }" var="cou">
                <h3 class="uk-accordion-title">
                        ${ no}、${ cou.courseName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <c:if test="${null!=cou.remark&&''!=cou.remark}">
                      说明：${ cou.remark}
                  </c:if>


                </h3>
                <div class="uk-accordion-content">
                    <c:forEach items="${ cou.project}" var="pro">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${pro.projectName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:if test="${null!=pro.remark&&''!=pro.remark}">
                            说明：${pro.remark}
                        </c:if>

                        </br>
                    </c:forEach>
                </div>
                <c:set var="no" value="${no+1 }"></c:set>
                <div align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${ctx }/course/delete/${cou.id}?projectId=${projectId}"><i class="md-icon material-icons"></i></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${ctx }/course/update/${cou.id}"><i class="md-icon material-icons"></i></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${ctx }/project/add/${cou.id}"><img alt="" src="${ctx }/static/images/edit_add.png"></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;</div>
            </c:forEach>
            <tags:pagination paginationSize="10" page="${course }"></tags:pagination>
        </div>
    </div>
</div>

</body>
</html>