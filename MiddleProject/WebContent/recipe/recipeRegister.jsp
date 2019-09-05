<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피등록</title>

<style type="text/css">
hr {
	width: 100%;
	border-top-width: 5px;
	padding-bottom: 20px;
	border-color: teal;
	border-left: 5px;
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
					onsubmit="return validate();" enctype="multipart/form-data">
					<h3 class="mb-4 billing-heading">레시피 등록</h3>
					<hr>
					<div class="row align-items-end">


						<div class="col-md-12">
							<div class="form-group">
								<label>레시피 제목 </label> <input type="text"
									style="margin-left: 100px;">
							</div>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label style="position: relative; top: -80px;">요리 소개 </label>
								<textarea
									style="margin-left: 115px; width: 250px; height: 100px">
								</textarea>
							</div>
						</div>

						<div class="col-md-10">
							<div class="form-group">
								<label style="margin-right: 115px;">카테고리</label> <select>
									<option>종류별</option>
								</select> <select>
									<option>상황별</option>
								</select> <select>
									<option>방법별</option>
								</select> <select>
									<option>재료별</option>
								</select>
							</div>
						</div>

						<div class="col-md-10">
							<div class="form-group">
								<label style="margin-right: 115px;">요리정보</label> <select>
									<option>인원</option>
								</select> <select>
									<option>시간</option>
								</select> <select>
									<option>난이도</option>
								</select>
							</div>
						</div>
						
						<div class="col-md-10">
							<label style="margin-right: 95px;">사진 올리기</label> <input
								type='file' id="imgInput"/> <img id="image_section"
								style="position: relative;  top: 25px; margin-bottom: 30px;" >
						</div>
					</div>
					
					<hr>

					<input type="text" name="textbox1" placeholder="재료"
						style="background-color: yellow; width: 150px;">
					<div class="col-md-8">
						<input type="text" class="textbox" placeholder="예)돼지고기"
							style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
					</div>
					<div class="col-md-8">
						<input type="text" name="textbox2" placeholder="예)양배추"
							style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
					</div>
					<div class="col-md-8">
						<input type="text" name="textbox3" placeholder="예)참기름"
							style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
					</div>

					<input type="button" value="추가"
						style="position: relative; left: 500px; bottom: 165px;"
						onclick="add();">
					<div id="textdiv"></div>
					<hr>
					
					<label style="position: relative; top: -100px;">요리 과정</label>
					<textarea
							style="position: relative; left: 170px; top: -20px; width: 400px; height: 150px;"
							placeholder="예)라면을 끓일떄 물을 3분간 끓이고 스프넣고 후레이크넣고 면을 넣습니다."></textarea>

					 <input	type='file' id="imgInput2"  style="margin-left: 130px;"/> <img id="image_section2"/>
					<hr>

					<label>요리 팁</label>
					<div class="col-md-8">
						<textarea
							style="position: relative; left: 220px; top: -34px; width: 400px; height: 150px;"
							placeholder="예)고기에는 소금보다 설탕을 먼저넣어야 단맛이 겉돌지 않고 육질이 부드러워요"></textarea>

					</div>

					<hr>
					<label>태그</label>
					<div class="col-md-8">
						<input type="text"
							style="position: relative; left: 220px; top: -34px;">
					</div>

					<hr>



					<div class="col-md-10">
						<div class="form-group">
							<input type="submit" class=" btn-success btn-lg" value="등록하기"
								style="margin-right: 100px; margin-left: 200px;"> <input
								type="button" value="취소하기" class=" btn-warning btn-lg"
								onClick="self.location='mypageMain.do';">

						</div>
					</div>

				</form>
			</div>
		</div>

	</div>
	</section>

	<!-- END -->
<!-- 재료추가 -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		var num = 4;
		function add() {
			$("#textdiv")
					.append(
							"<br>"
									+ "<input type='text'  name='textbox"+num+"' style='position: relative; left: 235px; top:-90px; margin-bottom: 10px; '/>");
			num++;
		}
	</script>

<!--  사진첨부 -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInput").change(function() {
			readURL(this);
		});
	</script>
	
	<!-- 요리과정 사진첨부 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section2').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#imgInput2").change(function() {
			readURL2(this);
		});
	</script>
	




</body>
</html>