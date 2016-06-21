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
<title>《北校区大气PM2.5中多环芳烃分析》</title>


</head>
<body>
<style>
    .modal-body p{text-indent:2em}
</style>

          <c:if  test="${className == 'ysfx'}">

<div class="listbox" style="background:#fff">
    <div  class="row">
        <div class="span10" style="width: 990px">
            <div class="widget-well">
                <div class="widget-head">
                    <h4>课程内容</h4>
                </div>
                <div class="widget-container">
                    <div class="widget-block context">
                        <p style="text-indent:2em;">《复杂基体元素指标分析》课程包括北京市工业技师学院南校区自备井水质异味排查、高碑店污水处理厂活性污泥中Cr元素分析和北京市工业技师学院南校区大气PM2.5中元素分析三个学习项目。<a href="#myModal" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                    </div>
                </div>
            </div>
        </div>
        <div class="span11" style="width: 990px">
            <div class="widget-well">
                <div class="widget-head">
                    <h4>学习方法</h4>
                </div>
                <div class="widget-container">
                    <div class="widget-block context">
                        <p style="text-indent:2em;">本课程的开发以“鱼骨图”技术为基础，学生应按照六个环节的顺序进行学习，遇到困难时，应按照提示寻找问题答案；为了增强互动性和突出操作，特设置了“模拟实验室”，学生在学习过程中，可随时切换，从而掌握学习的方法和操作技能。<a href="#myModal2" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                    </div>
                </div>
            </div>
        </div>
        <div class="span11" style="width: 990px">
            <div class="widget-well">
                <div class="widget-head">
                    <h4>学习目标</h4>
                </div>
                <div class="widget-block context">
                    <p style="text-indent:2em;">学生学习完本课程后，能独立操作采样器对废水、大气和污泥样品进行采集，并能胜任样品中Cr元素和大气PM2.5中元素等指标分析检测任务。</p>
                    <p style="text-indent:2em;">本课程旨在培养学生的综合职业能力。</p>

                    <p style="text-indent:2em;">通过本课程的学习，学生能提高液体样品的采集、制备、贮存和检测等相关技能。<a href="#myModal3" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>课程内容</h3>
    </div>
    <div class="modal-body">
        <p>每个学习项目均来自生产实际，以任务驱动设置若干教学环节，如：接受任务、制定计划、实施分析检测、验收交付和总结拓展。以实训项目作为载体，在完成每一个实训环节中帮助学生获取经验性知识，并渗透理论知识的讲授，在完成数个任务的基础上，再拓展相关技术理论知识，最后以技术理论知识指导拓展项目的完成。</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>
<!-- Modal -->
<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>学习方法</h3>
    </div>
    <div class="modal-body">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;本课程是环境保护与检测专业课程体系中的一体化课程之一，该课程内容框架由实践情境构成，以工作过程为中心，以水质、大气和污泥检测任务为驱动，充分体现了环境保护与检测专业高技能人才的培养规格和要求。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;本课程突出课程的实用性、技术性、综合性，使学生熟练掌握复杂基体有机物指标分析技术，具备从事分析检测的素质、知识与技能和一定的分析问题、解决问题的能力，逐步培养学生严谨的工作作风和良好的职业道德，树立全面质量管理意识，为后续的专业课程学习打下扎实基础。
        </p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>

<!-- Modal -->
<div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>学习目标</h3>
    </div>
    <div class="modal-body">
        <p style="text-indent:0em;">通过本课程的学习，学生可提高以下各种技能：</p>

            <ol style="padding-left: 30px">
                <li style="list-style:inherit">样品采集方案的制定。</li>
                <li style="list-style:inherit">样品采集操作的前期准备。</li>
                <li style="list-style:inherit">样品采集操作和采样现场发生异常情况的处理。</li>
                <li style="list-style:inherit">湿法消解、微波消解。</li>
                <li style="list-style:inherit">ICP仪器的结构与工作原理。</li>
                <li style="list-style:inherit">ICP仪器的参数设置。</li>
                <li style="list-style:inherit">ICP仪器的规范操作：开机、关机；波长校准；观测位置的调节；观测方向选择。</li>
                <li style="list-style:inherit">ICP仪器的维护与保养：如矩管的清洗与更换；蠕动泵样品管的更换；雾化室的清洗与更换；雾化器的清洗与更换；冷水循环器的日常维护；空压机的日常维护。</li>
            </ol>

    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>
          </c:if>

