<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>



<style type="text/css">
.textbox {
	width: 250px;
	height: 30px;
}

.font {
	color: blue;
	position: relative;
	bottom: -3px;
}
.font2{
color: black;
font-size: 18px;
}



.btn2 {
	width: 80px;
	height: 30px;
	color: black;
	background-color: #E2E2E2;
	margin-left: -50px;
}

.textbox {
	border: 1px solid #6E6E6E;
	border-radius: 4px;
}

hr {
	border: 1px solid #CDD5D5;
	width: 800px;
}

.s {
	width: 200px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	color: blue;
	background: #F0F9FA;
}


</style>



<link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
	
})
$(function(){
	$('#postBtn').click(function(){
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("exAddr").value = extraAddr;
                
                } else {
                    document.getElementById("exAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
            }
        }).open();
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
					<form id="modify_frm" name="userInfo" method="post" action="modify_ok.do"
						onsubmit="return validate();">

						<h3 class="mb-4 billing-heading">정보 수정</h3>
						<hr>
						<div class="row align-items-end">

							<div class="col-md-10">
								<div class="form-group" style="margin-top: -5px;">
									<div class="s"
										style="position: relative; top: -10px; height: 65px; position: relative; margin-bottom: -50x;">
										
											 <label class="font">아이디</label>
										
									</div>
									<label class="font2" style="position: relative; right: -227px; top: -55px; color: black;">
										${vo.id }</label> 
										
										<input type="hidden" class="textbox"
                              placeholder="영문,숫자 조합가능" id="id" name="id" value="${vo.id }" required><label>${vo.id }</label>
										
										
									<hr style="margin-top: -50px; margin-bottom: -3px;">
								</div>
							</div>




							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group" style="margin-top: -2px;">
									<div class="s"
										style="position: relative; top: -10px; height: 65px; position: relative; margin-bottom: -50x;">
										
											 <label class="font">비밀번호</label>
										
									</div>
									<input type="password" class="textbox" placeholder="" id="pwd"
										name="pwd"
										style="position: relative; right: -220px; top: -65PX;"
										required> <label
										style="position: relative; right: -227px; top: -70px;">*
										영문/숫자/특수문자을 조합하여 최소 9자이상 13자 이내 대소문자 구별</label>
									<hr style="margin-top: -76px;">
								</div>
							</div>


							<div class="w-100"></div>
							<div class="col-md-10"
								style="margin-top: -5px; margin-bottom: 2px;">
								<div class="form-group">
									<div class="s"
										style="position: relative; top: -10px; height: 65px; position: relative; margin-bottom: -65x;">

										<label class="font">비밀번호 확인</label>

									</div>
									<input type="password" class="textbox" placeholder="" id="pwd2"
										name="pwd2"
										style="position: relative; right: -220px; top: -62PX;"
										required>
								</div>
								<label id=lable
									style="position: relative; top: -106px; right: -480px; margin-bottom: -50px;"></label>

								<hr style="margin-top: -81px; margin-bottom: -23px;">
							</div>

							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group" style="margin-bottom: -21px;">
									<div class="s"
										style="position: relative; bottom: -23px; height: 50px; position: relative; margin-bottom: -50x;">
										
											<label class="font" style="position: relative;right: -23px;">성명</label>
										<label class="font2" style="position: relative;  right:-130px; top:10px; color: black;">
										${vo.name }</label> 
										<input type="hidden" class="textbox"
										placeholder="" id="name" name="name" class="name" value="${vo.name }" required>

									</div>

									

								</div>
								<hr style="position: relative; bottom: -30px;">
							</div>



							<div class="w-100"></div>
							<div class="col-md-10" style="margin-top: 5px;">
								<div class="form-group"
									style=" margin-bottom: -40px;">
									<div class="s"
										style="position: relative; bottom: -10PX; height: 65px; position: relative; margin-bottom: -50x;">
										
											 <label class="font" style="position: relative;right: -10px;">성별</label>
												<label class="font2" style="position: relative;  right:-130px; top:10px; color: black;">
										${vo.sex }</label> 
										<input type="hidden" class="textbox"
										placeholder="" id="sex" name="sex" class="sex" value="${vo.sex }" required>
									</div>
								<hr style="position: relative;top: -5px;">
							</div>
</div>


							<div class="w-100"></div>
							<div class="col-md-10" >
								<div class="form-group"
									style="margin-bottom: -35px; margin-top: 10px;">
									<div class="s"
										style="position: relative; bottom: -10PX; height: 65px; position: relative; margin-bottom: -50x;">
										
											 <label class="font">생년월일</label>
										
									</div>
									<input type="date" class="textbox" id="birthday"
										name="birthday" placeholder="생년월일을 선택해주세요"
										style="position: relative; right: -220PX; top: -38px;"
										required>
								</div>
								<hr>
							</div>


							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group"
									style="margin-top: -25px; margin-bottom: -65px;">
									<div class="s"
										style="position: relative; bottom: -10PX; height: 75px; position: relative; margin-bottom: -50x;">
										
											 <label class="font" style="position: relative; top: -5px;">이메일</label>
										
									</div>
									<input type="text" id="email1" class="textbox" name="email1"
										style="width: 250px; position: relative; top: -50px; right: -220px;"
										value="${vo.email }"  required> 
 
									
								</div>
			
								<hr style="position: relative; bottom: -5px;">
							</div>





							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group"
									style="margin-top: -35px; margin-bottom: -35px;">
									<div class="s"
										style="position: relative; bottom: -23px; height: 50px; position: relative; margin-bottom: -50x;">
										<label class="font">집 전화</label>

									</div>
									<select
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -13px;"
										name="tel1" class="textbox">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="tel"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										size="5px" name="tel2" class="textbox"
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -13px;">
									- <input type="tel"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										size="5px" name="tel3" class="textbox"
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -13px;">
								</div>
								<hr style="position: relative; bottom: -10px;">
							</div>

							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group"
									style="margin-top: -30px; margin-bottom: -35px;">
									<div class="s"
										style="position: relative; bottom: -23px; height: 50px; position: relative; margin-bottom: -50x;">
										
											 <label class="font">휴대 전화</label>
										
									</div>

									<select
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -15px;"
										name="phone1" class="textbox">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="tel"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										size="5px" required name="phone2" class="textbox"
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -15px;">
									- <input type="tel"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										size="5px" required name="phone3" class="textbox"
										style="width: 80px; height: 33px; position: relative; right: -225px; top: -15px;">
								</div>
								<hr style="position: relative; bottom: -10px;">
							</div>
							<div class="w-100"></div>
							<div class="col-md-10" style=" margin-top: -5px;" >
								<div class="form-group">
									<div class="s"
										style="bottom: -23px; height: 200px; margin-bottom: -50x;">
										
											 <label class="font">우편 번호</label>
										
									</div>
									<input type="text" readonly="readonly" id="addr1" name="addr1"
										class="textbox" required
										style="position: relative; right: -225px; top: -160px; width: 200px;">

									<input type="button"
										style="width: 90px; height: 35px; position: relative; right: -290px; top: -160px; font-size: 15px"
										class="btn2 textbox" value="검색" name="postBtn" id="postBtn">

									<input type="text" class="textbox" placeholder="주소"
										style="position: relative; right: -225px; top: -135px; width: 500px;"
										id="addr2" name="addr2">


									<!-- 사용자 입력 부분(상세주소) -->
									<input type="text" class="textbox" placeholder="상세주소"
										style="width: 250px; position: relative; right: -225px; top: -130px;"
										id="addr3" name="addr3"> <input type="text"
										class="textbox" placeholder="참고항목"
										style="width: 250px; position: relative; right: -225px; top: -130px;"
										id="exAddr" name="exAddr">
								</div>
								<hr style="margin-top: -115px;"> 
							</div>



							<div class="w-100"></div>
							<div class="col-md-10" style="margin-bottom: 300px;">

								<div class="form-group ">

									<input type="submit"  value="수정완료"
									style="position: relative; right: -250px; border-color: #527eee;background-color: #5e8afb; color: white; width: 100px; height: 50px;">




									<a href="../main/main.do"><input type="button" value="수정취소"
									style="position: relative; right: -280px; border-color: #527eee;background-color: #5e8afb; color: white; width:100px; height: 50px;"></a>
								</div>
								
							</div>
							</div>
					</form>
				</div>



			</div>

		</div>

	</section>

	<!-- .section -->

</body>





<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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






</html>