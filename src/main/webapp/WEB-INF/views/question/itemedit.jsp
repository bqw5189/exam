<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>编辑选项</title>
</head>
<body>
	<form id="inputForm" action="${ctx}/question/createitem?questionId=${item.question.id}" method="post" class="uk-form-stacked">
		<input type="hidden" name="id" value="${item.id}"/>
		<input type="hidden" name="item.question.id" value="${item.question.id}"/>
		<fieldset>
			<legend><small>选项管理</small></legend>
			<div class="md-card"> 
     			<div class="md-card-content large-padding"> 
			        <div class="uk-width-1-1"> 
			         <div class="parsley-row"> 
			          <label for="message">选项内容<span class="req">*</span></label> 
			          <textarea class="md-input" name="selectCont" id="settings_page_description" cols="35" rows="4" required="">
		              	${item.selectCont}
		              </textarea> 
			         </div> 
			        </div> 
			        
			       <br/>
					<div class="uk-width-1-1"> 
				        <div class="parsley-row">
				        	<label for="isAnswer">是否为答案</label>
				        	<input type='radio' name='isAnswer' id='isAnswer' value='1'
				        	<c:if test="${item.isAnswer==1 }">checked="checked"</c:if>
				        	>是
				        	<input type='radio' name='isAnswer' id='isAnswer' value='0'
				        	<c:if test="${null==item.isAnswer||item.isAnswer==0}">checked="checked"</c:if>
				        	>否
				        </div> 
			         
			       </div>
					<div align="center">
						<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;	
						<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
					</div>
			</div>
		</div>
		</fieldset>
	</form>
	 
 
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	

	<script>
		$(document).ready(function(){
			var i = $("#inputForm");
		    i.parsley().on("form:validated",
		    function() {
		        altair_md.update_input(i.find(".md-input-danger"));
    	        	var _len = $("#dt_tableTools tr").length; 
    				var flag=false;
    				 $('input:radio').each(function(index,domEle){
							if(domEle.checked){
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
		    }) 
		    
		});
	</script>
</body>
</html>
