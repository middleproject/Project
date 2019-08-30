<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form id="join_frm" method="post" action="signUp_ok.jsp"
						class="signUp" onsubmit="return validate();">
						<h3 class="mb-4 billing-heading">회원 가입</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label>*아이디</label> <input type="text" class="form-control"
										placeholder="영문,숫자 조합가능" id="id" name="id" required>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">

									<input type="button" style="width: 120px; height: 57px;"
										class="btn-warning btn-lg" value="중복체크" id="checkBtn">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*비밀번호</label> <input type="password"
										class="form-control" placeholder="" id="pwd" name="pwd"
										required>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>비밀번호 확인</label> <input type="password"
										class="form-control" placeholder="" id="pwd2" name="pwd2"
										required>
								</div>
								<label id=lable></label>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*이름</label> <input type="text" class="form-control"
										placeholder="" id="name" name="name" class="name" required>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-8">
								<div class="form-group">
									<label>*성별</label>
									<div class="w-100"></div>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex" value="남자"> <label style="font-size: 20px;">남자</label>
									<input type="radio" style="width: 40px; height: 20px;"
										name="sex" value="여자"> <label style="font-size: 20px;">여자</label>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-9">
								<div class="form-group">
									<label>*생년월일</label> <input type="date" class="form-control"
										id="birthday" name="bitrhday" placeholder="생년월일을 입력해주세요"
										required>

								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<label>*이메일</label> <input type="text" id="email1"
										name="email1" required>
								</div>
							</div>

							<div class="col-md-0">
								<div class="form-group">
									<label>@</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" id="email2" name="email2" required>
								</div>
							</div>
							<div class="col-md-0">
								<div class="form-group">
									<select id="emailSelection" name="emailSelection"
										name="emailSelection" style="width: 120px; height: 33px;">
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
									<select style="width: 80px; height: 33px;" name="tel1">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="text" size="5px" name="tel2"> - <input
										type="text" size="5px" name="tel3">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*휴대 전화</label>
									<div class="w-100"></div>
									<select style="width: 80px; height: 33px;" name="phone1">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="text" size="5px" required name="phone2">
									- <input type="text" size="5px" required name="phone3">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label>*우편번호</label>
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
									<input type="text" class="form-control" placeholder="상세주소"
										name="addr2">
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
						})
	});
</script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('select[name=emailSelection]').change(function() {
				if ($(this).val() == "직접입력") {
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






</html>