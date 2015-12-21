<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>编辑项目</title>
</head>
<body>
<form id="inputForm" action="${ctx}/project/create/save?coureseId=${project.course.id}" method="post" class="uk-form-stacked">
    <input type="hidden" name="id" value="${project.id}"/>
    <input type="hidden" name="courseId" value="${courseId}"/>
    <input type="hidden" name="project.course.id" value="${project.course.id}"/>
        <div class="md-card">
            <div class="md-card-content large-padding">
                <div><b>当前位置：>>课程项目管理>>项目列表>>新增项目</b></div>
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="uk-form-row">项目名称<span class="req">*</span></label>
                        <input class="md-input" type="text" id="uk-form-row" name="projectName" required="" value="${project.projectName}"/>
                    </div>
                </div>

                <br/>
                <div class="uk-width-1-1">
                    <div class="parsley-row">
                        <label for="uk-form-row">说明</label>
			          <textarea class="md-input" name="remark" id="uk-form-row" cols="35" rows="4" required="">
                          ${project.remark}
                      </textarea>
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
  //  $(document).ready(function(){
  //      var i = $("#inputForm");
  //      i.parsley().on("form:validated",
  //              function() {
  //                  altair_md.update_input(i.find(".md-input-danger"));
//
  //              }).on("field:validated",
   //             function(i) {
   //                 $(i.$element).hasClass("md-input") && altair_md.update_input($(i.$element))
   //             })

   // });
</script>
</body>
</html>
