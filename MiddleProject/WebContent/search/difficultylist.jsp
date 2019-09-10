<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   

</head>
<body>
<c:forEach var="vo" items="${list }">

   <div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="../recipe/recipe_detail.do?no=${vo.no }" class="img-prod"><img class="img-fluid" src="${vo.poster }" alt="Colorlib Template" style="width: 400px; height: 400px;">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a>${vo.summary }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${vo.made }</span></p>
		    					</div>
	    					</div>
    						<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
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