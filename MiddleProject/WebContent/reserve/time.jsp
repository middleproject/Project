<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

	$('.timeselect').click(function(){
		var time=$(this).text();
		var datedata=$('#datedata').text();

		
		$.ajax({
			type:'post',
			url:'../reserve/dateSelect.do',
			data:{time:time,datedata:datedata},
			success:function(response) {
				$('#select4').html(response);
			}
		});
	});

});
</script>
</head>
<body>
<table style="width: 550px;">
	<tr>
		<td colspan="3" id="datedata">${data}</td>
	</tr>
		
		<tr>
          <td width=21 height=21 class="text-center timeselect"><div id="circle" ${ch1==null?"class=btn-info":"" }>아침</div></td>
          <td width=21 height=21 class="text-center timeselect"><div id="circle" ${ch2==null?"class=btn-info":"" }>점심</div></td>
          <td width=21 height=21 class="text-center timeselect"><div id="circle" ${ch3==null?"class=btn-info":"" }>저녁</div></td>

	</tr>
</table>


</body>
</html>