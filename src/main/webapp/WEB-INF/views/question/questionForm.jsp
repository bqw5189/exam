<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>编辑问题</title>
</head>
<body>
<div class="md-card">
    <div class="md-card-content large-padding">
        <div><b>当前位置：>>试题管理>>编辑试题</b></div>
        <form id="inputForm" action="${ctx}/question/create" method="post" class="uk-form-stacked">
            <input type="hidden" name="id" value="${question.id}"/>
            <input type="hidden" name="projectId" value="${question.project.id}"/>


            <div class="uk-grid" data-uk-grid-margin="">
                <div class="uk-width-medium-1-1">
                    <div class="uk-form-row parsley-row">
                        <label for="type" class="uk-form-label">题型<span class="req">*</span></label>
                        <span class="icheck-inline"> <input type="radio" name="type" id="val_radio_type1" value="1" data-md-icheck="" required="" checked="checked" /> <label for="val_radio_type1" class="inline-label">单选</label> </span>
                        <span class="icheck-inline"> <input type="radio" name="type" id="val_radio_type2" value="2" data-md-icheck="" /> <label for="val_radio_type2" class="inline-label">多选</label> </span>
                    </div>
                </div>
            </div>
            <div class="uk-grid">
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="settings_page_description">问题内容</label>
                        <textarea class="md-input" name="questionCont" id="settings_page_description" required="" cols="10" rows="8" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-maxlength="100" data-parsley-validation-threshold="10" data-parsley-minlength-message="">${question.questionCont}</textarea>
                    </div>
                </div>
            </div>
            <div class="uk-grid" data-uk-grid-margin="">

                <div class="uk-width-medium-1-1">
                    <div class="parsley-row">
                        <label for="questionScore">分值</label>
                        <input type="text"  value="${question.questionScore}" data-inputmask="'alias': 'numeric', 'number': 0, 'digitsOptional': false, 'placeholder': '0'" id="questionScore" name="questionScore" class="md-input masked_input" style="text-align: right;" required max="100"><span class="md-input-bar"></span>
                    </div>
                </div>
            </div>
            <div class="uk-grid">
                <div class="uk-width-1-1" align="center">
                    <input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>
                    <a href="#" onclick="history.go(-1);return false;" class="md-btn md-btn-primary">返回</a>
                </div>
            </div>
        </form>
    </div>
</div>
	 
 
	<%--<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
	<%--<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>--%>
	

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
			/* var i = $("#inputForm");
		    i.parsley().on("form:validated",
		    function() {
		        altair_md.update_input(i.find(".md-input-danger"));
    	        	var _len = $("#dt_tableTools tr").length; 
    				var flag=false;
    				 $('input:radio').each(function(index,domEle){
							if(domEle.checked&&index!=0&&domEle.value==1){
								flag=true;
							}
    				});
    				if(flag){
    					form.submit();
    				}else{
    					alert("请选择选项中的正确答案后再提交");
    					return false;
    				} 
		    }).on("field:validated",
		    function(i) {
		        $(i.$element).hasClass("md-input") && altair_md.update_input($(i.$element))
		    })  */
		    
		});
		 
		
		 
	</script>
</body>
</html>
