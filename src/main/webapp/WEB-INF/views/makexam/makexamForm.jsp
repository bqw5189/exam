<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="reqUrl" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<html>
<head>
	<title>编辑试卷</title>
</head>

<body>

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
											<a href="${ctx }/makexam/${pro.id}"
													<c:if test="${ projectId==pro.id}">
														class="text-success"
													</c:if>
											>${pro.projectName }</a>
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
<fieldset id="mainPage">
	<legend><b>当前位置:>>制定试卷>>编辑试卷</b></legend>

	<div class="md-card" id="login_card">
		<div class="md-card-content large-padding" id="login_form">
			<div class="login_heading">
				<div class="user_avatar"></div>
			</div>

			<form id="inputForm" onsubmit="return check()"  action="${ctx}/makexam/create" method="post" class="uk-form-stacked">
				<input type="hidden" name="id" value="${makexam.id}"/>
				<input type="hidden" name="questionIds" id="questionIds" value="${questionIds }"/>
				<input type="hidden" name="state" value="${makexam.state}"/>
				<input type="hidden" name="projectId" value="${makexam.project.id}"/>

				<div class="uk-grid" data-uk-grid-margin="">

					<div class="uk-width-medium-1-1">
						<label>试卷名称</label>
						<input type="text" id="user_edit_uname_control" name="examName"  value="${makexam.examName}" class="md-input required" minlength="3"/>
					</div>
					<div class="uk-width-medium-1-1">
						<label>说明</label>
						<textarea class="md-input required" name="examRemark" id="user_edit_personal_info_control" cols="35" rows="4">${makexam.examRemark}</textarea>
					</div>
					<div class="uk-width-medium-1-1">
						<label>考试时间(分钟)</label>
						<input type="text"  value="${makexam.examTime}" data-inputmask-showmaskonhover="false" data-inputmask="'alias': 'numeric', 'groupSeparator': ',', 'autoGroup': true, 'digits': 0, 'digitsOptional': false, 'prefix': '', 'placeholder': '0'" id="examTime" name="examTime" class="md-input masked_input" style="text-align: right;" required max="100"><span class="md-input-bar"></span>
					</div>

				</div>
				<div class="md-card">
					<div class="md-card-content">
						<div align="right">
							<input id="add_btn" class="md-btn md-btn-flat md-btn-flat-primary" type="button" value="添加试卷中的试题"/>
						</div>
						<div id="selectQuestion">

						</div>
						<div align="center">
							<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;
							<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
						</div>
					</div>
				</div>
		</div>
		</form>
	</div>
	</div>
</fieldset>
<div id="subPage" hidden="true" class="md-card">
</div>

