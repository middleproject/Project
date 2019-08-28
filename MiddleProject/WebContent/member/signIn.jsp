<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#logBtn').click(function() {
		var id = $('#id').val();
		var pwd = $('#id').val();
		if (id.trim() == "") {
			$('#id').focus();
			return;
		}
		if (pwd.trim() == "") {
			$('#pwd').focus();
			return;
		}
		$('form').submit();
<%-- 일반 태그는 아무것도 안 붙여도 됨 --%>
	});
});
</script>




</head>
<body>


	<div class="container-login100"
		style="background-image: url('images/bg-01.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-40 p-b-70">
			<form class="login100-form validate-form" method="post" action="../member/signIn_ok.do">

				<a href="../main/main.do" class="login100-form-title p-b-40"> <img
					src="Resize.png">
				</a>

				<div class="wrap-input100 validate-input m-b-26">
					<input class="input100" type="text" name ="id" placeholder="아이디를 입력하세요"> 
						<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-45">
					<input class="input100" type="password" name="pwd"
						placeholder="비밀번호를 입력하세요"> <span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn validate-input m-b-20">
					<button class="login100-form-btn" name="logBtn">로그인</button>
				</div>
				<br>

				<div class="text-center">
					<a href="signUp.jsp" class="txt2 hov1 validate-input m-b-10" > 회원가입 </a>
				</div>

<!-- 이메일로 찾음 -->
				<div class="text-center">
					<a href="idFind.jsp" class="txt2 hov1 validate-input m-b-10"> 아이디찾기 </a>
				</div>

<!-- 아이디하고 이메일로 찾음 -->
				<div class="text-center">
					<a href="pwdFind.jsp" class="txt2 hov1 validate-input m-b-10"> 비밀번호찾기 </a>
				</div>
			</form>


		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>







</body>
</html>