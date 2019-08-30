<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.row {
		margin: 0px auto;
		width: 900px;
	}
</style>
</head>
<body>
	<div class="container">
	<h2 class="text-center">글쓰기</h2>
		<div class="row">
		<form method="post" action="../board/board_insert_ok.do"> <!-- 파일업로드 enctype-->
			<input type="hidden" name="categoryno" id="categoryno"  value="${boardDis }" > <!-- ♥ -->
			<table class="table">
				<tr> <!-- warning 노란색-->
					<th class="text-right warning" width="20%">이름</th>
					<th width="80%" class="text-left">
						<input type="text" name="name" size="15">
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">제목</th>
					<th width="80%" class="text-left">
						<input type="text" name="subject" size="45">
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">내용</th>
					<th width="80%" class="text-left">
						<textarea rows="10" cols="55" name="content"></textarea>
					</th>
				</tr>
	<!-- 		<tr>
					<th class="text-right warning" width="20%">첨부파일</th>
					<td width="80%">
						<input type="file" name="addfile" size="20">
					</td>
				</tr> -->
				<tr>
					<th class="text-right warning" width="20%">비밀번호</th>
					<th width="80%" class="text-left">
						<input type="password" name="pwd" size="10">
					</th>
				</tr>
				<tr>
					<th colspan="2" class="text-center">
						<input type="submit" value="글쓰기" class="btn btn-sm btn-primary" >  <!-- 원래는 입력한걸 검색해서 확인해봐야해서 submit주면 안됌-->
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"> 
					</th>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>