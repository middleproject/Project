<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i = 0;
$(function(){
	$('.del_update').click(function() {
		var no=$(this).attr("value");
		$('.dels').hide();
		if(i==0) {
			$('#del'+no).show();
			$(this).text("취소");
			i=1;
		} else {
			$('#del'+no).hide();
			$(this).text("수정");
			i=0;
		}
	});
});
</script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	.row {
		margin: 0px auto;
		width: 1200px;
	}
</style>
</head>
<body>
<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_3.jpg');">
		<div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p><span class="mr-2"><a href="../main/main.do">Home</a></span></p>
            <h1 class="mb-4">상세보기</h1>
          </div>
        </div>
      </div>
		</div>
<section class="ftco-section ftco-degree-bg">
	<div class="container">

		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center success" width="20%">번호</th>
					<th class="text-center" width="30%">${vo.no }</th>
					<th class="text-center success" width="20%">작성일</th>
					<th class="text-center" width="30%">${vo.dbday }</th>
				</tr>
				<tr>
					<th class="text-center success" width="20%">이름</th>
					<th class="text-center" width="30%">${vo.name }</th>
					<th class="text-center success" width="20%">조회수</th>
					<th class="text-center" width="30%">${vo.hit }</th>
				</tr>
				<tr>
					<th class="text-center success" width="20%">제목</th>
					<th class="text-left" colspan="3">${vo.subject }</th>
				</tr>
				<c:if test="${vo.filesize>0 }"><!-- ------조건에 맞으면 출력 -->
				<tr>
					<th class="text-center success" width="20%">첨부파일</th>
					<th class="text-left" colspan="3">
						<a href="download.jsp?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)
					</th>
					
				</tr>
				</c:if>
				<tr>
					<th colspan="4" class="text-left" valign="top" height="200">${vo.content }</th>
				</tr>
				<tr>
					<th colspan="4" class="text-right">
						<a href="../databoard/databoard_update.do?no=${vo.no }&page=${curpage }" class="btn btn-sm btn-success">수정</a>
						<a href="../databoard/databoard_delete.do?no=${vo.no }" class="btn btn-sm btn-warning">삭제</a>
						<a href="../databoard/databoard_list.do?page=${curpage }" class="btn btn-sm btn-success">목록</a>
					</th>
				</tr>
				
			</table>
		</div>
		
	</div>
</section>
</body>
</html>