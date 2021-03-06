<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="<%=org.apache.shiro.SecurityUtils.getSubject().getPrincipal()%>"/>
<c:set var="className" value="${principal.className}"/>

<html>
<head>
    <title>考试得分</title>
</head>

<body>
<!--主题部分-->
<div class="tearchpagebox">
    <!--左边菜单-->
    <c:if test="${className != 'ysfx'}">
        <ul class="nav nav-tabs">
            <li class="${defaultActive}<c:if test="${project == '北校区大气PM2.5中多环芳烃分析'}"> active </c:if>"><a href="${ctx}/student/examlist?project=北校区大气PM2.5中多环芳烃分析">北校区大气PM2.5中多环芳烃分析</a></li>
            <li class="<c:if test="${project == '汽修喷漆车间废水中苯系物分析'}"> active </c:if>"><a href="${ctx}/student/examlist?project=汽修喷漆车间废水中苯系物分析">汽修喷漆车间废水中苯系物分析</a></li>
            <li class="<c:if test="${project == '南三区土壤中塑化剂分析'}"> active </c:if>"><a  href="${ctx}/student/examlist?project=南三区土壤中塑化剂分析">南三区土壤中塑化剂分析</a></li>
        </ul>
    </c:if>
    <c:if test="${className == 'ysfx'}">
        <ul class="nav nav-tabs">
            <li class="${defaultActive}<c:if test="${project == '南校区大气PM2.5中元素分析'}"> active </c:if>"><a href="${ctx}/student/examlist?project=南校区大气PM2.5中元素分析">南校区大气PM2.5中元素分析</a></li>
            <li class="<c:if test="${project == '高碑店污水处理厂活性污泥中铬元素分析'}"> active </c:if>"><a href="${ctx}/student/examlist?project=高碑店污水处理厂活性污泥中铬元素分析">高碑店污水处理厂活性污泥中铬元素分析</a></li>
            <li class="<c:if test="${project == '南校区自备井水质异味排查'}"> active </c:if>"><a  href="${ctx}/student/examlist?project=南校区自备井水质异味排查">南校区自备井水质异味排查</a></li>
        </ul>
    </c:if>
    <br/>
    <div class="leftMenubox" style="min-height: 150px;padding-left: 20px;width: 150px">
        <p>本次答卷得分：<font color="red" size="6">${sumScore }</font></p>
        <div>考试时间：${examvo.examTime}</div>
    </div>
    <!--左边菜单 end-->

    <div class="rightData" style="width: 770px;border: 0px">
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
                            <ol type="A" style="padding-left: 30px">
                                <c:forEach items="${resultlist}" var="result">
                                    <c:if test="${result.examQuestionId==que.id}">
                                        <c:set var="answers" value=""/>
                                        <c:set var="replys" value=""/>
                                        <c:set var="score" value="0" />
                                        <c:forEach items="${que.selectItems}" var="item">
                                            <c:if test="${que.type==1 }">
                                                <li style="list-style:inherit; margin-left: 30px">
                                                    <input type='radio' name='${que.id }' id='${item.id}' value='${item.id}'
                                                            <c:if test="${result.chooseQuestionId==fn:trim(item.id)}">

                                                                <c:set var="reply" value="${item.selectCont}" />
                                                                checked=true
                                                            </c:if>
                                                           style="margin-left: -50px;margin-bottom: 8px"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <c:if test="${que.questionAnswerId==fn:trim(item.id)}"><c:set var="answer" value="${item.selectCont}" /> </c:if>
                                                        ${item.selectCont }
                                                    <c:if test="${que.questionAnswerId==fn:trim(item.id)&&result.chooseQuestionId==fn:trim(item.id) }">
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
                                <c:set var="color" value="red"/>
                                <c:if test="${score>0}"><c:set var="color" value="green"/> </c:if>
                                <span style="color:${color}">正确答案：${answer } 学生答案： ${ reply}  得分：${score }</span>
                            </c:if>
                            <c:if test="${que.type==2 }">
                                <c:set var="color" value="red"/>
                                <c:if test="${fn:contains(replys,answers) }"><c:set var="color" value="green"/> </c:if>

                                <span style="color:${color}">正确答案：${answers } 学生答案：${ replys} </span>

                                <c:if test="${fn:contains(replys,answers) }">
                                    <span style="color:${color}">${que.questionScore}</span>
                                </c:if>
                                <c:if test="${not fn:contains(replys,answers) }">
                                    <span style="color:${color}">0</span>
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