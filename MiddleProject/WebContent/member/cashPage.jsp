<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
				<form id="join_frm" name="userInfo" method="post"
					action="signUp_ok.do" class="signUp" onsubmit="return validate();">
					<h3 class="mb-4 billing-heading">캐시 충전</h3>
					<p style="border-bottom: solid">
					<div style="border: 1px solid #444444; height: 600px;">

						<div
							style="margin: 20px; border: 1px solid gray; height: 100px;">
							<div class="col-md-6">
								<div style="position: relative; bottom: -40px; right: -20px;">충전금액</div>
								<div style="position: relative; bottom: -10px; right: -220px;">?원</div>
								<div style="position: relative; top: -15px; right: -420px;">내
									캐쉬</div>

							</div>
						</div>

						<div style="margin: 20px 20px -10px 20px;">충전금액선택</div>
						<hr>
						
						<div class="col-md-10">
						
						<div style="margin: 20px 20px -10px 20px;">
						<input type="radio">1000원 
						</div>
						<div style="margin: 20px 20px -10px 20px; position: relative;right: -130px; top: -36px;">
						<input type="radio">5000원 
						</div>
						<div style="margin: 20px 20px -10px 20px;position: relative;right: -270px; top: -73px;">
						<input type="radio">10000원 
						</div>
						<div style="margin: -50px 20px -10px 20px;">
						직접입력　<input type="text" style="width: 100px;">원
						</div>		
							
						</div>
						<div style="margin: 100px 20px -10px 20px;">결제수단선택</div>
						<hr style="margin-bottom: 20px;">
						
						
						
						
						<div style="margin: 20px 20px -10px 20px;">
						<input type="radio">무통장 입금
						<input type="radio">쿠폰등록
						</div>
					
						
							<div class="col-md-10" style="position: relative; bottom: -100px; right: -200px;">
							<input type="submit" value="충전하기">
							<input type="submit" value="취소하기">
							</div>
						

					</div>
					</form>
			</div>
		

		</div>


	</div>
	</section>
</body>
</html>
