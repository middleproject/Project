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
	 <div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_2.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread" class="jua">이미지 게시판</h1>
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
					<td class="text-right">
						<a href="../bimage/img_insert.do" class="btn btn-primary">글쓰기</a>
					</td>	
				</tr>
			</table>
			<table class="table">
			<c:set var="count" value="${count }"/>
			<c:forEach var="vo" items="${list }">
				<tr>
					<th width="50%" class="text-left">NO．${count }&nbsp;&nbsp;&nbsp;<font color="red">♥</font>${vo.name }님<font color="red">♥</font>
					&nbsp;&nbsp;&nbsp;${vo.dbday } 작성</th>
					<th>
			      		
                           <a href="../bimage/img_update.do?no=${vo.no }" class="btn btn-xs btn-primary" value="${rvo.no }">수정</a>    
                           <input type="hidden" value="${vo.no }" name="no">     
                           <a href="../bimage/img_delete.do?no=${vo.no }" class="btn btn-xs btn-danger">삭제</a>            
         
                    </th>
				</tr>
				<c:set var="count" value="${count-1 }"/>
				<tr>
					<th colspan="2" width="100%" class="text-left">${vo.content }</th>
				</tr>
				<tr>
					<th colspan="2" width="100%" class="text-right">
					
						<img src="../main/${vo.filename}" style="border-radius: 25px;" width="750" height="400">
					</th>
					
				</tr>
			</c:forEach>
			
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<ul class="pagination">
						
							<c:if test="${curpage != 1 }">
								<li><a href="../bimage/img_list.do?page=1">　◁</a></li>
								<li><a href="../bimage/img_list.do?page=${curpage-1 }">　＜</a></li>
							</c:if>
								<c:forEach var="i" begin="1" end="${totalpage }">
									<li class="${i==curpage?'active':''}"><a href='../bimage/img_list.do?page=${i }'>　${i }　</a>
								</c:forEach>
							<c:if test="${curpage != totalpage }">
								<li><a href="../bimage/img_list.do?page=${curpage+1 }">　＞</a></li>
								<li><a href="../bimage/img_list.do?page=${totalpage }">　▷</a></li>
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