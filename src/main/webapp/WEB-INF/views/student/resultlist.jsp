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
                <tr>
                    <td>
                        <ol type="A">
                    <c:forEach items="${resultlist}" var="result">
                        <c:if test="${result.examQuestionId==que.id}">
                            <c:set var="answers" value=""/>
                            <c:set var="replys" value=""/>
                            <c:set var="score" value="0" />
                            <c:forEach items="${que.selectItems}" var="item">
                                <c:if test="${que.type==1 }">
                                    <li style="list-style:inherit; margin-left: 30px">
                                            <input type='radio' name='${que.id }' id='${item.id}' value='${item.id}'
                                            <c:if test="${result.chooseQuestionId==item.id}">

                                                <c:set var="reply" value="${item.selectCont}" />
                                                   checked=true
                                            </c:if>
                                                   style="margin-left: -50px;margin-bottom: 8px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <c:if test="${que.questionAnswerId==item.id}"><c:set var="answer" value="${item.selectCont}" /> </c:if>
                                                ${item.selectCont }
                                            <c:if test="${que.questionAnswerId==item.id&&result.chooseQuestionId==item.id }">
                                                <c:set var="score" value="${que.questionScore}" /></c:if>

                                    </li>

                                </c:if>
                                <c:if test="${que.type==2 }">

                        <li style="list-style:inherit; margin-left: 30px">
                                            <input type='checkbox' name='${que.id }' id='${item.id}' value='${item.id}'
                                            <c:if test="${fn:contains(result.chooseQuestionId,item.id)}">
                                                <c:set var="replys" value="${replys}   ${item.selectCont}" />
                                                   checked=true
                                            </c:if>
                                                   style="margin-left: -50px;margin-bottom: 8px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <c:if test="${fn:contains(que.questionAnswerId,item.id)}">
                                                <c:set var="answers" value="${answers}   ${item.selectCont}" /> </c:if>
                                                ${item.selectCont }


                        </li>
                                </c:if>
                            </c:forEach>
                        </c:if>

                    </c:forEach>

                        </ol>
                    </td>
                </tr>

                    <c:set var="indexno" value="${indexno+1 }"></c:set>
                    <tr>
                        <td>
                            <c:if test="${que.type==1 }">
                                <font color="red">正确答案：</font>${answer }  <font color="red">学生答案：</font>${ reply}    <font color="red">得分：</font>${score }
                            </c:if>
                            <c:if test="${que.type==2 }">
                                <font color="red">正确答案：</font>${answers } <font color="red">学生答案：</font>${ replys}

                                <c:if test="${fn:contains(replys,answers) }">
                                    <font color="red">得分：</font>${que.questionScore}"
                                </c:if>
                                <c:if test="${not fn:contains(replys,answers) }">
                                    <font color="red">得分：</font>0
                                </c:if>
                            </c:if>

                            <hr/>
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