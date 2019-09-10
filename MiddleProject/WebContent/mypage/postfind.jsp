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
	width:450px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	$('#postBtn').click(function(){
		var dong=$('#dong').val();
		if(dong==""){
			$('#dong').focus();
			return;
		}else{
			$.ajax({
				type:'post',
				url:'post_result.jsp',
				data:{dong:dong},
				success:function(result){
					$('#print').html(result);
				}
			})
		}
	})
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-left">
						입력:<input type="text" name=dong size=15 id="dong">
							<input type="button" value="검색" class="btn btn-sm btn-primary" id="postBtn">
					</td>
				</tr>
			</table>
			<div id="print"></div>
		</div>
	</div>
</body>
</html>