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
	margin: 0px auto;
	width: 450px;
}
</style>
</head>
<body>


	<form action="../reserve/endReserve.do" method="post">
	<center><h2>예약 내역</h2></center>
	<table class="table" style="width: 550px;" >
		
		
		<tr>
			<td colspan="2"><img id="fimg" src="${poster }" width=500px height="500px"></td>
		</tr> 
		<tr>
			<td class="text-left">레시피 번호 :</td>
			<td class="text-left" id="frecipeno">${no }
			<input type="hidden" id="hrecipeno" name="no" value="${no }">
			</td>
			
		</tr>
		<tr>
			<td class="text-left">레시피 제목 :</td>
			<td class="text-left" id="frecipetitle">${title }
			<input type="hidden" id="hrecipetitle" name="title" value="${title }">
			</td>
		</tr>
		<tr>
			<td class="text-left">요리사(id) :</td>
			<td class="text-left" id="fcheif" title="">${id }
			<input type="hidden" id="hcheif" name=id value="${id }">
			<input type="hidden" id="hcheif" name=name value="${name}">
			</td>
		</tr>
		<tr>
			<td class="text-left">날짜(시간대) :</td>
			<td class="text-left" id="fdate" title="">${date }
			<input type="hidden" id="hdate" name="date" value="${date }">
			<input type="hidden" id="htime" name="time" value="${time }">
			</td>
		</tr>
		<tr>
			<td class="text-left">제시된 가격 :</td>
			<td class="text-left" id="fprice">${price }
			<input type="hidden" id="hprice" name="price" value="${price }">
			</td>
		</tr>
		<tr>
			<td class="text-left">요청사항 :</td>
			<td class="text-left" id="fcommand">${msg }
			<input type="hidden" id="hcommand" name="msg" value="${msg }">
			</td>
		</tr>
	</table>
	<center><input type="submit" class="btn btn-info"></center>
	</form>
</body>
</html>