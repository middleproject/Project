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
	$('#commandch').click(function(){
		var commandText = $('#commandText').val();
		
		$.ajax({
			type:'post',
			url:'../reserve/commandSelect.do',
			data:{commandText:commandText},
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#select6').html(response);
			}
		});
	});
});
</script>
</head>
<body>	
	<div class="text-center">요청사항</div>
	<textarea rows="15" cols="68" id=commandText></textarea>
	<button class="btn btn-info" id="commandch">확인</button>
</body>
</html>