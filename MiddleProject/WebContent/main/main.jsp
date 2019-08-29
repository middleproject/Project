<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Welcome Yolibogo-Jolibogo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="../main/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../main/css/animate.css">
    
    <link rel="stylesheet" href="../main/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../main/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../main/css/magnific-popup.css">

    <link rel="stylesheet" href="../main/css/aos.css">

    <link rel="stylesheet" href="../main/css/ionicons.min.css">

    <link rel="stylesheet" href="../main/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../main/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../main/css/flaticon.css">
    <link rel="stylesheet" href="../main/css/icomoon.css">
    <link rel="stylesheet" href="../main/css/style.css">
    <style type="text/css">

    .navbar-collapse > ul.navbar-nav li a.jua{
    	font-family: 'Jua', sans-serif;
    	font-size: 21px;
    	display: block;
  		padding: 0.5rem 1rem;
  		color: black;
    }

    
    
    </style>
  </head>
  <body class="goto-here">
		<div class="py-2 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">010-2916-3239</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">qpp666@naver.com</span>
					    </div>
					    <div class="col-md pr-1 d-flex topper align-items-left text-left">
						    
					    </div>
					    <div class="col-md pr-1 d-flex topper align-items-left text-left">
						    
					    </div>
					    <div class="col-md pr-1 d-flex topper align-items-left text-left">
						    
					    </div>
					    	<c:if test="${sessionScope.id==null }">
						    <a href="../member/signIn.do"><span class="text" style="color:white;">로그인</span></a>
						  	
						        <span class="text" style="color:white;">　　　</span>
					    
						    <a href="../member/signUp.do"><span class="text" style="color:white;">회원 가입</span></a>		
						    </c:if>
						    <c:if test="${sessionScope.id!=null }">
						    <a href=""><span class="text" style="color:white;">로그아웃</span></a>
						    </c:if>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="../main/main.do"><img src="../main/images/logo.png"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active jua"><a href="../main/main.do" class="jua">홈</a></li>
	          <li class="nav-item"><a href="../search/search.do" class="jua">검색</a></li>
	         <li class="nav-item dropdown">
              <a class="dropdown-toggle jua" href="../recipe/recipe_list.do" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">요리</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item jua" href="../recipe/recipe_list.do">요리보기</a>
              	<a class="dropdown-item jua" href="#">식단</a>
                <a class="dropdown-item jua" href="#">좋아하는 요리</a>
              </div>
            </li>
	         <li class="nav-item dropdown">
              <a class="jua dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
              <div class="dropdown-menu jua" aria-labelledby="dropdown04">
              	<a class="dropdown-item jua" href="#">자랑 게시판</a>
              	<a class="dropdown-item jua" href="#">후기 게시판</a>
                <a class="dropdown-item jua" href="../bQnA/qboard_list.do">문의 게시판</a>
                <a class="dropdown-item jua" href="../board/board_list.do">자유게시판</a>
                <a class="dropdown-item jua" href="#">자료실</a>
              </div>
            </li>
            
            
            
            
	         
	          
	          <li class="nav-item"><a href="#" class="jua">예약확인?</a></li>
	          <li class="nav-item"><a href="#" class="jua">실시간 상담</a></li>
	          <c:if test="${sessionScope.admin==0 || sessionScope.admin==2 }">
	            <li class="nav-item dropdown">
	              	  <a class="jua dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">회원정보</a>
		              <div class="dropdown-menu jua" aria-labelledby="dropdown04">
		              	<a class="dropdown-item jua" href="#">마이페이지</a>
		              	<a class="dropdown-item jua" href="#">회원수정</a>
		              	<a class="dropdown-item jua" href="#">회원삭제</a>
		              	<a class="dropdown-item jua" href="../recipe/follow.do">팔로우 레시피</a>
		              </div>
	            </li>
	            </c:if>
	            <c:if test="${sessionScope.admin==1 }">
	            	<li class="nav-item"><a href="#" class="jua">회원관리</a></li>
	            </c:if>
	          <li class="nav-item cta cta-colored"><a href="#" class="jua"><span class="icon-shopping_cart"></span>[0]</a></li>

	        </ul>
	      </div>
	    </div>
	  </nav>


	 <jsp:include page="${main_jsp }"></jsp:include>

		

    

    <hr>



    <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">요리보고 조리보고</h2>
              <p>1조 프로젝트로 만개의 레시피를 모방하여 재구축시킨 사이트다 역시 영어가 간지나긴 한다.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">검색</a></li>
                <li><a href="#" class="py-2 d-block">요리</a></li>
                <li><a href="#" class="py-2 d-block">게시판</a></li>
                <li><a href="#" class="py-2 d-block">회원정보</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">인천광역시 연수구 동춘1동 건영아파트 126동 203호</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">010 2916 3239</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">qpp666@gmail.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../main/js/jquery.min.js"></script>
  <script src="../main/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../main/js/popper.min.js"></script>
  <script src="../main/js/bootstrap.min.js"></script>
  <script src="../main/js/jquery.easing.1.3.js"></script>
  <script src="../main/js/jquery.waypoints.min.js"></script>
  <script src="../main/js/jquery.stellar.min.js"></script>
  <script src="../main/js/owl.carousel.min.js"></script>
  <script src="../main/js/jquery.magnific-popup.min.js"></script>
  <script src="../main/js/aos.js"></script>
  <script src="../main/js/jquery.animateNumber.min.js"></script>
  <script src="../main/js/bootstrap-datepicker.js"></script>
  <script src="../main/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../main/js/google-map.js"></script>
  <script src="../main/js/main.js"></script>
    
  </body>
</html>