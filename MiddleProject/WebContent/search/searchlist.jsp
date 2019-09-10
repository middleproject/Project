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

$(function(){
	$('.searchlist').click(function(){
		var ingredetailname=$(this).attr("data-detailname");
		$('#choice3').val(ingredetailname);
		
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
    
    
</body>
</html>