<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
.row{
	margin:0px auto;
	width:320px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var id=$('#id').val();
	if(id==""){
		$('#res').text('아이디를 입력하세요');
	}
	$('#idBtn').click(function(){
		id=$('#id').val();
		if(id==""){
			$('#id').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'idcheck_result.do',
			data:{id:id},
			success:function(res){
				var no=res.trim();
				if(no==0){
					$('#res').html('<font color=blue>'+id+'는(은) 사용 가능한 아이디입니다.</font>');
					$('#ok').html('<input type=button value="확인" onclick=ok("'+id+'")>');
				}else{
					$('#res').html('<font color=red>'+id+'는(은) 이미 사용중 입니다. <br> 다른 아이디를 입력하세요.</font>');
				}
			}
		});
	});
});
function ok(id){
	parent.join_frm.id.value=id;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div style="height:20px"></div>
			<table class="table">
				<tr>
					<td>
					ID: <input type=text name=id size=15 class="input-sm" id=id>
					<input type="button" value="중복체크" class="btn btn-sm btn-primary" id=idBtn>
					</td>
				</tr>
				<tr>
					<td class="text-center" id="res"></td>
				</tr>
				<tr>
					<td class="text-center" id="ok"></td>
				</tr>
			 </table>
		</div>
	</div>
</body>
</html>