<script>
	$(document).ready(function(){
		$maskedInput = $(".masked_input"),
		$maskedInput.length && $maskedInput.inputmask()
		//聚焦第一个输入框
		//$("#task_title").focus();
		//为inputForm注册validate函数
		//$("#inputForm").validate({
		//    rules : {
		//        examName:{
		//            required:true,
		//           minlength:"3"
		//         },
		//         examRemark:{
		//             required:true,
		//             minlength:"10"
		//         }
		//     },

		//     messages : {
		//         required: "不可为空",
		//         minlength: $.validator.format("请输入至少 {0} 个文字")
		//     }

		// });
		selectQuestion();
	});

	function check(){
		var examname = document.getElementById("user_edit_uname_control").value;
		var ids = document.getElementById("questionIds").value;
		if(examname==''||examname.length==0){
			alert("请添加试题名称");
			return false;
		}else if(ids==''||ids.length==0){
			alert("请添加试题");
			return false;
		}else{
			return true;
		}
	}

	function selectQuestion(){
		var ids = document.getElementById("questionIds").value;
		var questionIds = (""==ids ? "null" : ids);
		$.ajax({
			url:"${reqUrl}/api/v1/ajaxmakexam/selectquestion/"+questionIds,
			data:{},
			dataType:"json",
			success:function(data){
				var html = template.render("select_question_list",{data:data});
				$("#selectQuestion").html(html);
				$("#subPage").hide();
				$("#mainPage").show();
				$("#page_content_inner").show();
			},
			error:function(data){
				alert("error:"+data);
			}
		});
	}

	var checkAll = false;

	$("#add_btn").click(function(){
		var ids = document.getElementById("questionIds").value;
		$.ajax({
			url:"${reqUrl}/api/v1/ajaxmakexam/${projectId}",
			data:{questionIds:ids},
			dataType:"json",
			success:function (data){

				var html = template.render("quest_list_temp", {data:data});
				$("#subPage").html(html);


				$("#checkAll").click(function(){

					$.each($("tbody tr td input[type='checkbox']"), function(i,o){
						o.click();
					});
				});
				//alert(data.questionCont);
				/* $(data).each(function(idx,item){
				 var _len = 1;
				 $("#contentTableList").append("<tr id="+_len+" align='center'>"
				 +"<input id='checkbox"+_len+"' type='checkbox' name='checkbox' value='"+item.id+"'>"
				 +"</tr>");
				 });  */


				$("#subPage").show();

				$("#mainPage").hide();
				$("#page_content_inner").hide();

				$("#dt_default").DataTable({
					ordering:false,
					"language": {
						"lengthMenu": "每页 _MENU_ 条记录",
						"zeroRecords": "没有找到记录",
						"info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
						"infoEmpty": "无记录",
						"infoFiltered": "(从 _MAX_ 条记录过滤)",
						oPaginate: {
							sFirst: "首页",
							sLast: "尾页",
							sNext: "下一页",
							sPrevious: "上一页"
						},
						sSearch: "搜索:",
					}
				});
			},
			error:function(data){
				alert("error"+data);
			}
		});
	});
	function checkbox_click(obj){

		var ids = document.getElementById("questionIds").value;

		if(obj.checked){
			if(null==ids||ids.indexOf(obj)==-1){
				ids=ids+obj.value+",";
			}
		}else{
			ids = ids.replace(obj.value+",", "");
		}

		document.getElementById("questionIds").value=ids;
	}
	function back_btn(){
		$("#subPage").hide();
		$("#page_content_inner").show();
		$("#mainPage").show();
	}
	function delquestion(obj){
		var ids = document.getElementById("questionIds").value;
		document.getElementById("questionIds").value = ids.replace(obj+",","");
		selectQuestion();
	}
	/* <div class="col-md-12">
	 <div class="panel-group block">
	 <#for (var i = 0; i < data.length; i++){#>
	 <div class="panel panel-default">
	 <div class="panel-heading">
	 <h6 class="panel-title panel-trigger">
	 <a href="#question<#=data[i].id#>" data-toggle="collapse"><#=data[i].title#>&nbsp;&nbsp;&nbsp;&nbsp;<span class="format-lang-to-date-time" ><#=data[i].createDate#></span><span class="label label-info"><#=data[i].notificationResultSet.length#></span></a>
	 </h6>
	 </div>
	 <div class="panel-collapse collapse" id="question<#=data[i].id#>">
	 <div class="panel-body">
	 <p>
	 <strong><#=data[i].content#></strong>
	 </p>
	 <hr>
	 <#for (var j = 0; j < data[i].notificationResultVOSet.length;j++){#>
	 <p class="alert alert-success fade in">
	 <button data-dismiss="alert" class="close" type="button">×</button>
	 <#if(data[i].notificationResultVOSet[j].addressBook!=null) {#>
	 <#=data[i].notificationResultVOSet[j].addressBook.department#>
	 <#}#>
	 <#=data[i].notificationResultVOSet[j].userName#> <#=data[i].notificationResultVOSet[j].platform#> <#=data[i].notificationResultVOSet[j].status#> <#=data[i].notificationResultVOSet[j].result#> <span class="format-lang-to-date-time" ><#=data[i].notificationResultSet[j].pushDate#></a>
	 </p>
	 <#}#>
	 </div>
	 </div>
	 </div>
	 <#}#>
	 </div>
	 </div> */
</script>
<!-- /modal with message list -->
<script id="quest_list_temp" type="text/html">
	<form id="selectForm" action="#" method="post" class="form-horizontal">
		<div class="md-card">
			<div class="md-card-content">
				<div><b>当前位置：>>制定试卷>>编辑试卷>>试题选择</b></div>
				<table id="dt_default" class="uk-table" cellspacing="0" width="100%">
					<thead>
					<tr><th style="width:8%"><input type="checkbox" id="checkAll"/></th><th style="width:54%">试题名称</th><th style="width:12%">试题类型</th><th style="width:8%">分数</th></tr>
					</thead>
					<tbody>
					<#for (var i = 0; i < data.length; i++){#>
					<tr><td><input type="hidden" name="id" value="<#=data[i].id#>"/>
						<input name="<#=data[i].id#>" type="checkbox" value="<#=data[i].id#>" onclick="checkbox_click(this)"
						<#if(data[i].checked=="1"){#>checked<#}#>
							/></td>
						<td><#=data[i].questionCont#></td>
						<td><#if(data[i].type==1) {#>
							单选
							<#}#>
								<#if(data[i].type==2) {#>
									多选
									<#}#>
						</td>
						<td><#=data[i].questionScore#></td>
					</tr>
					<#}#>

					</tbody>
				</table>
				<div align="center">
					<input id="select_btn" class="md-btn md-btn-primary" type="button" value="选择" onclick="selectQuestion()"/>&nbsp;
					<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="back_btn()"/>
				</div>
			</div>
		</div>
	</form>
</script>

<script id="select_question_list" type="text/html">
	<form id="inputForm1"  class="form-horizontal">
		<fieldset>
			<legend><b>试题列表</b></legend>
			<table id="dt_default_list" class="uk-table">
				<tr><th style="width:8%">序号</th><th style="width:20%">试题名称</th><th style="width:12%">试题类型</th><th style="width:8%">分数</th><th style="width:8%">操作</th></tr>
				<#if(null!=data){#>
					<#for (var i = 0; i < data.length; i++){#>
					<tr><td><input type="hidden" name="id" value="<#=data[i].id#>"/><#=i+1#></td>
						<td><#=data[i].questionCont#></td>
						<td><#if(data[i].type==1) {#>
							单选
							<#}#>
								<#if(data[i].type==2) {#>
									多选
									<#}#>
						</td>
						<td><#=data[i].questionScore#></td>
						<td><a href="#" onclick="delquestion(<#=data[i].id#>)">删除</a></td>
					</tr>
					<#}}#>
			</table>
		</fieldset>
	</form>
</script>
</body>


</html>
