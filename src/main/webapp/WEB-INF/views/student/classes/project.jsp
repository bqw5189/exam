<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="<%=org.apache.shiro.SecurityUtils.getSubject().getPrincipal()%>"/>
<c:set var="className" value="${principal.className}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">

    <style type="text/css">
       p{
            text-indent:20em;
        }
    </style>
</head>

<body>


<!--主题部分-->
<div class="tearchpagebox">
    <!--左边菜单-->
    <div class="leftMenubox">
        <i class="L"></i><i class="R"></i>
        <c:forEach items="${course.subEntitys}" var="c">
        <div class="leftMenulist">
            <h1 class="<c:if test="${c.value.title == currentTask}">onhere</c:if>">${c.value.title}</h1>
            <c:forEach items="${c.value.subEntitys}" var="t">
            <a href="#" class="substep" p="${currentProject}" s="${c.value.title}" ss="${t.value.title}"><i></i>${t.value.title}</a>
            </c:forEach>
        </div>
        </c:forEach>

        <%--<div class="leftMenulist">--%>
            <%--<h1 class="onhere">环节一   接受任务</h1>--%>
            <%--<a href="#" class="onhere"><i></i>1.1阅读任务书</a>--%>
            <%--<a href="#"><i></i>1.2填写委托检讨书</a>--%>
        <%--</div>--%>


    </div>
    <!--左边菜单 end-->


    <div class="rightData" style="width: 700px;border-width: 0px">
        <div id="showData" style="min-height: 500px;max-height: 500px;">

        </div>
        <br/>
        <div id="btng" style="position: absolute;width: 700px">
            <button type="button" class="btn left" style="position: absolute;left: 0px">上一步</button>
            <button type="button" class="btn right" style="position: absolute;right: 0px">下一步</button>
        </div>
    </div>


</div>
<script type="text/javascript">
    //获取url中的参数
