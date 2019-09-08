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

<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_2.jpg');">
		<div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home</a></span></p>
            <h1 class="mb-0 bread" class="jua">글쓰기</h1>
          </div>
        </div>
      </div>
		</div>
<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
		<form method="post" action="../bimage/img_insert_ok.do" enctype="multipart/form-data">
		<!-- 카테고리번호주기 -->
			<table class="table">
				<tr>
					<th class="text-right warning" width="20%">이름</th>
					<th width="80%" class="text-left">
						<input type="text" name="name" size="15">
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">내용</th>
					<th width="80%" class="text-left">
						<textarea rows="10" cols="55" name="content"></textarea>
					</th>
				</tr>
		 		<tr>
					<th class="text-right warning" width="20%">첨부파일</th>
					<th width="80%">
						<input type="file" name="upload" size="20">
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">비밀번호</th>
					<th width="80%" class="text-left">
						<input type="password" name="pwd" size="10">
					</th>
				</tr>
				<tr>
					<th colspan="2" class="text-center">
						<input type="submit" value="글쓰기" class="btn btn-sm btn-primary" > 
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"> 
					</th>
				</tr>
			</table>
			</form>
		</div>
	</div>
</section>
</body>
</html>