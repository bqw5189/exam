<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<title>修改试题</title>
</head>
	<body>
		<form id="inputForm" action="${ctx}/question/update" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${question.id}"/>
			<input type="hidden" name="projectId" value="${question.project.id}"/>
			<fieldset>
				<legend><small>修改试题</small></legend>
				<div class="md-card"> 
			     <div class="md-card-content"> 
				   <fieldset>
					<legend><small>试题信息</small></legend>
					<div class="uk-width-medium-1-2">
						<label>试题类型:</label>
						  <input type="radio" name="type" id="type1" value="1" 
						  <c:if test="${question.type==1 }">
						  checked="checked"
						  </c:if>
						  > 单选
						  <input type="radio" name="type" id="type2" value="2"
						   <c:if test="${question.type==2  }">
						  checked="checked"
						  </c:if>
						  > 多选
					</div>	
					<div class="uk-width-medium-1-2"> 
			            <label>问题内容</label> 
						<textarea class="md-input required" name="questionCont" id="settings_page_description" cols="35" rows="4">
			              	${question.questionCont}
			              </textarea> 
					</div>	
					<div class="uk-width-medium-1-2">
						<label>分值:</label>
						<input type="text" id="user_edit_uname_control" name="questionScore"  value="${question.questionScore}" class="md-input required number" minlength="1"/>
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
		
	    /* var html = template.render("quest_list_temp", {data:data});
                    $("#questionItems").html(html);
	    
		var i = $("#inputForm");
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
	    }) */
	});
	    
</script>
	</body>
</html>