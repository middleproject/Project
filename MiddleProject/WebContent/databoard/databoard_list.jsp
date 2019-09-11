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
</head>
<body>
	 <div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread" class="jua">Notice Board</h1>
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
					<c:if test='${sessionScope.id=="shim"}'>
					<td class="text-right">
						<a href="../databoard/databoard_insert.do" class="btn btn-primary">글쓰기</a>
					</td>	
					</c:if>
				</tr>
			</table>
			<table class="table">
				<tr class="danger">
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<%-- <c:set var="count" value="${count }"/>
				<c:forEach var="vo" items="${list }" varStatus="s">
						<tr bgcolor="${vo.notice==1?'#E6FFE6':'' }" > 
							<c:if test="${vo.notice==1 }">
								<th width="10%" class="text-center"><font color="red">[공지]</font>
								</th>
							</c:if>
							<c:if test="${vo.notice!=1 }">
								<th width="10%" class="text-center">${count }</th>
								<c:set var="count" value="${count-1 }"/>
							</c:if>
								
							<th width="45%" class="text-left"><a href="../databoard/databoard_detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a></th>
							<th width="15%" class="text-center">${vo.name }</th>
							<th width="20%" class="text-center">${vo.dbday }</th>
							<th width="10%" class="text-center">${vo.hit }</th>
						</tr>
				</c:forEach>	 
					<c:forEach var="vo" items="${list }" varStatus="s">
						<tr bgcolor="${vo.notice==1?'#E6FFE6':'' }" > 
							<c:if test="${vo.notice==1 }">
								<th width="10%" class="text-center"><font color="red">[공지]</font>
								</th>
							</c:if>
							<c:if test="${vo.notice!=1 }">
								<th width="10%" class="text-center">[일반]</th>			
							</c:if>
								
							<th width="45%" class="text-left"><a href="../databoard/databoard_detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a></th>
							<th width="15%" class="text-center">${vo.name }</th>
							<th width="20%" class="text-center">${vo.dbday }</th>
							<th width="10%" class="text-center">${vo.hit }</th>
						</tr>
				</c:forEach>
				--%>
				<c:set var="count" value="${count }"/>
				<c:forEach var="vo" items="${list }" varStatus="s">
					<c:if test="${s.index<3 && vo.notice==1 }">
						<tr bgcolor="${vo.notice==1?'#E6FFE6':'' }" > 
							<th width="10%" class="text-center">
								<c:if test="${vo.notice==1}"><font color="#CD1F48">[공지]</font></c:if>
							</th>
							<th width="45%" class="text-left"><a href="../databoard/databoard_detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a></th>
							<th width="15%" class="text-center">${vo.name }</th>
							<th width="20%" class="text-center">${vo.dbday }</th>
							<th width="10%" class="text-center">${vo.hit }</th>
						</tr>
					</c:if>
					<c:if test="${s.index>2 && vo.notice!=1 }">
						<tr> 
							<th width="10%" class="text-center">
								<%-- ${count+1 } 포기--%>[일반]
							</th>
							<th width="45%" class="text-left"><a href="../databoard/databoard_detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a></th>
							<th width="15%" class="text-center">${vo.name }</th>
							<th width="20%" class="text-center">${vo.dbday }</th>
							<th width="10%" class="text-center">${vo.hit }</th>
						</tr>
					</c:if>
					<c:set var="count" value="${count-1 }"/>
				</c:forEach>	
				
			</table>
			
			<table class="table">
				<tr>
					<td class="text-center">
						<ul class="pagination">
						
							<c:if test="${curpage != 1 }">
								<li><a href="../databoard/databoard_list.do?page=1">　◁</a></li>
								<li><a href="../databoard/databoard_list.do?page=${curpage-1 }">　＜</a></li>
							</c:if>
								<c:forEach var="i" begin="1" end="${totalpage }">
									<li class="${i==curpage?'active':''}"><a href='../databoard/databoard_list.do?page=${i }'>　${i }　</a>
								</c:forEach>
							<c:if test="${curpage != totalpage }">
								<li><a href="../databoard/databoard_list.do?page=${curpage+1 }">　＞</a></li>
								<li><a href="../databoard/databoard_list.do?page=${totalpage }">　▷</a></li>
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