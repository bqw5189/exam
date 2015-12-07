<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>考试得分</title>
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
    <div class="leftMenubox" style="min-height: 150px;padding-left: 20px;width: 150px">
        <p>本次答卷得分：<font color="red" size="6">${sumScore }</font></p>
        <div>考试时间：${examvo.examTime}</div>
    </div>
    <!--左边菜单 end-->

    <div class="rightData">
        <div id="showData" style="min-height: 500px;">


            <table id="dt_default" class="uk-table" style="width: 100%">
                <tbody>
                <tr><td>考试得分</td></tr>
                <tr><td><hr style="height:3px;border:none;border-top:3px double #006400;"/></td></tr>
                <c:set var="indexno" value="1" />
                <c:forEach items="${examvo.questionList}" var="que">
                    <c:if test="${null!=que.typeRemark&&''!=que.typeRemark }">
                        <tr>
                            <td><font color="red">${que.typeRemark }</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>${indexno} 、${que.questionCont }</td>
                    </tr>
                    <tr><td><hr/></td></tr>
                    <c:forEach items="${resultlist}" var="result">
                        <c:if test="${result.examQuestionId==que.id}">
                            <c:forEach items="${que.selectItems}" var="item">
                                <c:if test="${que.type==1 }">
                                    <tr>
                                        <td>
                                            <input type='radio' name='${que.id }' id='${item.id}' value='${item.id}'
                                            <c:if test="${result.chooseQuestionId==item.id}">

                                                <c:set var="reply" value="学生答案：${item.selectCont}" />
                                                   checked=true
                                            </c:if>
                                                    >
                                            <c:if test="${que.questionAnswerId==item.id}"><c:set var="answer" value="正确答案：${item.selectCont}" /> </c:if>
                                                ${item.selectCont }
                                            <c:if test="${que.questionAnswerId==item.id}"></font></c:if>
                                            <c:if test="${que.questionAnswerId==item.id&&result.chooseQuestionId==item.id }">
                                                <c:set var="score" value="得分：${que.questionScore}" /></c:if>
                                            </input>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${que.type==2 }">
                                    <tr>
                                        <td>
                                            <input type='checkbox' name='${que.id }' id='${item.id}' value='${item.id}'
                                            <c:if test="${fn:contains(result.chooseQuestionId,item.id)}">
                                                   checked=true
                                            </c:if>
                                                    >
                                            <c:if test="${fn:contains(que.questionAnswerId,item.id)}"><font color="red"></c:if>
                                                ${item.selectCont }
                                            <c:if test="${fn:contains(que.questionAnswerId,item.id)}"></font></c:if>
                                            </input>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                    <c:set var="indexno" value="${indexno+1 }"></c:set>
                    <tr>
                        <td>
                            <font color="red"><c:out value="${answer }"></c:out>   <c:out value="${ reply}"></c:out>    <c:out value="${score }"></c:out></font>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



        </div>
        <br/>






    </div>


</div>



</body>
</html>