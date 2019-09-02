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
var i= 0;
var u= 0;
	$(function(){
		$('.replyBtn').click(function(){
			var no=$(this).attr("value");
			$('.reply').hide(); //댓글 눌렀을때 다른창들은 다 닫는다
			$('.update').hide();
			if(i==0) {
				$('#m'+no).show();
				i=1;
			} else {
				$('#m'+no).hide();
				i=0;
			}
		});

			$('.updateBtn').click(function(){
				var no=$(this).attr("value");
				$('.update').hide();
				$('.reply').hide();
				if(u==0) {
					$('#u'+no).show();
					u=1;
				} else {
					$('#u'+no).hide();
					u=0;
				}
			});
	});

</script>
</head>
<body>
		 <section class="ftco-section ftco-degree-bg">
	<div class="container">
		<h2 class="text-center">게시글 내용보기</h2>
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center warning" width="20%">문서번호</th>
					<th class="text-center" width="30%">${vo.boardno }</th>
					<th class="text-center warning" width="20%">작성일</th>
					<th class="text-center" width="30%">
						${vo.dbday }
						<%-- <fmt:formatDate value="${vo.regdate }" pattern="YYYY-MM-dd"/> --%>
					</th>
				</tr>
				<tr>
					<th class="text-center warning" width="20%">이름</th>
					<th class="text-center" width="30%">${vo.name }</th>
					<th class="text-center warning" width="20%">조회수</th>
					<th class="text-center" width="30%">${vo.hit }</th> 
				</tr>
				<tr>
					<th class="text-center warning" width="20%">제목</th>
					<th class="text-left" colspan="3">${vo.subject }</th>
				</tr>
				<tr>
					<th colspan="4" class="text-left" valign="top" height="200">${vo.content }</th>
				</tr>
				<tr>
					<th colspan="4" class="text-right">
						<a href="../board/board_update.do?no=${vo.boardno }" class="btn btn-sm btn-warning">수정</a>
						<a href="../board/board_delete.do?no=${vo.boardno }" class="btn btn-sm btn-danger">삭제</a>
						<a href="../board/board_list.do" class="btn btn-sm btn-success">목록</a>
					</th>
				</tr>
			</table>		
		</div>
		<!-- 댓글 -->
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-left">댓글(${count }개)</th>
				</tr>
			</table>
			<!-- 실제댓글 -->
			<table class="table">
				<tr>
					<c:forEach var="rvo" items="${list }">
						
					
						<table class="table">
							<tr>
								<th class="text-left">
									<c:if test="${rvo.group_tab>0 }">
										<c:forEach var="i" begin="1" end="${rvo.group_tab }">
											&nbsp;&nbsp;
										</c:forEach>
										<img src="re2.png" width="15px" height="15px">
									</c:if>
									<font color="grey">♥</font><font color="grey"><b>${rvo.name }</b></font>&nbsp;${rvo.dbday }
								</th>
								111 : ${rvo.id }
								
								22 : ${sessionScope.id } 
								<th class="text-right">
								 
									<c:if test="${sessionScope.id!=null && sessionScope.id==rvo.id }"> <!-- 조건2개 / 본인이면 모두 사용가능 -->
										<a href="# " class="btn btn-xs btn-warning updateBtn" value="${rvo.replyno }">수정</a>
										<a href="../board/reply_delete.do?no=${rvo.replyno }&bno=${vo.boardno } " class="btn btn-xs btn-danger">삭제</a>
									</c:if>
									<c:if test="${sessionScope.id!=null }"> <!-- 조건1개 /본인이 아니면 댓글만 사용가능 -->
										<a href="# " class="btn btn-xs btn-warning replyBtn" value="${rvo.replyno }">댓글</a>
									</c:if>
								</th>
							</tr>
							<!-- 내용 -->
							<tr>
								<th class="text-left" colspan="2">
								<c:if test="${rvo.group_tab>0 }">
										<c:forEach var="i" begin="1" end="${rvo.group_tab }">
											&nbsp;&nbsp;
										</c:forEach>
									</c:if>
								${rvo.msg }
								</th>
							</tr>
							
							<!-- 댓글버튼 -->
				<tr style="display:none" id="m${rvo.replyno }" class="reply">
					<td class="text-left" colspan="2">
						<form name="frm" method="post" action="../board/reply_reinsert.do">
							<textarea rows="3" cols="90" name="msg" style="float:left"></textarea><!-- name 변수명 -->
							<input type="hidden" name="bno" value="${vo.boardno }" >
							<input type="hidden" name="no" value="${rvo.replyno }">
							<input type="submit" value="댓글쓰기" class="btn btn-xs btn-info" style="height:65px">
						</form>
					</td>
				</tr>
				<tr style="display:none" id="u${rvo.replyno }" class="update">
					<td class="text-left" colspan="2">
						<form name="frm" method="post" action="../board/reply_update.do">
							<textarea rows="3" cols="90" name="msg" style="float:left">${rvo.msg }</textarea>
							<input type="hidden" name="bno" value="${vo.boardno }" >
							<input type="hidden" name="no" value="${rvo.replyno }">
							<input type="submit" value="수정하기" class="btn btn-xs btn-info" style="height:65px">
						</form>
					</td>
				</tr>
						</table>
						
					</c:forEach>
				</tr>
			</table>
			<!-- sessionScope 로그인이 된 상태 에서만 글쓰기 허용 -->
			<c:if test="${sessionScope.id!=null }"> 
			<table class="table">
				<tr>
					<th class="text-left">
						<form name="frm" method="post" action="../board/reply_insert.do">
							<textarea rows="3" cols="100" name="msg" style="float:left"></textarea>
							<input type="hidden" name="bno" value="${vo.boardno }" >
							<input type="submit" value="댓글쓰기" class="btn btn-sm btn-success" style="height:70px">
						</form>
					</th>
				</tr>
			</table>
		</c:if>
		</div>
	</div>
	</section>
</body>
</html>