<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="/css/memberModify.css" />

<style type="text/css">
hr {
	width: 100%;
	border-top-width: 5px;
	padding-bottom: 50px;
	border-color: green;
	border-left: 5px;
}
</style>

<style type="text/css">
.category {
	text-align: center;
	font-size: 30px;
}
</style>


<style type="text/css">
.font1 {
	font-size: 25px;
	color: gray;
	word-spacing: 70px;
}
</style>


<style type="text/css">
.font2 {
	font-size: 23px;
	color: blue;
}
</style>


<style type="text/css">
.sujungBtn {
	WIDTH: 80px;
	HEIGHT: 30px;
	background-color: white;
	color: black;
	font-size: 15px;
	position: relative;
	left: 500px;
	bottom: 45px;
}
</style>



</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-9 ftco-animate">
					<form id="join_frm" method="post" action="" class="signUp"
						onsubmit="return validate();">
						<h3 class="mb-4 billing-heading category">회원정보 수정</h3>
						<hr>

						<div class="row align-items-end">
							<div class="col-md-10">
								<div class="form-group">
									<div class="font1" style="word-spacing: 110px">
										<label class="font1">아이디 </label> <label class="font2">${vo.id }</label>
									</div>
								</div>
							</div>

<!-- 비밀번호 id = "pwd" -->
							<div class="col-md-10">
								<div class="form-group">
									<div class="font1" style="word-spacing: 85px;">
										비밀번호 <input type="password" id="pwd"
											style="height: 30px; width: 200px;">
									</div>
								</div>
							</div>

<!-- 비밀번호확인 id = "pwd2" -->
							<div class="col-md-10">
								<div class="form-group">
									<div class="font1" style="word-spacing: 35px;">
										비밀번호확인 <input type="password" id="pwd2"
											style="height: 30px; width: 200px;">
									</div>
								</div>
							</div>


							<div class="col-md-12">
								<div class="form-group">
									<div class="font1">

<!-- 이름id = "name" -->
										이름 <label id="nameHide" class="font2"
											style="margin-left: 61px; margin-bottom: -50px;">${vo.name }
										</label> <input type="text" id="name"
											style="font-size: 23px; display: none; height: 30px; width: 120px; margin-left: 60px; margin-right: -50px;"
											value="${vo.name }">
										<div style="margin-bottom: -40px;">
											<input type="button" id="nameBtn" class="sujungBtn"
												value="수정">
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-10">
								<div class="form-group">
									<div class="font1">
										성별 <label class="font2" style="margin-left: 58px;">${vo.sex }</label>
									</div>
								</div>
							</div>


							<div class="col-md-10">
								<div class="form-group">
									<div class="font1">
										생년월일 <label class="font2" style="margin-left: 10px;">1993-04-13</label>
									</div>
								</div>
							</div>

<!-- 이메일 id = "email" -->
							<div class="col-md-12">
								<div class="form-group">
									<div class="font1">
										이메일 <label id="emailHide" class="font2"
											style="margin-left: 35px; margin-bottom: -50px;">${vo.email }
										</label> <input type="text" id="email"
											style="font-size: 23px; display: none; height: 30px; width: 280px; margin-left: 35px; margin-right: -45px;"
											value="${vo.email }">
										<div style="margin-bottom: -40px;">
											<input type="button" id="emailBtn" class="sujungBtn"
												value="수정">
										</div>
									</div>
								</div>
							</div>


<!-- 전화 id = "tel" -->
							<div class="col-md-12">
								<div class="form-group">
									<div class="font1">
										전화 <label id="telHide" class="font2"
											style="margin-left: 60px; margin-bottom: -50px;">02-123-1234
										</label> <input type="text" id="tel"
											style="font-size: 23px; display: none; height: 30px; width: 200px; margin-left: 60px; margin-right: -70px;"
											value="02-123-1234">
										<div style="margin-bottom: -40px;">
											<input type="button" id="telBtn" class="sujungBtn" value="수정">
										</div>
									</div>
								</div>
							</div>

