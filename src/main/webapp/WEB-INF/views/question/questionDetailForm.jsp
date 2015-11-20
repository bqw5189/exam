<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>查看明细</title>
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
		    <div class="md-card"> 
		     <div class="md-card-content"> 
		      <h3 class="heading_a">查看明细</h3> 
		      <table id="dt_default" class="uk-table">
			      <tr>
				      <td>
				              <label>试题类型</label> 
				              <span class="icheck-inline"> <input type="radio" name="settings_cache_type" id="settings_cache_file"   disabled="disabled"
							  <c:if test="${question.type==1 }">
							  checked="checked"
							  </c:if>
				              /> 
				              <label class="inline-label">单选</label>
				               </span> 
			           		<span class="icheck-inline"> <input type="radio" name="settings_cache_type" id="settings_cache_mysql" disabled="disabled"
			           			<c:if test="${question.type==2  }">
								  checked="checked"
								  </c:if>
			           		/> <label class="inline-label">多选</label> </span> 
			             </td>
			             <td>
				              <label>分值</label> 
				              <input class="md-input" type="text" id="user_edit_uname_control" name="user_edit_uname_control" value="${question.questionScore}" disabled="disabled"/> 
			             </td>
		             </tr>
		             <tr>
		             	<td colspan="2">
			              <div class="uk-width-medium-1-2"> 
			              <label>问题内容</label> 
			              <textarea class="md-input" name="settings_page_description" id="settings_page_description" cols="35" rows="4" disabled="disabled">
			              	${question.questionCont}
			              </textarea> 
			             </div> 
		             	</td>
		             </tr>
	            </table>
	            </div>
	            </div>
	            <div class="md-card"> 
    		 <div class="md-card-content"> 
			 	<table id="dt_default" class="uk-table">
					<tr><th style="width:8%">序号</th><th style="width:62%">选项内容</th><th style="width:20%">是否为答案</th>
					</tr>
					<c:set var="no" value="1"></c:set>
					<c:forEach items="${ question.selectItems}" var="item">
						<tr>
							<td>${no }</td>
							<td>${item.selectCont}</td>
							<td><input type="radio" name="isAnswer${no }" id="isAnswer${no }" value="1" disabled="disabled"
							<c:if test="${item.isAnswer==1 }">
								 checked
							</c:if>
		                        />是
		                               <input type="radio" name="isAnswer${no }" id="isAnswer${no }" value="0" disabled="disabled"
			                <c:if test="${item.isAnswer==0 }">
								checked
							</c:if>
		                               />否</td>
						</tr>
						<c:set var="no" value="${no+1 }"></c:set>
					</c:forEach>
				</table>
				<div align="center" >
				<a href="#" onclick="history.go(-1);return false;" class="md-btn md-btn-primary">返回</a>
				</div>
				</div></div>
</body>
</html>
