<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.row {
		margin: 0px auto;
		width: 1200px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i=0;
$(function(){
			$('.dedede').click(function(){
				var no=$(this).attr("value");
				if(i==0)
					{
					  $('#u'+no).show();
					  i=1;
					} else {
					 $('#u'+no).hide();
					 i=0;
					}
				
	         });
});
</script>
</head>
<body>
	<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<h1 class="text-center">문의게시판</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-left">
						${curpage } page / ${totalpage } pages
					</td>
					<td class="text-right">
						<a href="../bQnA/qboard_insert.do?boardDis=1" class="btn btn-primary">글쓰기</a>
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
							<tr>
								<th width="10%" class="text-center">${count }</th> 
								<th width="45%" class="text-left" >		
									<c:if test="${vo.grouptab>0 }" >
										<c:forEach begin="0" end="${vo.grouptab }">
											&nbsp;&nbsp;
										</c:forEach>
										<img src="re.gif" >
									</c:if>	
									<c:if test="">
									
									</c:if>
										<a href="#" class="dedede" value="${vo.boardno }">
											${vo.subject }
										</a>		
									<c:if test="${today==vo.dbday }">
										<sup><font color="red">new</font></sup>
									</c:if>
								</th>
								<th width="15%" class="text-center">${vo.memberid }</th>
								<th width="20%" class="text-center">${vo.dbday }</th>
								<th width="10%" class="text-center">${vo.hit }</th>
							</tr>
					
								<input type="hidden" name="no" value="${vo.boardno }">
								<!-- content창 보여줬다 사라짐 -->
								<tr id="u${vo.boardno }" style="display:none">
									<th><img src="re.png" width="20" height="20"></th>
									<th class="text-left" colspan="3">		
										${vo.content }
									</th>
									<th calspan="3">
										<a href="../bQnA/qboard_update.do?no=${vo.boardno }" class="btn btn-sm btn-primary">수정</a>
										<a href="../bQnA/qboard_delete.do?no=${vo.boardno }" class="btn btn-sm btn-danger">삭제</a>
										<a href="../bQnA/qboard_reply.do?no=${vo.boardno }&boardDis=1" class="btn btn-sm btn-warning replyBtn" value="${vo.boardno }">답글달기</a>
									</th>						
								</tr>
							<c:set var="count" value="${count-1 }"/>
						</c:forEach>
			</table>
			
	
			<table class="table">
				<tr>
					<!-- 페이지 넘어가는 부분 -->
									
				<td class="text-center">
						<ul class="pagination">
							<li><a href="../board/board_list.do?page=1">◁</a></li>
							<li><a href="#">&lt;</a></li>
								<c:forEach var="i" begin="1" end="${totalpage }">
									<li class="${i==curpage?'active':''}"><a href="../board/board_list.do?page="${i }>${i }</a>
								</c:forEach>
							<li><a href="#">&gt;</a></li>
							<li><a href="../board/board_list.do?page=${totalpage }">▷</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>