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


						<h1 > ${vo.name } 의 마이페이지 </h1>
								<div>　</div>
								<div>　</div>
								<div>　</div>
						
							<div class="float-unit" ><p class="font" >회원정보<p>
							<div class="w-100"></div>
							<img src="images/member.png" alt="My Image" width="100px" height="100px">
							<p> ${vo.name } 님 <p> 
							<a href="memberModify.do" type="button" class="btn">수정하기</a>
							</div>

							<div class="float-unit"  ><p class="font" >쪽지함<p>
							<div class="w-100"></div>
							<img src="images/msg.jpg" alt="My Image" width="100px" height="100px">
							<p> 새로운 쪽지 ${msgCount }개<p>
							<a href="../recipe/msg.do" type="button" class="btn">쪽지확인</a>
							</div>
							
							<div class="float-unit"  ><p class="font" >예약내역<p>
							<div class="w-100"></div>
							<img src="images/reserved.png" alt="My Image" width="100px" height="100px">
							<p> 예약한내역 ?개<p>
							<a href="../reserve/myreserveList.do" type="button" class="btn">예약확인</a>
							</div>
							
							<div class="float-unit"  ><p class="font" >즐겨찾기<p>
							<div class="w-100"></div>
							<img src="images/smail.png" alt="My Image" width="100px" height="100px">
							<p> 등록한 즐겨찾기 ${wishCount }개<p>
							<a href="../recipe/wishRecipe.do" type="button" class="btn">확인하기</a>
							</div>
							
							
							
							<div class="float-unit"  ><p class="font" >내 게시글보기<p>
							<div class="w-100"></div>
							<img src="images/note.png" alt="My Image" width="100px" height="100px">
							<p> 내가작성한글 ?개<p>
							<a href="../main/main.do" type="button" class="btn">글 확인하기</a>
							</div>
							
							<div class="float-unit"  ><p class="font" >회원탈퇴<p>
							<div class="w-100"></div>
							<img src="images/reserved.png" alt="My Image" width="100px" height="100px">
							<p>잘가세요 <p>
							<a href="../member/memberDelete.do" type="button" class="btn">탈퇴하기</a>
							</div>
							
							
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- .section -->



</body>










</html>