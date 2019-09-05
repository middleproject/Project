<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.boder {
	font-size: 20px;
	color: white;
	border-style: solid;
	border-color: olive;
	margin-left: 275px;
	width: 550px;
	background-color: #E6B104;
	border-bottom-style: none;
	position: relative;
	right: -375px;
	bottom: -200px;
}

.batag {
	width: 550px;
	background-color: #FED757;
	color: white;
	border-style: solid;
	border-color: olive;
	text-align: center;
}

.btn2 {
	width: 100px;
	margin-top: 20px;
	position: relative;
	top: 8px;
}

.font {
	color: black;
}

.font2 {
	color: blue;
}
</style>


</head>
<body>

	<div class="ftco-section contact-section bg-light">
		<div class="container ">
			<div class="row d-flex mb-5 contact-info ">

				<div class="col-md-3 d-flex"></div>
				<div class="col-md-3 d-flex"></div>
				<div class="col-md-3 d-flex"></div>
				<div class="col-md-3 d-flex"></div>

			</div>
			<div class="boder">쪽지 보기</div>




			<div class="row block-9 ">
				<div class="col-md-6 order-md-last d-flex">
					<form method="post" action="../recipe/send.do" class="batag"
						style="position: relative; right: -650px; bottom: -200px;">
						<div class="form-group"
							style="position: relative; right: -400px; bottom: -200px;">

						</div>
						<div class="form-group">
							<p class="font" style="position: relative; left: -200px;">보낸사람</p>
							<p class="font2"
								style="position: relative; left: -100px; top: -37px;">${vo.memberid }</p>
						</div>
						<div class="form-group">
							<p class="font" style="position: relative; left: -200px;">보낸
								날짜</p>
							<p class="font2"
								style="position: relative; left: -100px; top: -37px;">${vo.day }</p>
						</div>
						<div class="form-group">
							<p class="font" style="position: relative; left: -200px;">제목</p>
							<p class="font2"
								style="position: relative; left: -100px; top: -37px;">${vo.sub }</p>
						</div>

						<div class="form-group">
							<p class="font" style="position: relative; left: -200px;">내용</p>
							<p class="font2"
								style="position: relative; left: -100px; top: -37px;">${vo.content }</p>
						</div>





		
						<div class="form-group">
							<input type="submit" value="닫기" class="btn2"
								style="margin-bottom: 20px; margin-top: -20px; background-color: white;">
						</div>
					</form>

				</div>


			</div>
		</div>
	</div>

</body>
</html>