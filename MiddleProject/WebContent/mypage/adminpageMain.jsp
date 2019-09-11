<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<style type="text/css">
.font{
font-size: 25px;
}

</style>

<style type="text/css">
.btn {

	 	border-top-left-radius: 5px;
    	border-bottom-left-radius: 5px;
            margin-right:-4px;
	 		border: 1px solid skyblue;
            background-color: white;      
            padding: 5px;
}

</style>
<style type="text/css">
.float-unit {
	width: 500px;
	height: 300px;
border: 1px solid black;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	padding: 15px 0;
	float: left;
	margin-right: 30px;
	margin-bottom: 30px;
	position: relative;
	left: 100px;
	color: black;
	font-weight: bold;
}
</style>



</head>



<body>
<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>


	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-12 ftco-animate">
					<form id=""	>


						<h1 > 관리자  페이지 </h1>
								<div>　</div>
								<div>　</div>
								<div>　</div>
						
							<div class="float-unit" ><p class="font" >회원 관리<p>
							<div class="w-100"></div>
							<img src="images/man.PNG" alt="My Image" width="100px" height="100px">
							<p> 총 회원 ${memCount }명 <p> 
							<a href="../mypage/memberManagement.do" type="button" class="btn">관리하기</a>
							</div>
							
																					
							<div class="float-unit" ><p class="font" >예약 금액처리<p>
							<div class="w-100"></div>
							<img src="images/man.PNG" alt="My Image" width="100px" height="100px">
							<p> 총 ?건 <p> 
							<a href="../reserve/adminlist.do" type="button" class="btn">관리하기</a>
							</div>

							
							
							
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- .section -->



</body>










</html>