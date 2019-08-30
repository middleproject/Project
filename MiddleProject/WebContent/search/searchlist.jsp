<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.searchlist').click(function(){
		var ingredetailname=$(this).attr("data-detailname");
		
		
		$.ajax({
			type:'post',
			url:'../search/searchingre.do',
			data:{ingre:ingredetailname},
			success:function(response)
			{
				
				$('#searchingre').html(response);
			}
		});
	});
});
</script>

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
       <c:forEach var="ingredetailname" items="${list }">
    	<li class="searchlist" data-detailname="${ingredetailname }"><a href=#>${ingredetailname }</a></li>			
       </c:forEach>
     </ul>
    
</body>
</html>