<!-- 휴대폰 id = "phone" -->
							<div class="col-md-12">
								<div class="form-group">
									<div class="font1">
										휴대전화 <label id="phoneHide" class="font2"
											style="margin-left: 10px; margin-bottom: -50px; margin-right: -38px;">010-3458-0228</label>
										<input type="text" id="phone"
											style="font-size: 23px; display: none; height: 30px; width: 200px; margin-left: 10px; margin-right: 8px;"
											value="010-3458-0228">
										<div style="margin-bottom: -40px;">
											<input type="button" id="phoneBtn" class="sujungBtn"
												value="수정">
										</div>
									</div>
								</div>
							</div>
<!-- 주소 id = "addr" -->

							<div class="col-md-12">
								<div class="form-group">
									<div class="font1">
										주소<label id="addrHide" class="font2"
											style="margin-left: 130px; margin-bottom: -50px; margin-right: -38px;">서울역</label>
										<input type="text" id="addr"
											style="font-size: 23px; display: none; height: 30px; width: 200px; margin-left: 10px; margin-right: 8px;"
											value="서울역">
										<div style="margin-bottom: -40px;">
											<input type="button" id="addrBtn" class="sujungBtn"
												value="수정">
										</div>
									</div>
								</div>
							</div>

							<hr>
							<div class="w-100"></div>

							<div class="col-md-2">
								<div class="form-group" style="margin-left: 150px;">
									<input type="submit" class=" btn-success btn-lg" value="수정완료">
								</div>
							</div>
							<div class="col-md-2"></div>


							<div class="col-md-2">
								<div class="form-group" style="margin-left: 150px;">
									<input type="button" value="수정취소" class=" btn-warning btn-lg"
										onClick="self.location='mypageMain.do';">

								</div>
							</div>
						</div>
					</form>
				</div>


			</div>

			<!-- END -->

		</div>



	</section>

	<!-- .section -->



	<script type="text/javascript">
		$(function() {
			//비밀번호 확인
			$('#pwd2')
					.keyup(
							function() {
								if ($('#pwd').val() != $('#pwd2').val()) {
									if ($('#pwd2').val() != '') {
										document.getElementById('#label').style.color = "red";
										document.getElementById('#label').innerHTML = "비밀번호가 일치하지않습니다.";
									}
								} else {
									document.getElementById('#label').style.color = "blue";
									document.getElementById('#label').innerHTML = "비밀번호가 일치합니다.";
								}
							})
		});
	</script>



	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		jQuery('#nameBtn').click(function() {
			if ($("#name").css("display") == "none") {
				jQuery('#name').show();
				jQuery('#nameHide').hide();
				jQuery('#name').val("${vo.name }");
				jQuery('#nameBtn').val("취소");

			} else {
				jQuery('#name').hide();
				jQuery('#nameHide').show();
				jQuery('#nameBtn').val("수정");
			}
		});
	</script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		jQuery('#emailBtn').click(function() {
			if ($("#email").css("display") == "none") {
				jQuery('#email').show();
				jQuery('#emailHide').hide();
				jQuery('#email').val("${vo.email }");
				jQuery('#emailBtn').val("취소");

			} else {
				jQuery('#email').hide();
				jQuery('#emailHide').show();
				jQuery('#emailBtn').val("수정");

			}
		});
	</script>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		jQuery('#telBtn').click(function() {
			if ($("#tel").css("display") == "none") {
				jQuery('#tel').show();
				jQuery('#telHide').hide();
				/* jQuery('#tel').val("${vo.tel }"); */
				jQuery('#tel').val("02-123-1234");
				jQuery('#telBtn').val("취소");

			} else {
				jQuery('#tel').hide();
				jQuery('#telHide').show();
				jQuery('#telBtn').val("수정");

			}
		});
	</script>


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		jQuery('#phoneBtn').click(function() {
			if ($("#phone").css("display") == "none") {
				jQuery('#phone').show();
				jQuery('#phoneHide').hide();
				/* jQuery('#phone').val("${vo.phone }"); */
				jQuery('#phone').val("010-3458-0228");
				jQuery('#phoneBtn').val("취소");

			} else {
				jQuery('#phone').hide();
				jQuery('#phoneHide').show();
				jQuery('#phoneBtn').val("수정");

			}
		});
	</script>




</body>
</html>