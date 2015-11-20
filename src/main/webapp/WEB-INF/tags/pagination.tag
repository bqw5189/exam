<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int current =  page.getNumber() + 1;
int begin = Math.max(1, current - paginationSize/2);
int end = Math.min(begin + (paginationSize - 1), page.getTotalPages());

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
%>

<div class="pagination">
	<ul class="uk-pagination">
		 <% if (page.hasPreviousPage()){%>
               	<li><a href="?page=1&sortType=${sortType}&${searchParams}">&lt;&lt;</a></li>
                <li><a href="?page=${current-1}&sortType=${sortType}&${searchParams}">&lt;</a></li>
         <%}else{%>
         		<li class="uk-disabled"><a href="#"><i class="uk-icon-angle-double-left"></i></a></li> 
         <%} %>
 
		<c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="uk-active"><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?page=${i}&sortType=${sortType}&${searchParams}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
	  
	  	 <% if (page.hasNextPage()){%>
               	<li><a href="?page=${current+1}&sortType=${sortType}&${searchParams}">&gt;</a></li>
                <li><a href="?page=${page.totalPages}&sortType=${sortType}&${searchParams}">&gt;&gt;</a></li>
         <%}else{%>
         		<li><a href="#"><i class="uk-icon-angle-double-right"></i></a></li> 
         <%} %>

	</ul>
</div>

