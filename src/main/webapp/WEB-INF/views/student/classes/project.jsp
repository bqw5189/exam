<%@ page contentType="text/html;charset=UTF-8" %>
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

        init("北校区大气PM2.5中多环芳烃分析",$("h1.onhere").text(),$($("a",$($("h1.onhere").parent())).get(0)).text());

        $("#btng").hide();

        var rdata=[];
        var index = 0;

        $(".substep").click(function(){
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
            }else if("TEXT" === data.type){
                $("#showData").html(data.content);
            }else if("SELECT" === data.type ||"FLASH" === data.type){
                $("#showData").html('<embed src="${ctx}/static/${resourcePath}/' + data.file + '" width="700" height="500"></embed>');
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
</body>
</html>
