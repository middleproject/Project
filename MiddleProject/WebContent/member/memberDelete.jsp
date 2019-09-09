<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>


<style type="text/css">
.textbox {
	width: 250px;
	height: 35px;
	margin-left: 5px;
}

.font {
	color: black;
}

.btn2 {
	width: 80px;
	height: 30px;
	color: black;
	background-color: white;
	margin-left: -50px;
}

.textbox {
	border: 1px solid #6E6E6E;
	border-radius: 4px;
}
</style>



</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form id="" name="" method="post"
						action="" class="" onsubmit="return validate();">
						<h3 class="mb-4 billing-heading">회원 탈퇴</h3>
						<p style="border-bottom: solid">
						<div class="row align-items-end">



							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">비밀번호</label> <input type="password"
										class="textbox" placeholder="" id="pwd" name="pwd" required>

								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6"
								style="position: relative; left: 200px; bottom: -20px; margin-top: 30px">
								<input type="submit" value="탈퇴하기" style="margin-right: 20px;">
								
								
								 <a	href="../mypage/mypageMain.do"><input type="button"
									value="탈퇴취소"></a>
							</div>
						</div>
					</form>

					<!-- END -->
				</div>

			</div>
		</div>
	</section>

	<!-- .section -->





</body>


<script type="text/javascript">
	$(function() {

		//비밀번호 확인
		$('#pwd2')
				.keyup(
						function() {
							if ($('#pwd').val() != $('#pwd2').val()) {
								if ($('#pwd2').val() != '') {
									document.getElementById('lable').style.color = "red";
									document.getElementById('lable').innerHTML = "비밀번호가 일치하지않습니다.";
								}
							} else {
								document.getElementById('lable').style.color = "blue";
								document.getElementById('lable').innerHTML = "비밀번호가 일치합니다.";
							}
						});
	});
</script>

<!-- function openIdChk(){
		window.name="parentForm";
		window.open=("idcheckForm.jsp", "chkForm",
				"width=500, height=300, resizable=no, scrollbars=no");	
	}
	
	function inputIdChk(){
		document.userInfo.idDuplication.value="idUncheck";
	}
  -->






</html>