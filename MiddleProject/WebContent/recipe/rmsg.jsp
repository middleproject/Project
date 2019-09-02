<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#detail').click(function(){
		var no=$(this).attr("value");
		$.ajax({
			type:'post',
			url:'recipe/msgdetail.do',
			data:{no:no},
			success:function(res){
				$('#print').html(res);
			}
		});
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="msgdetail">
	<table class="table">
		<thead class="thead-primary">
			<tr class="text-center">
				<th>제목</th>
				<th></th>
				<th class="text-center">내용</th>
				<th class="text-center"></th>
				<th class="text-center">보낸 사람</th>
				<th class="text-center">날짜</th>
			</tr>
		</thead>
		<c:forEach var="rvo" items="${rlist }">
			<tr class="text-center" height="100">
				<td class="text-center"><a href="#" value="${rvo.msgno }" id="detail">${rvo.sub }</a></td>
				<td class="text-center" colspan=3><p>${rvo.content }</p></td>
				<td class="text-center">${rvo.memberid }</td>
				<td class="text-center">${rvo.day }</td>
			</tr>
			<!-- END TR-->
		</c:forEach>
	</table>
	</div>
</body>
</html>