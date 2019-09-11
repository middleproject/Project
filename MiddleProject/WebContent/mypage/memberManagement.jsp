<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_2.jpg');"></div>
										
	<div class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<form method="post" action="manage_ok.do">
				<div class="col-md-12 ftco-animate">
					<div id="print">					
						<table class="table" id="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>아이디</th>
									<th class="text-center">이름</th>
									<th class="text-center">회원유형</th>
									<th class="text-center">일반유저/셰프 변경</th>
									<th></th>
									<th class="text-center">회원탈퇴</th>										
								</tr>
							</thead>
							<c:forEach var="vo" items="${list }">
								<tr class="text-center">
									<td class="text-center">${vo.id }</td>
									<td class="text-center">
										${vo.name }
									</td>
									<c:choose>
										<c:when test="${vo.admin == 0}">
											<td class="text-center">
												일반회원
											</td>
										</c:when>
										<c:when test="${vo.admin == 1}">
											<td class="text-center">
												<span style="color:red">관리자</span>
											</td>
										</c:when>
										<c:when test="${vo.admin == 2}">
											<td class="text-center">
												셰프
											</td>
										</c:when>
									</c:choose>
									<c:if test="${vo.admin != 1}">
									<td>
										<input type="radio" name="change" value="0">일반유저
										<input type="radio" name="change" value="2">셰프
									<td>
									<td>	
										<input type="button" name="delete_btn" value="회원탈퇴">
									</td>
									</c:if>
								</tr>
								<!-- END TR-->
								</c:forEach>
						</table>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#delete_btn').click(function(){
		if(confirm("정말 탈퇴시키시겠습니까?") == true) {
			
		}
	})
</script>
</html>