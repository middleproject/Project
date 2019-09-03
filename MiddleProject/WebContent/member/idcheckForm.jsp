<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
.row{
	margin:0px auto;
	width:320px;
}
</style>
</head>
<body onload="pValue()">
	<div class="container">
		<div class="row">
			<div style="height:20px"></div>
			<table class="table">
				<tr>
					<td>
					ID: <input type=text name=id size=15 class="input-sm" id=id>
					<input type="button" value="중복확인" class="btn btn-sm btn-primary" id=idBtn>
					</td>
				</tr>
				<tr>
					<td class="text-center" id="res"></td>
				</tr>
				<tr>
					<td class="text-center" id="ok"></td>
				</tr>
				<tr>
					<td>
						<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
       					<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
					</td>
				</tr>
			 </table>
		</div>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function pValue(){
		document.getElementById("userId").value = opener.document.userInfo.id.value;
	}
</script>
</html>