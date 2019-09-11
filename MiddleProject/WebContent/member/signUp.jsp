<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>


<style type="text/css">
.textbox{
width: 250px;
height: 35px;

margin-left: 5px;

}
.font{
color: black;

}

.btn2{
width: 80px; 
height: 30px; 
color: black; 
background-color: #E2E2E2;
margin-left: -50px;
}

.textbox{
border: 1px solid #6E6E6E;
   border-radius: 4px;
}


</style>


<link rel="stylesheet" href="shadow/css/shadowbox.css">
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
	
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
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
	 <div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread" class="jua">Sign Up</h1>
          </div>
        </div>
      </div>
    </div>
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
									<div style="color:red;">* <label class="font">아이디</label> <input type="text" class="textbox"
										placeholder="영문,숫자 조합가능" id="id" name="id" required>
								</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">

									<input type="button" style="width: 100px; height: 30px;"
										id="checkBtn"class="" value="중복확인" onclick="idDuplication();">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<div style="color:red;">*<label class="font">비밀번호</label> <input type="password"
										class="textbox" placeholder="" id="pwd" name="pwd"
										required>
										</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="font">비밀번호 확인</label> <input type="password"
										class="textbox" placeholder="" id="pwd2" name="pwd2"
										required>
								</div>
								<label id=lable style="position:relative; top: -45px; right: -270px;"></label>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4" style="margin-top: -20px;">
								<div class="form-group">
									<div style="color:red;">*<label class="font">이름</label> <input type="text" class="textbox"
										placeholder="" id="name" name="name" class="name" required>
								</div>
								</div>
							</div>

							<div class="w-100" ></div>
							<div class="col-md-8">
								<div class="form-group">
									<div style="color:red;">*<label class="font">성별</label>
									<div class="w-100"></div>
									</div>
									<input type="radio" style="width: 15px; height: 15px;"
										name="sex" value="남자"> <label style="font-size: 15px;">남자</label>
									<input type="radio" style="width: 15px; height: 15px;"
										name="sex" value="여자"> <label style="font-size: 15px;">여자</label>
								</div>
								
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<div style="color:red;">*<label class="font">생년월일</label> <input type="date" class="textbox"
										id="birthday" name="birthday" placeholder="생년월일을 선택해주세요"
										required>
</div>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-4">
								<div class="form-group">
									<div style="color:red;">*<label class="font">이메일</label> <input type="text" id="email1"
										 class="textbox" name="email1" style="width: 230px; mar " required>
								</div>
								</div>
							</div>

							<div class="col-md-0">
								<div class="form-group">
									<label>@</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group">
									<input type="text" id="email2"class="textbox" name="email2" style="width: 230px; position: relative; right: -10px;">
									
								</div>
							</div>
							<div class="col-md-0">
								<div class="form-group">
									<select id="emailSelection" name="emailSelection"
										style="width: 120px; height: 33px; position: relative; right: -70px; border: 1px solid black;
   border-radius: 4px;">
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
									<select style="width: 80px; height: 33px;" name="tel1" class="textbox">
										<option>02</option>
										<option>031</option>
										<option>041</option>
									</select> - <input type="tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									 size="5px" name="tel2" class="textbox" style="width: 80px; height: 33px; "> 
									- <input
										type="tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										  size="5px" name="tel3" class="textbox" style="width: 80px; height: 33px;">
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<div style="color:red;">*<label class="font">휴대 전화</label>
									<div class="w-100"></div>
									</div>
									<select style="width: 80px; height: 33px;" name="phone1" class="textbox	">
										<option>010</option>
										<option>011</option>
										<option>016</option>
									</select> - <input type="tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									  size="5px" required name="phone2" class="textbox" style="width: 80px; height: 33px;">
									- <input type="tel"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									 size="5px" required name="phone3" class="textbox" style="width: 80px; height: 33px;">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<div style="color:red;">*<label style="color: black">우편번호</label>
									<div class="w-100"></div>
									<input type="text" readonly="readonly" id="addr1" name="addr1" class="textbox"required style="position: relative; right: 5px;">
				</div>
								</div>

							</div>

							<div class="col-md-2">
								<div class="form-group">
									<input type="button"
										style="width: 90px; height: 35px; font-size: 15px"
										class="btn2 textbox" value="검색" name="postBtn" id="postBtn">

								</div>

							</div>

							<div class="w-100"></div>
							<div class="col-md-10">
								<div class="form-group">
									<input type="text" class="textbox" placeholder="주소" style="width: 500px; margin-left: 0px;"
										id="addr2" name="addr2" >
								</div>
							</div>
							<div class="col-md-10">
								<div class="form-group">
									<!-- 사용자 입력 부분(상세주소) -->
									<input type="text" class="textbox" placeholder="상세주소" style="width: 250px; margin-left: 0px;"
										id="addr3" name="addr3" >
										<input type="text" class="textbox" placeholder="참고항목" style="width: 250px; margin-left: 270px; position: relative;top: -35px; "
										id="exAddr" name="exAddr" >
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
							<p style="border-bottom: solid; width: 650px; margin-top: -70px;">
								<div class="form-group">
								
									<input type="submit" class=" btn-success btn-lg" value="가입완료">
								</div>
							</div>
							<div class="col-md-2"></div>
							<div class="col-md-2"></div>

							<div class="col-md-6">
								<div class="form-group">
									<input type="button" class="btn-warning btn-lg" value="가입취소"
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
	
	function idDuplication() {
		$('#id').attr("readonly", true);
	}
</script>

</html>