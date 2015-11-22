<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>编辑选项</title>
</head>
<body>
<h3 class="heading_b uk-margin-bottom">试题管理 -> 试题信息 -> 选项信息</h3>
<div class="md-card">
    <div class="md-card-content large-padding">
        <form id="inputForm" action="${ctx}/question/createitem?questionId=${item.question.id}" method="post" class="uk-form-stacked">
            <input type="hidden" name="id" value="${item.id}"/>
            <input type="hidden" name="item.question.id" value="${item.question.id}"/>

            <div class="uk-grid">
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="settings_page_description">选项内容</label>
                        <textarea class="md-input" name="selectCont" id="settings_page_description" required="" cols="10" rows="8" data-parsley-trigger="keyup" data-parsley-minlength="5" data-parsley-maxlength="100" data-parsley-validation-threshold="10" data-parsley-minlength-message="">${item.selectCont}</textarea>
                    </div>
                </div>
            </div>
            <div class="uk-grid" data-uk-grid-margin="">
                <div class="uk-width-medium-1-1">
                    <div class="uk-form-row parsley-row">
                        <label for="isAnswer" class="uk-form-label">是否为答案<span class="req">*</span></label>
                        <span class="icheck-inline"> <input type="radio" name="isAnswer" id="val_radio_isAnswer1" value="1" data-md-icheck="" required="" checked="checked" /> <label for="val_radio_isAnswer1" class="inline-label">是</label> </span>
                        <span class="icheck-inline"> <input type="radio" name="isAnswer" id="val_radio_isAnswer2" value="0" data-md-icheck="" /> <label for="val_radio_isAnswer2" class="inline-label">否</label> </span>
                    </div>
                </div>
            </div>
            <div class="uk-grid">
                <div class="uk-width-1-1">
                    <input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>


<script>
    $(document).ready(function(){
        $maskedInput = $(".masked_input"),
        $maskedInput.length && $maskedInput.inputmask()
        var i = $("#inputForm");
        i.parsley().on("form:validated",
        function() {
            altair_md.update_input(i.find(".md-input-danger"));

        }).on("field:validated",
        function(i) {
            $(i.$element).hasClass("md-input") && altair_md.update_input($(i.$element))
        })

    });



</script>

</body>
</html>
