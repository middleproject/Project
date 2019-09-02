<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>보낸 사람</th>
			<th>보낸 날짜</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		<tr>
			<td>${vo.memberid }</td>
			<td>${vo.day }</td>
			<td>${vo.sub }</td>
			<td>${vo.content }</td>
		</tr>
	</table>
</body>
</html>