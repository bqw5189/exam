<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="reqUrl" value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<html>
<head>
	<title>开始答卷</title>
</head>

<body>
	<form id="submitForm" action="${ctx}/examlist/submitpaper" method="post" class="form-horizontal">
	<fieldset>
	<legend><small>开始答卷</small></legend>
	<div class="md-card">
    <div class="md-card-content">
	
	<input id="id" value="${examvo.id }" name="id" type="hidden">
	<input type="hidden" name="token" value="${token}"> 
	<div id="clockGroup" class="horizontal" align="center" style="position:fixed;right:100px;top:100px;" >
		<img src="${ctx }/static/images/clock.gif">
		<div id="clock" align="center" style="font-size: 30px;position:fixed;" >
		  ${examvo.examTime }
		</div>
	</div>
	<table id="dt_default" class="uk-table">
		<tbody>	
			<tr>
				<td align="center"><center>${examvo.examName }</center></td>
			</tr>
			<tr>
				<td align="center">${examvo.examRemark }</td>
			</tr>
			<c:set var="indexno" value="1" />
			<c:forEach items="${examvo.questionList}" var="que">
			<c:if test="${null!=que.typeRemark&&''!=que.typeRemark }">
				<tr>
					<td><font color="red">${que.typeRemark }</font></td>
				</tr>
			</c:if>
				<tr>
					<td>
					${indexno} 、 ${que.questionCont }</td>
				</tr>
				<c:forEach items="${que.selectItems}" var="item">
					<c:if test="${que.type==1 }">
						<tr>
							<td>
								<input type='radio' name='${que.id }' id='${item.id}' value='${item.id}'>${item.selectCont }</input>
							</td>
						</tr>
					</c:if>
					<c:if test="${que.type==2 }">
						<tr>
							<td>
								<input type='checkbox' name='${que.id }' id='${item.id}' value='${item.id}'>${item.selectCont }</input>
							</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:set var="indexno" value="${indexno+1 }"></c:set>
			</c:forEach>
		</tbody>
	</table>
	<div align="center">
		<input id="submit_btn" class="md-btn md-btn-primary" type="submit" value="提交"/>&nbsp;	
		<input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
	</div>
	</div>
	</div>
	</fieldset>
	</form>
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
        window.open("${ctx}/login", "", "");
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
</body>
</html>