//    function getUrlParam(name) {
//        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
//        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
//        if (r != null) return undecunescape(r[2]); return null; //返回参数值
//    }

    $(function(){

        $($("a",$($("h1.onhere").parent())).get(0)).addClass("onhere");
        var projectName = "${param.project_title}";//getUrlParam("project_title");
        if (undefined == projectName || "" == projectName){
            projectName = "北校区大气PM2.5中多环芳烃分析";
        }

        init(projectName,$("h1.onhere").text(),$($("a",$($("h1.onhere").parent())).get(0)).text());

        $("#btng").hide();

        var rdata=[];
        var index = 0;

        $(".substep").click(function(){
            $(".substep").removeClass("onhere");

            $(this).addClass("onhere");

            $("#btng").hide();
            index = 0;
            rdata=[]

            $("#showData").empty();


            $.get("${ctx}/api/v1/student",{courseName:"${courseName}",project:$(this).attr("p"),step:$(this).attr("s"),substep:$(this).attr("ss")}, function(data){
                rdata = data;

                isShowBotton(index);

                showData(rdata[index]);

                $("#btng").show();
            });
        });

        function init(p, s, ss){
            $("#btng").hide();
            index = 0;
            rdata=[]

            $("#showData").empty();

            $.get("${ctx}/api/v1/student",{courseName:"${courseName}",project:p,step:s,substep:ss}, function(data){
                rdata = data;

                isShowBotton(index);

                showData(rdata[index]);

                $("#btng").show();
            });
        }

        $(".right").click(function(){
            if (index+1>=rdata.length){
                index = rdata.length -1;
            }else{
                index ++;
            }
            isShowBotton(index);

            showData(rdata[index]);
        });

        $(".left").click(function(){
            if (index-1<0){
                index = 0;
            }else{
                index --;
            }

            isShowBotton(index);

            showData(rdata[index]);
        });

        function showData(data){
            if ("IMG" === data.type){
                $("#showData").html("<img src='${ctx}/static/${resourcePath}/" + data.file + "'/>" );
            }else if("TEXT" === data.type || "IMG-TEXT" === data.type|| "IMG-TABLE" === data.type){
                var html = '<div id="remark"><span id="title" >' + data.content + '</span></div>';

                if ("IMG-TEXT" === data.type|| "IMG-TABLE" === data.type) {
                    html += "<img src='${ctx}/static/${resourcePath}/" + data.file + "'/>";
                }

                html += '<div> 答案:</br><textarea name="answer" id="answer" style="min-height: 300px;width: 90%"></textarea></div>';
                html += '<div> <button id="submit" class="btn" data-loading-text="提交中..." type="button" >提交</button></div>';

                var regex = /\[img\](.*?)\[\/img\]/g;
                if (regex.exec(html)){
                    html = html.replace(regex, "<img src='"+"${ctx}/static/${resourcePath}/"+RegExp.$1+"'/>");
                }

                $("#showData").html(html);
                $("#title p").css("text-indent","2em")
                $("#title p").css("font-size","14px")

                $("#submit").click(function(){
                    var answer = $("#answer").val();
                    var title = $("#title").text();

                    $(this).text("提交中...");
                    $(this).attr("disabled", "true");

                    $.ajax({
                        type: 'GET',
                        url : "${ctx}/api/v1/student/answer",
                        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                        data : {userId:'<shiro:principal property="id"></shiro:principal>', course:projectName, answer:answer,title:title},
                        success : function(data) {
                            $("#submit").text("提交");
                            $("#submit").removeAttr("disabled");
                            alert("提交成功");
                        },
                        error : function(request, status, error) {
                            alert('提交失败');
                        }
                    })


                });
            }else if("SELECT" === data.type ||"FLASH" === data.type){
                $("#showData").html('<embed src="${ctx}/static/${resourcePath}/' + data.file + '" width="700" height="500"></embed>');
            }else if("MOVE" === data.type){
                $("#showData").empty();

                var so = new SWFObject("${ctx}/static/CuPlayer/CuPlayerMiniV4.swf","CuPlayerV4","700","490","9","#000000");
                so.addParam("quality","high");
                so.addParam("salign","lt");
                so.addVariable("CuPlayerFile",'${ctx}/static/${resourcePath}/' + 'ypcjqcl.flv');
                so.addVariable("CuPlayerImage","${ctx}/static/images/start.jpg");
                so.addVariable("CuPlayerWidth","700");
                so.addVariable("CuPlayerHeight","490");
                so.addVariable("CuPlayerAutoPlay","yes");
                so.addVariable("CuPlayerPosition","bottom-right");

                so.write("showData");
            }else if("DOC" === data.type||"doc" === data.type){
                var html = '<br/><div id="remark">'+data.content+'</div><br/>';

                html += "<div >请下载报告模版&nbsp;:&nbsp;<a href='${ctx}/static/${resourcePath}/doc/" + data.file + "'>" +"模版下载"+ "</a></div><br/>";

                html += '<form id="template" method="post" enctype="multipart/form-data" action="${ctx}/student/answer">上传报告&nbsp;&nbsp;:&nbsp;&nbsp;<input type="file" id="file" name="file"/>';
                html += '<input type="hidden" name="title"  value="'+data.content+'">';
                html += '<input type="hidden" name="course"  value="'+projectName+'">';
                html += '<br/><br/><div style="text-align: center"> <button id="submitFile" class="btn" data-loading-text="提交中..." type="button" >提交</button></div></form>';
                html += '<br/><br/><br/><div> <p>注：完成此次答题需要四个步骤：</p><p>1.下载报告模板;</p><p>2.填写报告内容;</p><p>3.点击“浏览”按钮上传报告;</p><p>4.点击“提交”操作完成。</p></div></form>';


                var regex = /\[img\](.*?)\[\/img\]/g;
                if (regex.exec(html)){
                    html = html.replace(regex, "<img src='"+"${ctx}/static/${resourcePath}/"+RegExp.$1+"'/>");
                }


                $("#showData").html(html);
                $("#title p").css("text-indent","2em")
                $("#title p").css("font-size","14px")

                $("#submitFile").click(function(){
                    if ($("#file").val() == ""){
                        alert("请选择文件!");
                        return;
                    }

                    $(this).text("提交中...");
                    $(this).attr("disabled", "true");

                    $("#template").ajaxSubmit({
                        success:function(data) {
                            $("#submitFile").text("提交");
                            $("#submitFile").removeAttr("disabled");
                            $("#template").resetForm();
                            alert("提交成功");
                        }
                    })
                });
            }else{
                var html = '<div id="remark"><span id="title" >' + data.content + '</span></div>';

                var regex = /\[img\](.*?)\[\/img\]/g;
                if (regex.exec(html)){
                    html = html.replace(regex, "<img src='"+"${ctx}/static/${resourcePath}/"+RegExp.$1+"'/>");
                }

                $("#showData").html(html);
                $("#title p").css("text-indent","2em")
                $("#title p").css("font-size","14px")
            }


        }

        function isShowBotton(index){
            if (index==rdata.length-1){
                $(".right").hide();
            }

            if (index+1 < rdata.length){
                $(".right").show();
            }

            if (index>=1){
                $(".left").show();
            }

            if (index <= 0){
                $(".left").hide();
            }
        }

    });
</script>
<!--底部end-->

<script>
    $(function(){
        $(".text02").attr("src", "${ctx}/static/student/img/text03.png");
        <c:if test="${param.project_title == '北校区大气PM2.5中多环芳烃分析'}">
        $(".text02").attr("src", "${ctx}/static/student/img/text03.png");
        </c:if>
        <c:if test="${param.project_title == '汽修喷漆车间废水中苯系物分析'}">
        $(".text02").attr("src", "${ctx}/static/student/img/text04.png");
        </c:if>
        <c:if test="${param.project_title == '南三区土壤中塑化剂分析'}">
        $(".text02").attr("src", "${ctx}/static/student/img/text05.png");
        </c:if>

        $(".text02").attr("style","background:url('')");

        <c:if test="${param.project_title == '南校区大气PM2.5中元素分析'}">
        $(".text02").attr("src", "${ctx}/static/ysfx/img/blue/toptext.png");
        </c:if>
        <c:if test="${param.project_title == '高碑店污水处理厂<br/>活性 污泥中铬元素分析'}">
        $(".text02").attr("src", "${ctx}/static/ysfx/img/toptext2.png");
        </c:if>
        <c:if test="${param.project_title == '南校区自备井水质异味排查'}">
        $(".text02").attr("src", "${ctx}/static/ysfx/img/toptext3.png");
        </c:if>


    });
</script>
</body>
</html>
