﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<style>
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


    <div class="rightData">
        <div id="showData" style="min-height: 500px">

        </div>
        <br/>
        <div id="btng" style="position: absolute;width: 700px">
            <button type="button" class="btn left" style="position: absolute;left: 0px">上一步</button>
            <button type="button" class="btn right" style="position: absolute;right: 0px">下一步</button>
        </div>
    </div>


</div>
<script type="text/javascript">

    $(function(){

        $($("a",$($("h1.onhere").parent())).get(0)).addClass("onhere");

        init("北校区大气PM2.5中多环芳烃分析",$("h1.onhere").text(),$($("a",$($("h1.onhere").parent())).get(0)).text());

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

            $.get("${ctx}/api/v1/student",{project:$(this).attr("p"),step:$(this).attr("s"),substep:$(this).attr("ss")}, function(data){
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

            $.get("${ctx}/api/v1/student",{project:p,step:s,substep:ss}, function(data){
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
                var html = '<div><span id="title">' + data.content + '</span></div>';

                if ("IMG-TEXT" === data.type|| "IMG-TABLE" === data.type) {
                    html += "<img src='${ctx}/static/${resourcePath}/" + data.file + "'/>";
                }

                html += '<div> 答案:<textarea name="answer" id="answer" style="min-height: 300px;width: 100%"></textarea></div>';
                html += '<div> <input type="button" class="btn" name="submit" id="submit" value="提交"/></div>';

                $("#showData").html(html);

                $("#submit").click(function(){
                    var email = $("#email").val();
                    var answer = $("#answer").val();
                    var title = $("#title").text();

                    $.get("${ctx}/api/v1/student/answer",{title:'北校区大气PM2.5中多环芳烃分析' + title, email:'<shiro:principal property="name"></shiro:principal>',answer:answer}, function(data){
                        alert("提交成功");
                    });


                });
            }else if("SELECT" === data.type ||"FLASH" === data.type){
                $("#showData").html('<embed src="${ctx}/static/${resourcePath}/' + data.file + '" width="700" height="500"></embed>');
            }else if("MOVE" === data.type){
                var so = new SWFObject("${ctx}/static/js/CuPlayerMiniV4.swf","CuPlayerV4","700","490","9","#000000");
                so.addParam("allowfullscreen","true");
                so.addParam("allowscriptaccess","always");
                so.addParam("wmode","opaque");
                so.addParam("quality","high");
                so.addParam("salign","lt");
                so.addVariable("CuPlayerSetFile","${ctx}/static/js/CuPlayerSetFile.xml");
                so.addVariable("CuPlayerFile",'${ctx}/static/${resourcePath}/' + 'ypcjqcl.flv');
                so.addVariable("CuPlayerImage","${ctx}/static/images/start.jpg");
                so.addVariable("CuPlayerWidth","1024");
                so.addVariable("CuPlayerHeight","768");
                so.addVariable("CuPlayerAutoPlay","yes");
                so.addVariable("CuPlayerPosition","bottom-right");

                so.write("showData");
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
        $(".text02").attr("src", "${ctx}/static/student/img/text02.png");
    });
</script>
</body>
</html>
