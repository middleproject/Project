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
		<h2 class="text-center">첨부파일글쓰기</h2>
		<div class="row">
		<form method="post" action="../databoard/databoard_insert_ok.do" enctype="multipart/form-data"> <!-- ★파일업로드 시키고싶으면 enctype 필수추가 -->
			<table class="table">
				<tr>
					<th class="text-right info" width="15%">이름</th>
					<th width="85%"  align="left">
						<input type="text" name="name" size="15"> 
					</th>
				</tr>
				<tr>
					<th class="text-right info" width="15%">제목</th>
					<th width="85%">
						<input type="text" name="subject" size="45">
					</th>
				</tr>
				<tr>
					<th class="text-right info" width="15%">내용</th>
					<th width="85%">
						<textarea rows="10" cols="55" name="content"></textarea>
					</th>
				</tr>
				<tr>
					<th class="text-right info" width="15%">첨부파일</th>
					<th width="85%">
						<input type="file" name="upload" size="20">
					</th>
				</tr>
				<tr>
					<th class="text-right info" width="15%">비밀번호</th>
					<th width="85%">
						<input type="password" name="pwd" size="10">
					</th>
				</tr>
				<tr>
					<th colspan="2" class="text-center">
						<input type="submit" value="글쓰기" class="btn btn-sm btn-success" >  
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"> 
					</th>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>