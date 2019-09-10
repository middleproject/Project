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
	 <div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_2.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread" class="jua">문의게시판</h1>
          </div>
        </div>
      </div>
    </div>
<section class="ftco-section ftco-degree-bg">
	<div class="container">

		<div class="row">
			<table class="table">
				<tr>
					<td class="text-left">
						${curpage } page / ${totalpage } pages
					</td>
					<!-- sessionScope 로그인이 된 상태 에서만 글쓰기 허용 -->
					<c:if test="${sessionScope.id!=null }"> 
						<td class="text-right">
							<a href="../bQnA/qboard_insert.do?boardDis=1" class="btn btn-primary">글쓰기</a>
						</td>
					</c:if>
				</tr>
			</table>
			<table class="table">
				<tr class="warning">
					<th width="10%" class="text-center">번호</th>
					<th width="50%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="25%" class="text-center">작성일</th>
					
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
								<th width="15%" class="text-center">${vo.name }</th>
								<th width="20%" class="text-center">${vo.dbday }</th>
								
							</tr>
					
								<input type="hidden" name="no" value="${vo.boardno }">
								<!-- content창 보여줬다 사라짐 -->
								<tr id="u${vo.boardno }" style="display:none">
									<th><img src="re.png" width="20" height="20"></th>
									<th class="text-left" colspan="2">	
									<c:forEach begin="0" end="${vo.grouptab }">
											&nbsp;&nbsp;
										</c:forEach>	
										${vo.content }
									</th>
										
							<!-- sessionScope 로그인이 된 상태 에서만 글쓰기 허용 멤버아이디는??? ${vo.memberid } <br>
							세션스코프 아이디는??? ${sessionScope.id }<br> -->
							
							<c:if test="${sessionScope.id!=null }"> 
									<td colspan="2">
										<a href="../bQnA/qboard_update.do?no=${vo.boardno }&page=${curpage}" class="btn btn-sm btn-primary">수정</a>
									
										<a href="../bQnA/qboard_delete.do?no=${vo.boardno }" class="btn btn-sm btn-danger">삭제</a>
									<!-- sessionScope 관리자인 상태 에서만 답글쓰기 허용 -->
									<c:if test='${sessionScope.id=="shim" || sessionScope.id==vo.memberid}'> 
									<!-- admin==1 or "1" -->
										<a href="../bQnA/qboard_reply.do?no=${vo.boardno }&boardDis=1" class="btn btn-sm btn-warning replyBtn" value="${vo.boardno }">답글</a>
									</c:if>	
									</td>	
							</c:if>
								</tr>
								
							<c:set var="count" value="${count-1 }"/>
						</c:forEach>
			</table>
			
	
			<table class="table">
				<tr>
				<!-- 페이지 넘어가는 부분 -->
				<td class="text-center">
						<ul class="pagination">
						
							<c:if test="${curpage != 1 }">
								<li><a href="../bQnA/qboard_list.do?page=1">　◁</a></li>
								<li><a href="../bQnA/qboard_list.do?page=${curpage-1 }">　＜</a></li>
							</c:if>
								<c:forEach var="i" begin="1" end="${totalpage }">
									<li class="${i==curpage?'active':''}"><a href='../bQnA/qboard_list.do?page=${i }'>　${i }　</a>
								</c:forEach>
							<c:if test="${curpage != totalpage }">
								<li><a href="../bQnA/qboard_list.do?page=${curpage+1 }">　＞</a></li>
								<li><a href="../bQnA/qboard_list.do?page=${totalpage }">　▷</a></li>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>
</body>
</html>