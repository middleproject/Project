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
				success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
					$('#print').html(response);
				}
			});
	
});
</script>
</head>
<body>
<h6 id="select2_" title="${areaName}" style="font: 8px; color: green;">위치 : ${areaT}</h6>
</body>
</html>