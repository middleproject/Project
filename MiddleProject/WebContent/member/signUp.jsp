<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../main/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../main/css/animate.css">

<link rel="stylesheet" href="../main/css/owl.carousel.min.css">
<link rel="stylesheet" href="../main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../main/css/magnific-popup.css">

<link rel="stylesheet" href="../main/css/aos.css">

<link rel="stylesheet" href="../main/css/ionicons.min.css">

<link rel="stylesheet" href="../main/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../main/css/jquery.timepicker.css">


<link rel="stylesheet" href="../main/css/flaticon.css">
<link rel="stylesheet" href="../main/css/icomoon.css">
<link rel="stylesheet" href="../main/css/style.css">



<link rel="stylesheet" href="../shadow/css/shadowbox.css">

</head>



	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">Checkout</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form id = "join_frm" method="post" action="signUp_ok.jsp" class="signUp"  
					  onsubmit="return validate();">
						<h3 class="mb-4 billing-heading">회원 가입</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label >*아이디</label> <input type="text"
										class="form-control" placeholder="" id="id"    name="id" readonly="readonly" required>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">

									<input type="button" style="width: 120px; height: 57px;"
										class="btn-warning btn-lg" value="중복체크" id= "checkBtn">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label >*비밀번호</label> <input type="password"
										class="form-control" placeholder="" id="pwd"  name="pwd" required >
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label >비밀번호 확인</label> <input type="password"
										class="form-control" placeholder="" id="pwd2" name="pwd2" required>
								</div>
								<label id=lable></label>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*이름</label> 
									<input type="text" class="form-control" placeholder="" id="name"  name="name"class="name" required >
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-8">
								<div class="form-group">
									<label >*성별</label>
									<div class="w-100"></div>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex"   value="남자" > <label style="font-size: 20px;">남자</label>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex"  value="여자"> <label style="font-size: 20px;">여자</label>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-3">
								<div class="form-group">
									<label >*생년월일</label> <input type="text"
										class="form-control" id="birthday_year" name="bitrhday_year" placeholder="년" required>

								</div>
							</div>


							<div class="col-md-3">
								<div class="form-group">
									<input type="text" class="form-control" id="birthday_month"
									name="birthday_month"	placeholder="월"  required>

								</div>
							</div>

							<div class="col-md-3">
								<div class="form-group">
									<input type="text" class="form-control" id="birthday_day"
										name="birthday_day" placeholder="일" required>

								</div>
							</div>


							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label >*이메일</label> <input type="text" id="email1" name="email1" required>
								</div>
							</div>

							<div class="col-md-0">
								<div class="form-group">
									<label>@</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" id="email2"  name="email2" required>
								</div>
							</div>
							<div class="col-md-0">
								<div class="form-group">
									<select id ="emailSelection" name="emailSelection"  name="emailSelection"  style="width: 120px; height: 33px;">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>goole.com</option>

									</select>
								</div>
							</div>



							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>집 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="call">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="text" size="5px"name = "call2"> - <input type="text"
										size="5px" name = "call3">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*휴대 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="phone">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="text" size="5px" required name="phone2"> - <input type="text"
										size="5px" required name="phone3">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label >*우편번호</label>
										<div class="w-100"></div>
									 <input type="text" readonly="readonly" name="adress" required >

								</div>
								
							</div>
						
					<!-- 		<div class="col-md-0">
								<div class="form-group">
									<label>-</label>
								</div>
							</div>


							<div class="col-md-4">
								<div class="form-group">

									<input type="text" readonly="readonly">

								</div>
							</div> -->

							<div class="col-md-2">
								<div class="form-group">
									<input type="button"
										style="width: 90px; height: 35px; font-size: 15px"
										class="btn-warning btn-lg" value="검색" id="postBtn">

								</div>

							</div>

							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="상세주소"  name="adress2">
								</div>
							</div>


							<div class="w-100"></div>
							<div class="col-md-2">
								<div class="form-group">
									<label></label>

								</div>
							</div>

							<div class="w-100"></div>


							<div class="col-md-2">
								<div class="form-group">
									<input type="submit" class=" btn-warning btn-lg" value="가입완료"  >
								</div>
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-2"></div>

							<div class="col-md-6">
								<div class="form-group">
									<input type="reset" class="btn-warning btn-lg" value="가입취소">
								</div>
							</div>


						</div>
					</form>
					<!-- END -->
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our
						Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special
						offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Enter email address"> <input type="submit"
								value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Vegefoods</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Menu</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Shop</a></li>
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Journal</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Help</h2>
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
								<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">FAQs</a></li>
								<li><a href="#" class="py-2 d-block">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="../main/js/jquery.min.js"></script>
	<script src="../main/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../main/js/popper.min.js"></script>
	<script src="../main/js/bootstrap.min.js"></script>
	<script src="../main/js/jquery.easing.1.3.js"></script>
	<script src="../main/js/jquery.waypoints.min.js"></script>
	<script src="../main/js/jquery.stellar.min.js"></script>
	<script src="../main/js/owl.carousel.min.js"></script>
	<script src="../main/js/jquery.magnific-popup.min.js"></script>
	<script src="../main/js/aos.js"></script>
	<script src="../main/js/jquery.animateNumber.min.js"></script>
	<script src="../main/js/bootstrap-datepicker.js"></script>
	<script src="../main/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="../main/js/google-map.js"></script>
	<script src="../main/js/main.js"></script>

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});

		});
	</script>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>

<script type="text/javascript">

Shadowbox.init({
	players:['iframe']
	
})
$(function(){
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind.jsp',
			player:'iframe',
			title:'우편번호 검색',
			width:550,
			height:550
		});
	});
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			title:'아이디 중복체크',
			width:360,
			height:200
		});
	});
});
</script>
	
<script type="text/javascript">
	$(function(){

//비밀번호 확인
	$('#pwd2').keyup(function(){
	   if($('#pwd').val() != $('#pwd2').val() ){
	    	if($('#pwd2').val()!=''){
	    		 document.getElementById('lable').style.color = "red";
	    		   document.getElementById('lable').innerHTML = "비밀번호가 일치하지않습니다."; 

	       }
	    	   	
	    	}
	   else{
   		 document.getElementById('lable').style.color = "blue";
	   document.getElementById('lable').innerHTML = "비밀번호가 일치합니다.";  
	    }
	})  	   
});
</script>
<script type="text/javascript">
$(function(){	

	$(document).ready(function(){

		$('select[name=emailSelection]').change(function() {

			if($(this).val()=="직접입력"){

				$('#email2').val("");
				$("#email2").attr("readonly", false);

			} else {

				$('#email2').val($(this).val());

				$("#email2").attr("readonly", true);

			}

		});

	});

});
</script>



	

</body>
</html>