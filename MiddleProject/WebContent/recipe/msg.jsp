<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#select').click(function(){
		var data=$("#list option:selected").attr("value");
		var id =$("#hidden").attr("value");
		if(data==1){
			location.href="../recipe/msg.do";
		}
		if(data==2){
			$.ajax({
				type:'post',
				url:'rmsg.do',
				data:{data:data,id:id},
				success:function(res)
				{
					$('#print').html(res);
				}
			});
		}
		if(data==3){
			$.ajax({
				type:'post',
				url:'sendmsg.do',
				data:{data:data,id:id},
				success:function(res)
				{
					$('#print').html(res);
				}
			});
		}
		
	});
});
</script>
<head>
<meta charset="UTF-8">
</head>
<body>
										
	<div class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
					<select id="list">
						<option value="1">보낸 메세지</option>
						<option value="2">받은 메세지</option>
						<option value="3">메세지 보내기</option>
					</select>
					<input type="button" class="btn btn-sm btn-danger" id="select" value="확인" >
					<input type="hidden" data-id="${id }" id="hidden">	
					
					
					<div id="print">					
						<table class="table" id="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>제목</th>
									<th></th>
									<th class="text-center">내용</th>
									<th class="text-center"></th>
									<th class="text-center">받은 사람</th>
									<th class="text-center">날짜</th>
								</tr>
							</thead>
							<c:forEach var="vo" items="${list }">
								<tr class="text-center">
								
									<td class="text-center"><a href="#">${vo.sub }</a></td>
									<td class="text-center" colspan=3><p>${vo.content }</p></td>
									<td class="text-center">${vo.id }</td>
									<td class="text-center">${vo.day }</td>
								</tr>
								<!-- END TR-->
								</c:forEach>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>