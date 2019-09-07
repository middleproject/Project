<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#select').click(function(){
		var data=$("#list option:selected").attr("value");
		


	    location.href="../reserve/myreserveList.do?data="+data;
			
	});
});
</script>
<head>
<meta charset="UTF-8">
</head>
<body>
										
	<div class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
						<table class="table" id="table">
							<thead class="thead-primary">
								<tr class="text-center">
									
									
									<th class="text-center">요리사이름</th>
									<th class="text-center">주문한유저</th>
									<th class="text-center">요리이름</th>
									<th class="text-center">일자</th>
									<th class="text-center">시간</th>
									<th class="text-center">가격</th>
									<th class="text-center">메세지</th>
									<th class="text-center">상태</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<c:forEach var="vo" items="${list }">
								
								
								<tr class="text-center">
								
									<td>${vo.name }</td>
									<td>${vo.userid }</td>
									<td class="text-center">${vo.summary }</td>
									<td class="text-center">${vo.rdate }</td>
									<td class="text-center">${vo.rtime }</td>
									<td class="text-center">${vo.price }</td>
									<td class="text-center">${vo.msg }</td>
									<c:if test="${vo.checheif==10 }">
										<c:if test="${vo.complete==0 }">
											<td colspan="2">
												<form action="../reserve/adminlist_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="확인처리">
												</form>
											</td>											
										</c:if>
										<c:if test="${vo.complete==1 }">
											<td colspan="2">확인완료</td>
										</c:if>
										
										
									</c:if>
									<c:if test="${vo.checheif==2 }">
										<c:if test="${vo.complete==0 }">
											<td colspan="2">
												<form action="../reserve/adminlist_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="취소처리">
												</form>
											</td>
											
										</c:if>
										<c:if test="${vo.complete==1 }">
											<td colspan="2">취소완료</td>
										</c:if>
									</c:if>
								
									
								</tr>
								
								
								<!-- END TR-->
								</c:forEach>
						</table>
						
					</div>
				
			</div>
		</div>
	</div>


        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
              	<c:if test="${curpage>BLOCK}">
                	<li><a href="../reserve/adminlist.do?page=${startpage-1 }&data=${data}">&lt;</a></li>
                </c:if>
                
                <c:forEach var="i" begin="${startpage}" end="${endpage }" step="1">
	                	<li class=${i==curpage?"active":"" }><a href="../reserve/adminlist.do?page=${i}&data=${data}">${i }</a></li>       
                </c:forEach>
                <c:if test="${endpage<allpage }">
                	<li><a href="../reserve/adminlist.do?page=${endpage+1 }&data=${data}">&gt;</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
	

</body>
</html>