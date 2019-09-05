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
		border: 1px solid #6E6E6E;
	border-radius: 4px;
}

.font {
	color: black;
}

.font2 {
	color: blue;
}

.btn2 {
	width: 80px;
	height: 30px;
	color: black;
	background-color: white;
	margin-left: -50px;
}

</style>


<link rel="stylesheet" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]

	})
	$(function() {
		$('#postBtn').click(function() {
			Shadowbox.open({
				content : '../member/postfind.jsp',
				player : 'iframe',
				title : '우편번호 검색',
				width : 550,
				height : 550
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
					<form id="join_frm" name="userInfo" method="post"
						action="signUp_ok.do" class="signUp" onsubmit="return validate();">
						<h3 class="mb-4 billing-heading">회원정보 수정</h3>
						<p style="border-bottom: solid">
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">아이디</label>
									<p placeholder="영문,숫자 조합가능" id="id" class="font2" name="id">${vo.id }</p>

								</div>
							</div>



							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">비밀번호</label> <input type="password"
										class="textbox" placeholder="" id="pwd" name="pwd" required>

								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">비밀번호 확인</label> <input type="password"
										class="textbox" placeholder="" id="pwd2" name="pwd2" required>
								</div>
								<label id=lable
									style="position: relative; top: -45px; right: -270px;"></label>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4" style="margin-top: -20px;">
								<div class="form-group">
									이름 <label id="nameHide" class="font2"
										style="margin-left: 61px; margin-bottom: -50px;">${vo.name }</label>
										<input
										type="text" id="name" class="textbox"
										style="display: none; margin-left: 60px; margin-right: -50px;"
										value="${vo.name }">
						
										<input type="button" id="nameBtn" class="btn2" value="수정"
											style="position: relative; right: -200px;">
									
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-8">
								<div class="form-group">
									<label class="font">성별</label>
									<div class="w-100"></div>
									<p class="font2">${vo.sex }</p>

								</div>

							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="font">생년월일</label> <input type="date"
										class="textbox" id="birthday" name="bitrhday"
										placeholder="생년월일을 입력해주세요" required>

								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="font">이메일</label> <input type="text" id="email1"
										class="textbox" name="email1" style="width: 230px;" required>

								</div>
							</div>

							<div class="col-md-0">
								<div class="form-group">
									<label>@</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" id="email2" class="textbox" name="email2"
										style="width: 230px; position: relative; right: -10px;">

								</div>
							</div>
							<div class="col-md-0">
								<div class="form-group">
									<select id="emailSelection" name="emailSelection"
										style="width: 120px; height: 33px; position: relative; right: -70px; border: 1px solid black; border-radius: 4px;">
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
									<select style="width: 80px; height: 33px;" name="tel1"
										class="textbox">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="text" size="5px" name="tel2" class="textbox"
										style="width: 80px; height: 33px;"> - <input
										type="text" size="5px" name="tel3" class="textbox"
										style="width: 80px; height: 33px;">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">휴대 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="phone1"
										class="textbox	">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="text" size="5px" required name="phone2"
										class="textbox" style="width: 80px; height: 33px;"> -
									<input type="text" size="5px" required name="phone3"
										class="textbox" style="width: 80px; height: 33px;">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label style="color: black">우편번호</label>
									<div class="w-100"></div>
									<input type="text" readonly="readonly" name="addr1"
										class="textbox" required
										style="position: relative; right: 5px;">

								</div>

							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="button"
										style="width: 90px; height: 35px; font-size: 15px"
										class="btn2 textbox" value="검색" id="postBtn">

								</div>

							</div>

							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group">
									<input type="text" class="textbox" placeholder="상세주소"
										style="width: 500px; margin-left: 0px;" name="addr2">
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
								<p
									style="border-bottom: solid; width: 650px; margin-top: -70px;">
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

</body>




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

<!-- 수정버튼 -->
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




</html>