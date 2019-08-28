<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.product-category li {
  display: inline-block;
  font-weight: 400;
  font-size: 16px; }
  .product-category li a {
    color: #82ae46;
    padding: 5px 20px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px; }
    .product-category li a.active {
      background: #82ae46;
      color: #fff; }
</style>
</head>
<body>
     <ul class="product-category">
       <c:forEach var="ss" items="${list }">
    	<li><a href=#>${ss }</a></li>			
       </c:forEach>
     </ul>
    
</body>
</html>