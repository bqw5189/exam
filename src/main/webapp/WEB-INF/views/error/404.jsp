<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
	<link rel="stylesheet" href="assets/css/error_page.min.css" /> 
</head>

<body class="error_page">
	<div class="error_page_header"> 
   <div class="uk-width-8-10 uk-container-center">
	404 - 页面不存在.
   </div> 
  </div> 
  <div class="error_page_content"> 
   <div class="uk-width-8-10 uk-container-center"> 
    <p class="heading_b">Page not found</p> 
    <p class="uk-text-large"> The requested URL <span class="uk-text-muted">/some_url</span> was not found on this server. </p> 
    <a href="<c:url value="/"/>">返回首页</a> 
   </div> 
  </div> 
</body>
</html>