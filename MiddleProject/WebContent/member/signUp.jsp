<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>

<style type="text/css">
.textbox{
width: 250px;
height: 40px;

margin-left: 5px;

}
.font{
color: black;

}

</style>


<link rel="stylesheet" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
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
</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form id="join_frm" name="userInfo" method="post" action="signUp_ok.do"
						class="signUp" onsubmit="return validate();">
						<h3 class="mb-4 billing-heading">회원 가입</h3>
						<p style="border-bottom: solid">
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">*아이디</label> <input type="text" class="textbox"
										placeholder="영문,숫자 조합가능" id="id" name="id" required>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">

									<input type="button" style="width: 100px; height: 30px;"
										id="checkBtn"class="" value="중복확인" >
									<input type="hidden" name="idDuplication" value="idUncheck">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">*비밀번호</label> <input type="password"
										class="textbox" placeholder="" id="pwd" name="pwd"
										required>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">비밀번호 확인</label> <input type="password"
										class="textbox" placeholder="" id="pwd2" name="pwd2"
										required>
								</div>
								<label id=lable></label>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4" style="margin-top: -20px;">
								<div class="form-group">
									<label class="font">*이름</label> <input type="text" class="textbox"
										placeholder="" id="name" name="name" class="name" required>
								</div>
							</div>

							<div class="w-100" ></div>
							<div class="col-md-8">
								<div class="form-group">
									<label class="font">*성별</label>
									<div class="w-100"></div>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex" value="남자"> <label style="font-size: 20px;">남자</label>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex" value="여자"> <label style="font-size: 20px;">여자</label>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="font">*생년월일</label> <input type="date" class="textbox"
										id="birthday" name="bitrhday" placeholder="생년월일을 입력해주세요"
										required>

								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="font">*이메일</label> <input type="text" id="email1"
										 class="textbox" name="email1" style="width: 160px;" required>
								</div>
							</div>

							<div class="col-md-0">
								<div class="form-group">
									<label style="margin-left: -30px;">@</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" id="email2"class="textbox" name="email2"style="width: 160px; margin-left: -10px;"
									>
								</div>
							</div>
							<div class="col-md-0">
								<div class="form-group">
									<select id="emailSelection" name="emailSelection"
										style="width: 120px; height: 33px;">
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
									<label class="font">집 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="tel1">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="text" size="5px" name="tel2" class="textbox" style="width: 80px; height: 33px;"> 
									- <input
										type="text" size="5px" name="tel3" class="textbox" style="width: 80px; height: 33px;">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">*휴대 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="phone1">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="text" size="5px" required name="phone2" class="textbox" style="width: 80px; height: 33px;">
									- <input type="text" size="5px" required name="phone3" class="textbox" style="width: 80px; height: 33px;">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font"	>*우편번호</label>
									<div class="w-100"></div>
									<input type="text" readonly="readonly" name="addr1" required>

								</div>

							</div>

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
									<input type="text" class="textbox" placeholder="상세주소" style="width: 500px; margin-left: 0px;"
										name="addr2" >
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
									<input type="submit" class=" btn-success btn-lg" value="가입완료">
								</div>
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-2"></div>

							<div class="col-md-6">
								<div class="form-group">
									<input type="submit" class="btn-warning btn-lg" value="가입취소"
										onclick="javascript:history.back()">
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

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
			$('select[name="emailSelection"]').change(function() {
				if ($(this).val() == "직접입력") {
					$('#email2').val("");
					$("#email2").attr("readonly", false);
				} else {
					$('#email2').val($(this).val());
					$("#email2").attr("readonly", true);
				}
			});
		});
	
		
</script>






</body>


<script type="text/javascript">
	$(function() {

		//비밀번호 확인
		$('#pwd2').keyup(
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