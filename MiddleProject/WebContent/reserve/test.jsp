<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
.row{
	margin:0px auto;
	width:1200px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.movies').click(function(){
		var poster=$(this).attr("data-poster"); // 클릭한 tr의 정보
		var title=$(this).attr("data-title");
		var tno=$(this).attr("data-tno");
		$('#poster').attr("src",poster); // <span id="title">에 db에서 가져온 poster값(vo.getPoster())을 넣음
		$('#reserve_title').text(title);
		
		$.ajax({
			type:'post',
			url:'../movie/theater.do',
			// 왼쪽 tno = key
			// 오른쪽 tno = var tno
			data:{tno:tno},
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#theater').html(response);
			}
		})
	})
})
function reserve() {
	var title=$('#reserve_title').text();
	var tname=$('#reserve_theater').text();
	var rdate=$('#reserve_day').text();
	var rtime=$('#reserve_time').text();
	var inwon=$('#reserve_inwon').text();
	var price=$('#reserve_price').text();
	
	$.ajax({
		type:'post',
		url:'../movie/insert.do',
		data:{
			title:title,
			tname:tname,
			rdate:rdate,
			rtime:rtime,
			inwon:inwon,
			price:price
		},
		success:function(response) {
			alert("예매 신청이 완료됐습니다.");
			location.href="../movie/mypage.do"
		}
	})
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">영화 예매</h3>
		<div class="text-right">
			<!-- 어드민인지 아닌지 파악 -->
			<!-- 어드민O=예약현황, 어드민X=마이페이지 -->
			<!-- 어드민X -->
			<c:if test="${sessionScope.admin==0 }">
				<a href="mypage.do" class="btn btn-sm btn-primary">마이페이지</a>
			</c:if>
			<!-- 어드민O -->
			<c:if test="${sessionScope.admin==1 }">
				<a href="adminpage.do" class="btn btn-sm btn-primary">예약현황</a>
			</c:if>
			<br><br>
		</div>
		<div class="row">
			<table class="table" height=800>
				<tr>
					<td width=25% height=600>
						<table class="table">
							<tr>
								<td class="text-center info">영화선택</td>
							</tr>
						</table>
						<table class="table table-hover">
						<c:forEach var="vo" items="${list }">
							<tr class="movies" data-poster="${vo.poster }" data-title="${vo.title }" data-tno="${vo.tno }">
							<!-- 사용자 정의 => 속성은 자기 마음대로 줄 수 있음 -->
								<td class="text-center"><img src="${vo.poster }" width=30 height=30></td>
								<td class="text-left">${vo.title }</td>
							</tr>
						</c:forEach>
						</table>
					</td>
					<td width=20% height=600>
						<table class="table">
							<tr>
								<td class="text-center info">극장선택</td>
							</tr>
						</table>
						<!-- 극장 내용 출력 -->
						<div id="theater"></div>
						
					</td>
					<td width=35% height=600>
						<table class="table">
							<tr>
								<td class="text-center info">날짜선택</td>
							</tr>
						</table>
						<!-- 달력 내용 출력 -->
						<div id="date"></div>
					</td>
					<td width=20% rowspan=2>
						<table class="table">
							<tr>
								<td class="text-center danger">예매정보</td>
							</tr>
						</table>
						<!-- 각 데이터를 클릭했을 때, 예약한 내용들을 출력 -->
						<table class="table">
							<tr>
								<td class="text-center" colspan=2> <!-- 선택한 영화의 poster 출력 -->
									<img src="def.jpg" width=200 height=300 id=poster>
								</td>
							</tr>
							<tr>
								<td class="text-left" width=40%>영화명</td>
								<td class="text-left" width=60%>
									<span id="reserve_title"></span>
								</td>
							</tr>
							<tr>
								<td class="text-left" width=40%>극장명</td>
								<td class="text-left" width=60%>
									<span id="reserve_theater"></span>
								</td>
							</tr>
							<tr>
								<td class="text-left" width=40%>예약일</td>
								<td class="text-left" width=60%>
									<span id="reserve_day"></span>
								</td>
							</tr>
							<tr>
								<td class="text-left" width=40%>예약시간</td>
								<td class="text-left" width=60%>
									<span id="reserve_time"></span>
								</td>
							</tr>
							<tr>
								<td class="text-left" width=40%>인원정보</td>
								<td class="text-left" width=60%>
									<span id="reserve_inwon"></span>
								</td>
							</tr>
							<tr>
								<td class="text-right" colspan=2>
									<span id="reserve_price" style="color:red;"></span>
								</td>
							</tr>
							<tr>
								<td class="text-center" colspan=2>
									<span id="reserve_btn"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width=45% height=200 colspan="2">
						<table class="table">
							<tr>
								<td class="text-center info">상영시간표</td>
							</tr>
						</table>
						<!-- 시간표 출력 -->
						<div id="time"></div>
					</td>
					<td width=30% height=200>
						<table class="table">
							<tr>
								<td class="text-center danger">인원선택</td>
							</tr>
						</table>
						<div id="inwon"></div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>