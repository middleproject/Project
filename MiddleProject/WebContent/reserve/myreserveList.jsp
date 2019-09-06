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
					<c:if test="${sessionScope.admin==2 }">
					<select id="list">
						<option value="1" ${data==1?"selected":""}>내게 접수된 예약</option>
						<option value="2" ${data==2?"selected":""}>내가 진행했던 예약</option>
						<option value="3" ${data==3?"selected":""}>진행중인 예약내용</option>
						<option value="4" ${data==4?"selected":""}>지난 예약 내용</option>
					</select>
					</c:if>
					<c:if test="${sessionScope.admin==0 }">
					<select id="list">
						<option value="3" ${data==3?"selected":""}>진행중인 예약내용</option>
						<option value="4" ${data==4?"selected":""}>지난 예약 내용</option>
					</select>
					</c:if>
					
					<input type="button" class="btn btn-sm btn-danger" id="select" value="확인" >
					
					
					
										
						<table class="table" id="table">
							<thead class="thead-primary">
								<tr class="text-center">
									
									<c:if test="${sessionScope.admin==0 }">
									<th>요리사이름</th>
									</c:if>
									<c:if test="${sessionScope.admin==2 }">
									<th>주문한유저</th>
									</c:if>
									<th class="text-center">요리이름</th>
									<th class="text-center">일자</th>
									<th class="text-center">시간</th>
									<th class="text-center">가격</th>
									<th class="text-center">메세지</th>
									<th class="text-center">상태</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<c:forEach var="vo" items="${list }" varStatus="s">
								
								
								<tr class="text-center">
								<c:if test="${vo.checheif!=10 }">
									
									<c:if test="${sessionScope.admin==0 }">
										<td>${vo.name }</td>
									</c:if>
									<c:if test="${sessionScope.admin==2 }">
										<td>${vo.userid }</td>
									</c:if>
									<td class="text-center">${vo.summary }</td>
									<td class="text-center">${vo.rdate }</td>
									<td class="text-center">${vo.rtime }</td>
									<td class="text-center">${vo.price }</td>
									<td class="text-center">${vo.msg }</td>
									<c:if test="${sessionScope.admin==0 }">
										<c:if test="${vo.checheif==0 }">
											<td colspan="2">요리사 확인중</td>
										</c:if>
										<c:if test="${vo.checheif==1 }">
											<td>
												<form action="../reserve/myreserveList_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="확인">
												</form>
											</td>
											<td>
												<form action="../reserve/myreserveList_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="취소">
												</form>
											</td>
										</c:if>
										
									</c:if>
									<c:if test="${sessionScope.admin==2 }">
										<c:if test="${vo.checheif==0 }">
											<td>
												<form action="../reserve/myreserveList_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="확인">
												</form>
											</td>
											<td>
												<form action="../reserve/myreserveList_ok.do?page=${page }&data=${data}" method="post">
													
													<input type="hidden" name="no" value="${vo.no }">
													<input type="hidden" name="page" value="${page }">
													<input type="submit" name="comp" value="취소">
												</form>
											</td>
										</c:if>
										<c:if test="${vo.checheif==1 }">
											<td colspan="2">주문자 확인중</td>
										</c:if>
									</c:if>
								</c:if>
									<c:if test="${vo.checheif==10 }">
									
											<td colspan="9">예약이 취소된 항목입니다.</td>
										
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
                	<li><a href="../reserve/myreserveList.do?page=${startpage-1 }&data=${data}">&lt;</a></li>
                </c:if>
                
                <c:forEach var="i" begin="${startpage}" end="${endpage }" step="1">
	                	<li class=${i==curpage?"active":"" }><a href="../reserve/myreserveList.do?page=${i}&data=${data}">${i }</a></li>       
                </c:forEach>
                <c:if test="${endpage<allpage }">
                	<li><a href="../reserve/myreserveList.do?page=${endpage+1 }&data=${data}">&gt;</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
	

</body>
</html>