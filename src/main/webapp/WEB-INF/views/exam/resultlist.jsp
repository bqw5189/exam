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
<form id="submitForm" action="" method="post" class="form-horizontal">
    <div class="md-card">
        <div class="md-card-content">
            <table id="dt_default" class="uk-table">
                <div><b>当前位置:>>考试得分</b></div>
                <tbody>
                <tr>
                    <td align="center"><center><strong>${examvo.examName }</strong></center>${userName} 本次答卷得分：<font color="red" size="6">${sumScore }</font></td>
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
                        <td>${indexno} 、${que.questionCont }</td>
                    </tr>
                    <c:forEach items="${resultlist}" var="result">
                        <c:if test="${result.examQuestionId==que.id}">
                            <c:set var="answers" value=""/>
                            <c:set var="replys" value=""/>
                            <c:set var="score" value="0" />
                            <c:forEach items="${que.selectItems}" var="item">
                                <c:if test="${que.type==1 }">
                                    <tr>
                                        <td>
                                            <input type='radio' name='${que.id }' id='${fn:trim(item.id)}' value='${fn:trim(item.id)}'
                                            <c:if test="${result.chooseQuestionId==fn:trim(fn:trim(item.id))}">

                                                <c:set var="reply" value="${item.selectCont}" />
                                                   checked=true
                                            </c:if>
                                                    >
                                            <c:if test="${fn:trim(que.questionAnswerId)==fn:trim(item.id)}"><c:set var="answer" value="${item.selectCont}" /> </c:if>
                                                ${item.selectCont }
                                            <c:if test="${fn:trim(que.questionAnswerId)==fn:trim(item.id)&&fn:trim(result.chooseQuestionId)==fn:trim(item.id) }">
                                                <c:set var="score" value="${que.questionScore}" /></c:if>
                                            </input>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${que.type==2 }">
                                    <tr>
                                        <td>
                                            <input type='checkbox' name='${que.id }' id='${fn:trim(item.id)}' value='${fn:trim(item.id)}'
                                            <c:if test="${fn:contains(result.chooseQuestionId,fn:trim(item.id))}">
                                                <c:set var="replys" value="${replys}   ${item.selectCont}" />
                                                   checked=true
                                            </c:if>
                                                    >
                                            <c:if test="${fn:contains(que.questionAnswerId,fn:trim(item.id))}">
                                                <c:set var="answers" value="${answers}   ${item.selectCont}" /> </c:if>
                                                ${item.selectCont }

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
                            <c:if test="${que.type==1 }">
                            <c:if test="${score<=0}">
                            <font color="red">
                                </c:if>
                                <c:if test="${score>0}">
                                <font color="green">
                                    </c:if>
                                    正确答案：${answer }  学生答案：${ reply}    得分：${score }</font>
                                </c:if>
                                <c:if test="${que.type==2 }">
                                <c:if test="${fn:contains(replys,answers) }">
                                <font color="green">正确答案：${answers } 学生答案： ${ replys} 得分：${que.questionScore} </font>
                                </c:if>
                                <c:if test="${not fn:contains(replys,answers) }">
                                <font color="red">正确答案：${answers } 学生答案：${ replys} 得分：0 </font>
                                </c:if>
                                </c:if>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div align="center">
                <c:if test="${role=='user' }">
                    <input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="window.location='${ctx}/examlist'"/>
                </c:if>
                <c:if test="${role=='teacher' }">
                    <input id="cancel_btn" class="md-btn md-btn-primary" type="button" value="返回" onclick="history.back()"/>
                </c:if>
            </div>
        </div>
    </div>
</form>
</body>
</html>