<c:if  test="${className != 'ysfx'}">

    <div class="listbox">
        <div  class="row">
            <div class="span11" style="width: 990px">
                <div class="widget-well">
                    <div class="widget-head">
                        <h4>课程内容</h4>
                    </div>
                    <div class="widget-container">
                        <div class="widget-block context">
                            <p style="text-indent:2em;">《复杂基体有机物指标分析》课程包括学院汽修喷漆车间废水中苯系物分析、北校区大气PM2.5中多环芳烃分析和南三区土壤中塑化剂分析三个学习项目。<a href="#myModal" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="span11" style="width: 990px">
                <div class="widget-well">
                    <div class="widget-head">
                        <h4>学习方法</h4>
                    </div>
                    <div class="widget-container">
                        <div class="widget-block context">
                            <p style="text-indent:2em;">本课程的开发以“鱼骨图”技术为基础，学生应按照六个环节的顺序进行学习，遇到困难时，应按照提示寻找问题答案；为了增强互动性和突出操作，特设置了“模拟实验室”，学生在学习过程中，可随时切换，从而掌握学习的方法和操作技能。<a href="#myModal2" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="span11" style="width: 990px">
                <div class="widget-well">
                    <div class="widget-head">
                        <h4>学习目标</h4>
                    </div>
                    <div class="widget-block context">
                        <p style="text-indent:2em;">学生学习完本课程后，能独立操作采样器对废水、大气和土壤样品进行采集，并能胜任样品中苯系物、多环芳烃和塑化剂等指标分析检测任务。</p>
                        <p style="text-indent:2em;">本课程旨在培养学生的综合职业能力。</p>

                        <p style="text-indent:2em;">通过本课程的学习，学生能提高液体样品的采集、制备、贮存和检测等相关技能。<a href="#myModal3" data-toggle="modal" more="">更多信息&nbsp;.&nbsp;.&nbsp;.</a></p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3>课程内容</h3>
        </div>
        <div class="modal-body">
            <p>每个学习项目均来自生产实际，以任务驱动设置若干教学环节，如：接受任务、制定计划、实施分析检测、验收交付和总结拓展。以实训项目作为载体，在完成每一个实训环节中帮助学生获取经验性知识，并渗透理论知识的讲授，在完成数个任务的基础上，再拓展相关技术理论知识，最后以技术理论知识指导拓展项目的完成。</p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
        </div>
    </div>
    <!-- Modal -->
    <div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3>学习方法</h3>
        </div>
        <div class="modal-body">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;本课程是环境保护与检测专业课程体系中的一体化课程之一，该课程内容框架由实践情境构成，以工作过程为中心，以水质、大气和土壤检测任务为驱动，充分体现了环境保护与检测专业高技能人才的培养规格和要求。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;本课程突出课程的实用性、技术性、综合性，使学生熟练掌握复杂基体有机物指标分析技术，具备从事分析检测的素质、知识与技能和一定的分析问题、解决问题的能力，逐步培养学生严谨的工作作风和良好的职业道德，树立全面质量管理意识，为后续的专业课程学习打下扎实基础。
            </p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
        </div>
    </div>

    <!-- Modal -->
    <div id="myModal3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3>学习目标</h3>
        </div>
        <div class="modal-body">
            <p style="text-indent:0em;">通过本课程的学习，学生可提高以下各种技能：</p>

            <ol style="padding-left: 30px">
                <li style="list-style:inherit">样品采集方案的制定。</li>
                <li style="list-style:inherit">样品采集操作的前期准备。</li>
                <li style="list-style:inherit">样品采集操作和采样现场发生异常情况的处理。</li>
                <li style="list-style:inherit">顶空进样技术。</li>
                <li style="list-style:inherit">溶剂萃取技术。</li>
                <li style="list-style:inherit">SPE技术。</li>
                <li style="list-style:inherit">索氏提取技术。</li>
                <li style="list-style:inherit">ASE技术。</li>
                <li style="list-style:inherit">气-质联用色谱仪的结构与工作原理。</li>
                <li style="list-style:inherit">气-质联用色谱仪的参数设置。</li>
                <li style="list-style:inherit">气-质联用色谱仪的规范操作：开机、关机；调谐；制备标准曲线；样品分析。</li>
                <li style="list-style:inherit">气-质联用色谱仪的维护与保养，包括色谱柱的安装；进样隔垫更换；进样针的清洗与更换；进样口衬管洗涤与更换；离子源清洗；离子源灯丝的更换。</li>
            </ol>

        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
        </div>
    </div>
</c:if>
</body>
</html>
