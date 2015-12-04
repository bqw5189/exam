<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户注册</title>
    <%--<shiro:hasRole name="student">--%>
        <%--<script>--%>
            <%--location.href="${ctx}/student"--%>
        <%--</script>--%>
    <%--</shiro:hasRole>--%>
</head>
<body>
<!-- statistics (small charts) -->
<div class="uk-grid uk-grid-width-large-1-4 uk-grid-width-medium-1-2 uk-grid-medium uk-sortable sortable-handler hierarchical_show" data-uk-sortable="" data-uk-grid-margin="">
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-float-right uk-margin-top uk-margin-small-right">
                    <span class="peity_visitors peity_data">5,3,9,6,5,9,7</span>
                </div>
                <span class="uk-text-muted uk-text-small">试卷名称</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${indexvo.examName }
          <noscript>
              12456
          </noscript></span></h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-float-right uk-margin-top uk-margin-small-right">
                    <span class="peity_sale peity_data">5,3,9,6,5,9,7,3,5,2</span>
                </div>
                <span class="uk-text-muted uk-text-small">试卷总分</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${indexvo.sumScore }
          <noscript>
              142384
          </noscript></span></h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-float-right uk-margin-top uk-margin-small-right">
                    <span class="peity_orders peity_data">64/100</span>
                </div>
                <span class="uk-text-muted uk-text-small">及格率</span>
                <h2 class="uk-margin-remove"><span class="countUpMe">${indexvo.scale }
          <noscript>
              64
          </noscript></span>%</h2>
            </div>
        </div>
    </div>
    <div>
        <div class="md-card">
            <div class="md-card-content">
                <div class="uk-float-right uk-margin-top uk-margin-small-right">
                    <span class="peity_live peity_data">5,3,9,6,5,9,7,3,5,2,5,3,9,6,5,9,7,3,5,2</span>
                </div>
                <span class="uk-text-muted uk-text-small">考试人数</span>
                <h2 class="uk-margin-remove" id="peity_live_text">${indexvo.personNum }<noscript>
              64
          </noscript></span></h2>
            </div>
        </div>
    </div>
</div>
<div data-uk-grid-margin="" class="uk-grid"> 
     <div class="uk-width-medium-1-2"> 
		<div class="md-card"> 
		       <div class="md-card-content"> 
		        <div class="uk-overflow-container"> 
		         <table class="uk-table uk-table-hover uk-table-nowrap"> 
		          <thead> 
		           <tr> 
		            <th class="uk-width-1-10 uk-text-center uk-text-upper">前五名</th> 
		           </tr> 
		          </thead> 
		          <tbody> 
		      	<c:forEach items="${personList }" var="per">
		          <tr> 
		            <td> 
		             <div data-uk-grid-margin="" class="uk-grid"> 
		              <div class="uk-width-2-5 uk-width-small-1-5 uk-text-center"> 
		               <img alt="" src="assets/img/avatars/avatar_01.png" class="md-user-image-large"> 
		              </div> 
		              <div class="uk-width-3-5 uk-width-small-4-5"> 
		               <h4 class="heading_a uk-margin-small-bottom">第${per.examOrder }名</h4> 
		               <p class="uk-margin-remove"><span class="uk-text-muted">姓名:</span> ${per.personName }</p> 
		               <p class="uk-margin-remove"><span class="uk-text-muted">得分:</span> ${per.sumScore }</p> 
		              </div> 
		             </div> </td> 
		           </tr> 
		      	</c:forEach>
		      </tbody>
		      </table>
		     </div>
		    </div>
		   </div>
		 </div>
		<div class="uk-width-medium-1-2"> 
	      <div class="md-card"> 
	       <div class="md-card-content"> 
	        <div class="uk-overflow-container"> 
	         <table class="uk-table uk-table-hover uk-table-nowrap uk-table-align-vertical"> 
	          <thead> 
	           <tr> 
	            <th class="uk-text-center  uk-text-small"> 序号</th> 
	            <th class="uk-text-center  uk-text-small"> 试卷名称</th> 
	            <th class="uk-text-center  uk-text-small"> 答题时间(分钟)</th> 
	            <th class="uk-text-center  uk-text-small"> 试卷说明</th> 
	           </tr> 
	          </thead> 
	          <tbody> 
	           <c:set var="no" value="1"></c:set>
	            <c:forEach items="${makexam }" var="exam">
		           <tr> 
		            <td class=" uk-text-small"> ${no }</td> 
		            <td class="uk-text-center"><a href="${ctx}/login/showindex?id=${exam.id}">${ exam.examName }</a></td> 
		            <td class="uk-text-center">${ exam.examTime}</td> 
		            <td class="uk-text-center">${ exam.examRemark}</td> 
		           </tr> 
	           <c:set var="no" value="${no+1 }"></c:set>
	            </c:forEach>
	          </tbody>
			</table>
		  </div>
		</div>
	  </div>
	 </div>
</div>
</body>
</html>
