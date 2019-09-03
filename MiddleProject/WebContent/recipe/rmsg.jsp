<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.detail').click(function(){
		var no=$(this).attr("value");
		window.open("msgdetail.do?no="+no, 
				"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		});
	
	$('.remove').click(function(){
		var msgno = $(this).attr("value");
		alert(msgno);
		$.ajax({
			type:'post',
			url:'../recipe/msgDelete.do',
			data:{msgno:msgno},
			success:function(res)
			{
				window.location.reload()
				alert(follow+"님을 팔로우하였습니다.");
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
				<th></th>
				<th>제목</th>
				<th></th>
				<th class="text-center">내용</th>
				<th class="text-center"></th>
				<th class="text-center">보낸 사람</th>
				<th class="text-center">날짜</th>
			</tr>
		</thead>
		<c:forEach var="rvo" items="${rlist }">
			
				<c:if test="${rvo.read==1 }">
				<tr class="text-center" height="100">
					<td class="product-remove remove" value="${rvo.msgno }"><a href="#" ><span class="ion-ios-close"></span></a></td>
					<td class="text-center"><a href="" class="detail" value="${rvo.msgno }" id="detail${rvo.msgno }"><font color="gray">${rvo.sub }</font></a></td>
					<td class="text-center" colspan=3><p><font color="gray">${rvo.content }</font></p></td>
					<td class="text-center"><font color="gray">${rvo.memberid }</font></td>
					<td class="text-center"><font color="gray">${rvo.day }</font></td>
				</tr>
				</c:if>
				
				<c:if test="${rvo.read==0 }">
				<tr class="text-center" height="100">
					<td class="product-remove remove" value="${rvo.msgno }"><a href="#"><span class="ion-ios-close"></span></a></td>
					<td class="text-center"><a href="" class="detail" value="${rvo.msgno }"><font color="black"><b>${rvo.sub }</b></font></a></td>
					<td class="text-center" colspan=3><p><font color="black"><b>${rvo.content }</b></font></p></td>
					<td class="text-center"><font color="black"><b>${rvo.memberid }</b></font></td>
					<td class="text-center"><font color="black"><b>${rvo.day }</b></font></td>
				</tr>
				</c:if>
			
			<!-- END TR-->
		</c:forEach>
	</table>
	</div>
</body>
</html>