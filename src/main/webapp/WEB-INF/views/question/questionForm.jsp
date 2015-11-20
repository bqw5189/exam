<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>编辑问题</title>
</head>
<body>
	<form id="inputForm" action="${ctx}/question/create" method="post" class="uk-form-stacked">
		<input type="hidden" name="id" value="${question.id}"/>
		<input type="hidden" name="projectId" value="${question.project.id}"/>
		<fieldset>
			<legend><small>试题管理</small></legend>
			<div class="md-card"> 
     			<div class="md-card-content large-padding"> 
     			<fieldset>
     			<legend><small>试题信息</small></legend>
     			 
				     <div class="uk-width-medium-1-2"> 
			         <div class="uk-form-row parsley-row"> 
			          <label for="gender" class="uk-form-label">类型<span class="req">*</span></label> 
			          <span class="icheck-inline"> <input type="radio" name="type" id="type1" value="1" checked="checked"/> <label for="val_radio_male" class="inline-label">单选</label> </span> 
			          <span class="icheck-inline"> <input type="radio" name="type" id="type2" value="2"/> <label for="val_radio_female" class="inline-label">多选</label> </span> 
			         </div> 
			        </div> 
			        <div class="uk-width-1-1"> 
			         <div class="parsley-row"> 
			          <label for="message">问题内容<span class="req">*</span></label> 
			          <textarea class="md-input" name="questionCont" id="settings_page_description" cols="35" rows="4" required="">
		              	${question.questionCont}
		              </textarea> 
			         </div> 
			        </div> 
			        
			       <br/>
					<div class="uk-width-1-1"> 
				        <div class="parsley-row">
				        	<label for="questionScore">分值</label>
				        	<input type="text"  value="${question.questionScore}" data-inputmask-showmaskonhover="false" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'number': 0, 'digitsOptional': false, 'prefix': '', 'placeholder': '100'" id="questionScore" name="questionScore" class="md-input masked_input" style="text-align: right;" required max="100"><span class="md-input-bar"></span>
				        </div> 
			         
			       </div>
					<div align="center">
						<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;	
						<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
					</div>
				</fieldset>
			</div>
		</div>
		</fieldset>
	</form>
	 
 
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	

	<script>
		$(document).ready(function(){
			$maskedInput = $(".masked_input"),
	        $maskedInput.length && $maskedInput.inputmask()
			
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
