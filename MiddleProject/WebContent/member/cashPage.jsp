<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐시충전</title>

<!-- <style type="text/css">
.vr { 
    display: block;
    width:1px;
    height: 100px;
    background-color:#000;

}
</style> -->

</head>

<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xl-7 ftco-animate">
				<form method="post" action="cashPage_ok.do" class="Cash" onsubmit="return validate();">
					<h3 class="mb-4 billing-heading">캐시 충전</h3>
					<p style="border-bottom: solid">
					<div style="border: 1px solid #444444; height: 600px;">

						<div style="margin: 20px; border: 1px solid gray; height: 100px;">
							<div class="col-md-6">
								<div style="position: relative; bottom: -40px; right: -20px;">충전금액
							</div>
								<div id="charge" name="charge" style="position: relative; bottom: -10px; right: -100px;">
								</div>
								<div style="position: relative; top: -15px; right: -420px;">현재: ${sessionScope.pay}원</div>
								
							</div>
						</div>

						<div style="margin: 20px 20px -10px 20px;">충전금액선택</div>
						<hr>

						<div class="col-md-10">

							<div style="margin: 20px 20px -10px 20px;">
								<input type="radio" name="selectCash" value="1000">1000원
							</div>
							<div
								style="margin: 20px 20px -10px 20px; position: relative; right: -130px; top: -36px;">
								<input type="radio" name="selectCash" value="5000">5000원
							</div>
							<div
								style="margin: 20px 20px -10px 20px; position: relative; right: -270px; top: -73px;">
								<input type="radio" name="selectCash" value="10000">10000원
							</div>
							<div style="margin: -50px 20px -10px 20px;">
								<input type="radio" name="selectCash" value="직접입력">직접입력   <input
									type="text" name="money" id="money" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" readonly="readonly" style="width: 100px;">원
							</div>

						</div>
						<div style="margin: 100px 20px -10px 20px;">결제수단선택</div>
						<hr style="margin-bottom: 20px;">




						<div style="margin: 20px 20px -10px 20px;">
							<input name="paymentMethod" type="radio">무통장 입금 <input
								name="paymentMethod" type="radio">쿠폰등록
						</div>


						<div class="col-md-10"
							style="position: relative; bottom: -100px; right: -200px;">
							<input type="submit" value="충전하기">
							<input type="button" value="취소하기">
						</div>


					</div>
				</form>
			</div>


		</div>


	</div>
	</section>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('input:radio[name="selectCash"]').change(function() {
			$('#money').val("");
			if ($(this).val() == "직접입력") {
				$('#money').attr("readonly", false);
			} else {
				$('#money').attr("readonly", true);
				$('#money').val($(this).val());
				$('#charge').text($(this).val());
			}
		});
		
		$('#money').keyup(function(){
			$('#charge').text($('#money').val());
		});

	});
</script>
</html>
