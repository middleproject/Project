<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').click(function(){
		var textsearch=$('#textsearch').val();
		if(textsearch.trim()=="")
		{
			$('#textsearch').focus();
			return;
		}
		$('#frm').submit();
	});
});
</script>
</head>
<body>
	 <section class="ftco-section ftco-degree-bg">
	<div class="container">
		<h1 class="text-center">자유게시판</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-left">
						${curpage } page / ${totalpage } pages
					</td>
					<td class="text-right">
						<a href="../board/board_insert.do?boardDis=6" class="btn btn-primary">글쓰기</a><!-- ♥ -->
					</td>
				</tr>
			</table>
			<table class="table">
				<tr class="warning">
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
					<c:set var="count" value="${count }"/>
						<c:forEach var="vo" items="${list }" varStatus="s">
							<tr class="${s.index%2==0?'':'success' }">
								<th width="10%" class="text-center">${vo.num }</th> 
								<th width="45%" class="text-left"><a href="../board/board_detail.do?no=${vo.boardno }">${vo.subject }</a>
									<c:if test="${today==vo.dbday }">
										<sup><font color="red">new</font></sup>
									</c:if>
								</th>
								<th width="15%" class="text-center">${vo.memberid }</th>
								<th width="20%" class="text-center">${vo.dbday }</th>
								<th width="10%" class="text-center">${vo.hit }</th>
							</tr>
								<c:set var="count" value="${count-1 }"/>
						</c:forEach>
			</table>
			
			<table class="table">
				<tr>
					<td class="text-left">
						<form action="../board/find.do" id="frm">
						Search : 
						<select name="fs" class="input-sm">
							<option value="memberId">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="textsearch" class="input-sm" size="15" id="textsearch">
						<input type="button"  value="검색" class="btn btn-outline-primary"  id="findBtn">
						</form>
					</td>
					<!-- 페이지 넘어가는 부분 -->
				<td class="text-center">
						<ul class="pagination">
							<li><a href="../board/board_list.do?page=1">&lt;&lt;</a></li>
							<li><a href="#">&lt;</a></li>
								<c:forEach var="i" begin="1" end="${totalpage }">
									<li class="${i==curpage?'active':''}"><a href="../board/board_list.do?page="${i }>${i }</a>
								</c:forEach>
							<li><a href="#">&gt;</a></li>
							<li><a href="../board/board_list.do?page=${totalpage }">&gt;&gt;</a></li>
						</ul>
					</td>
						</ul>
				
				</tr>
			</table>
		</div>
	</div>
	</section>
</body>
</html>