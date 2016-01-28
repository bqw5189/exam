<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>《北校区大气PM2.5中多环芳烃分析》</title>

<style>
    .nav-tabs > .active > a, .nav-tabs > .active > a:hover, .nav-tabs > .active > a:focus{
        background-color: #f88825;
    }
</style>
</head>

<body>

<!--主题部分-->
<div class="tearchpagebox">
    <!--左边菜单-->
    <ul class="nav nav-tabs">
        <li class="active"><a href="${ctx}/student/examlist?project=北校区大气PM2.5中多环芳烃分析">北校区大气PM2.5中多环芳烃分析</a></li>
        <li class=""><a href="${ctx}/student/examlist?project=汽修喷漆车间废水中苯系物分析">汽修喷漆车间废水中苯系物分析</a></li>
        <li class=""><a  href="${ctx}/student/examlist?project=南三区土壤中塑化剂分析">南三区土壤中塑化剂分析</a></li>
    </ul>
    <br/>
    <div class="leftMenubox" style="min-height: 150px;padding-left: 20px;width: 150px">
        <p>注意：</p>
        <div>考试时间：${examvo.examTime}</div>
        剩余时间：<span id="clock">${examvo.examTime }</span>
    </div>
    <!--左边菜单 end-->

    <div class="rightData" style="width: 770px;border: 0px;">
        <div id="showData" style="min-height: 500px;">

            <form id="submitForm" name="myForm" action="${ctx}/student/submitpaper" method="post" class="form-horizontal">

                            <input id="id" value="${examvo.id }" name="id" type="hidden">
                            <input type="hidden" name="token" value="${token}">
                            <table id="dt_default" class="uk-table" style="width: 100%">
                                <tbody>

                                <c:set var="indexno" value="1" />
                                <c:forEach items="${examvo.questionList}" var="que">
                                    <c:if test="${null!=que.typeRemark&&''!=que.typeRemark }">
                                        <tr>
                                            <td><font color="red">${que.typeRemark }</font></td>
                                        </tr>
                                    </c:if>
                                    <tr><td><hr style="height:3px;border:none;border-top:3px double #006400;"/></td></tr>

                                    <tr>
                                        <td>
                                                ${indexno} 、 ${que.questionCont }</td>
                                    </tr>
                                    <tr><td><hr/></td></tr>
                                    <tr>
                                    <td>
                                        <ol type="A" style="padding-left: 30px">
                                    <c:forEach items="${que.selectItems}" var="item">
                                            <c:if test="${que.type==1 }">
                                                <li  style="list-style:inherit; margin-left: 20px"><input type='radio' name='${que.id }' id='${item.id}' value='${item.id}' style="margin-left: -50px;margin-bottom: 8px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.selectCont }</li>
                                            </c:if>
                                            <c:if test="${que.type==2 }">
                                                <li  style="list-style:inherit; margin-left: 20px"><input type='checkbox' name='${que.id }' id='${item.id}' value='${item.id}' style="margin-left: -35px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.selectCont }</li>
                                            </c:if>
                                    </c:forEach>
                                        </ol>
                                    </td>
                                    </tr>

                                    <c:set var="indexno" value="${indexno+1 }"></c:set>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div align="center">
                                <input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;
                                <input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
                            </div>

            </form>

        </div>
        <br/>


        <script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function() {
                initTimer();
            });
            //window.onload = Remind;
            //*********倒计时器**************
            var normalelapse = 100;     // 默认时间时隔
            var nextelapse = normalelapse;      // 下次启动时间间隔
            var counter;
            var startTime;      // 计时器开始的物理时间
            var start = "${examvo.examTime}"==0?30:"${examvo.examTime}"+":00";    // 计时器开始数字
            var finish = "00:00";       // 计时器结束数字
            var timer = null;
            // 初始化倒计时函数
            function initTimer()
            {
                counter = 0;
                // 初始化计时器开始的物理时间
                startTime = new Date().valueOf();
                // nextelapse是定时时间, 初始时为毫秒
                // 注意setInterval函数: 时间逝去nextelapse(毫秒)后, onTimer才开始执行
                timer = window.setInterval("onTimer()", nextelapse);
            }
            // 倒计时函数
            function onTimer()
            {
                // 倒计时结束
                if (start == finish)
                {// 清除上一次的定时器
                    window.clearInterval(timer);
                    // UtilHttpForm.setData("Command_Submit","exampaperSubmit","datasetname");
                    $("#submit_btn").click(); //调用form的submit方法，走Post方式
                    // 退出系统
                    alert("对不起，您的答卷时间已到！");
                    //window.open("${ctx}/login", "", "");
                    document.myForm.submit();
                    //setTimeout('window.opener=null;window.close();', 100);
                    return;
                }
                var hms = new String(start).split(":");
                var m = new Number(hms[0]);
                var s = new Number(hms[1]);
                // 秒数减1
                s -= 1;
                if (s < 0)
                {
                    s = 59;
                    m -= 1;
                }
                // 时间用双位显示
                var ss = s < 10 ? ("0" + s) : s;
                var sm = m < 10 ? ("0" + m) : m;
                //设置倒计时样式
                if (sm < 10)
                {
                    clock.style.color='#ff0000';
                }
                // 计时器下次开始的数字
                start = sm + ":" + ss;
                // 显示计时器下次开始的数字
                clock.innerHTML = start;
                // 清除上一次的定时器
                window.clearInterval(timer);
                // 自校验系统时间得到时间差
                // 并由此得到下次所启动的新定时器的时间nextelapse
                counter++;
                var counterSecs = counter * 1000;
                var elapseSecs = new Date().valueOf() - startTime;
                var diffSecs = counterSecs - elapseSecs;
                nextelapse = normalelapse + diffSecs;
                if (nextelapse < 0)
                    nextelapse = 0;
                // 启动新的定时器
                timer = window.setInterval("onTimer()", nextelapse);
            }
        </script>



    </div>


</div>
        
</body>
</html>
