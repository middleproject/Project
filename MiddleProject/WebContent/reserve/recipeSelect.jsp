<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

			$.ajax({
				type:'post',
				url:'../reserve/blank.do',
				success:function(response){
					$('#print').html(response);
				}
			});
	
});
</script>
</head>
<body>
<center id="select1_hi" title="${vo.poster }">
<h6 id="select1_" title="${vo.no}" style="font: 8px; color: green;">${vo.summary}&nbsp;</h6>
</center>
</body>
</html>