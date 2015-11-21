<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>编辑课程</title>
</head>
<body>
<form id="inputForm" action="${ctx}/course/create/save" method="post" class="uk-form-stacked">
    <input type="hidden" name="id" value="${course.id}"/>
    <fieldset>
        <legend><small>课程管理</small></legend>
        <div class="md-card">
            <div class="md-card-content large-padding">
                <fieldset>
                    <legend><small>课程信息</small></legend>
                    <div class="uk-width-1-1">
                        <div class="parsley-row">
                            <label for="message">课程名称<span class="req">*</span></label>
			          <textarea class="md-input" name="courseName" id="settings_page_description"  required="true">
                          ${course.courseName}
                      </textarea>
                        </div>
                    </div>
                    <div class="uk-width-1-1">
                        <div class="parsley-row">
                            <label for="message">说明<span class="req">*</span></label>
			          <textarea class="md-input" name="remark" id="settings_page_description" cols="35" rows="4" required="">
                          ${course.remark}
                      </textarea>
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
    //$(document).ready(function(){
    //    $maskedInput = $(".masked_input"),
    //    $maskedInput.length && $maskedInput.inputmask()

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

   // });



</script>
<script>
    $(document).ready(function(){
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
