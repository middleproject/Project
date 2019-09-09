<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../main/css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function difficulty(){
	$('.difficulty').click(function difficulty(){
		var difficultystep=$(this).attr("data-difficultystep");
		
		
		$('#difficultystep').text(difficultystep);
		
		$.ajax({
			type:'post',
			url:'../search/difficultylist.do',
			data:{info:difficultystep},
			success:function(response)
			{
				
				$('#difficultylist').html(response);
			}
		});
	});
});
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

</head>
<body>

     <ul class="product-category">
     <div class="tagcloud" >
       <c:forEach var="ingredetailname" items="${list }">
    	<li class="searchlist" data-detailname="${ingredetailname }"><a>${ingredetailname }</a></li>			
       </c:forEach>
       </div>
     </ul>
     <br>
    					<c:forEach var="dvo" items="${dlist }">
    					<li class="difficulty" data-difficultystep="${dvo.difficultystep }"><a class="active">${dvo.difficultystep }</a></li>
    					</c:forEach>
    
</body>
</html>