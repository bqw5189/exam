<%@tag pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div data-uk-dropdown="{mode:'click'}" class="uk-button-dropdown" aria-haspopup="true" aria-expanded="false"> 
    <a class="md-btn">排序: ${sortTypes[param.sortType]} <i class="material-icons"></i></a>
    <div class="uk-dropdown" style="min-width: 200px;"> 
	<ul class="uk-nav uk-nav-dropdown" >
	   	<c:forEach items="${sortTypes}" var="entry">
	   		<li><a href="?sortType=${entry.key}&${searchParams}">${entry.value}</a></li>
		</c:forEach>
	</ul>
	</div>
</div>
