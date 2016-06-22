<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>编辑班级</title>
</head>
<body>
<form id="inputForm" action="${ctx}/ssclass/create/save" method="post" class="uk-form-stacked">
    <input type="hidden" name="id" value="${ssclass.id}"/>
    <fieldset>
        <legend><b>当前位置：>>班级管理>>班级编辑</b></legend>
        <div class="md-card">
            <div class="md-card-content large-padding">
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="uk-form-row">班级名称<span class="req">*</span></label>
                        <input class="md-input" type="text" id="uk-form-row" name="className" required="true" value="${ssclass.className}" maxlength="25"/>
                    </div>
                </div>
                <br/>
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="uk-form-row">说明<span class="req"></span></label>
			          <input class="md-input" name="classRemark" id="user_edit_personal_info_control" maxlength="40" type="text" value="${ssclass.classRemark}"/>
                    </div>
                </div>
                <br/>
                <div align="center">
                    <input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;
                    <input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
                </div>
            </div>
        </div>
    </fieldset>
</form>


<%--<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>--%>


<script>
    /* $(document).ready(function(){
        var i = $("#inputForm");
        i.parsley().on("form:validated",
                function() {
                    altair_md.update_input(i.find(".md-input-danger"));

                }).on("field:validated",
                function(i) {
                    $(i.$element).hasClass("md-input") && altair_md.update_input($(i.$element))
                })

    }); */
</script>
</body>
</html>
