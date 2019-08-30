<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.ftco-product .owl-carousel .owl-stage-outer {
  padding-bottom: 2em;
  position: relative; }

.product {
  display: block;
  width: 100%;
  margin-bottom: 30px;
  position: relative;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  -webkit-transition: all 0.3s ease;
  -ms-transition: all 0.3s ease;
  transition: all 0.3s ease;
  border: 1px solid #f0f0f0; }
  @media (max-width: 991.98px) {
    .product {
      margin-bottom: 30px; } }
  .product .img-prod {
    position: relative;
    display: block;
    overflow: hidden; }
    .product .img-prod .overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      content: '';
      opacity: 0;
      background: #82ae46;
      -moz-transition: all 0.3s ease;
      -o-transition: all 0.3s ease;
      -webkit-transition: all 0.3s ease;
      -ms-transition: all 0.3s ease;
      transition: all 0.3s ease; }
    .product .img-prod span.status {
      position: absolute;
      top: 0;
      left: 0;
      padding: 2px 10px;
      color: #fff;
      font-weight: 300;
      background: #82ae46;
      font-size: 12px; }
    .product .img-prod img {
      -webkit-transform: scale(1);
      -moz-transform: scale(1);
      -ms-transform: scale(1);
      -o-transform: scale(1);
      transform: scale(1);
      -moz-transition: all 0.3s ease;
      -o-transition: all 0.3s ease;
      -webkit-transition: all 0.3s ease;
      -ms-transition: all 0.3s ease;
      transition: all 0.3s ease; }
    .product .img-prod:hover img, .product .img-prod:focus img {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -ms-transform: scale(1.1);
      -o-transform: scale(1.1);
      transform: scale(1.1); }
  .product .img {
    display: block;
    height: 500px; }
  .product .icon {
    width: 60px;
    height: 60px;
    background: #fff;
    opacity: 0;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease; }
    .product .icon span {
      color: #000000; }
  .product:hover .icon {
    opacity: 1; }
  .product:hover .img-prod .overlay {
    opacity: 0; }
  .product .text {
    background: #fff;
    position: relative;
    width: 100%; }
    .product .text h3 {
      font-size: 14px;
      margin-bottom: 5px;
      font-weight: 300;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-family: "Poppins", Arial, sans-serif; }
      .product .text h3 a {
        color: #000000; }
    .product .text p.price {
      margin-bottom: 0;
      color: #82ae46;
      font-weight: 400; }
      .product .text p.price span.price-dc {
        text-decoration: line-through;
        color: #b3b3b3; }
      .product .text p.price span.price-sale {
        color: #82ae46; }
    .product .text .pricing {
      width: 100%;
      -moz-transition: all 0.3s ease;
      -o-transition: all 0.3s ease;
      -webkit-transition: all 0.3s ease;
      -ms-transition: all 0.3s ease;
      transition: all 0.3s ease; }
    .product .text .bottom-area {
      position: absolute;
      bottom: 15px;
      left: 0;
      right: 0;
      opacity: 0;
      -moz-transition: all 0.3s ease;
      -o-transition: all 0.3s ease;
      -webkit-transition: all 0.3s ease;
      -ms-transition: all 0.3s ease;
      transition: all 0.3s ease; }
      .product .text .bottom-area a {
        color: #fff;
        width: 100%;
        background: #82ae46;
        width: 40px;
        height: 40px;
        margin: 0 auto;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        -ms-border-radius: 50%;
        border-radius: 50%; }
      .product .text .bottom-area .m-auto {
        margin: 0 auto; }
  .product:hover {
    -webkit-box-shadow: 0px 7px 15px -5px rgba(0, 0, 0, 0.07);
    -moz-box-shadow: 0px 7px 15px -5px rgba(0, 0, 0, 0.07);
    box-shadow: 0px 7px 15px -5px rgba(0, 0, 0, 0.07); }
    .product:hover .pricing {
      opacity: 0; }
    .product:hover .text .bottom-area {
      opacity: 1; }

.product-details h3 {
  font-size: 30px;
  font-weight: 400; }

.product-details .price span {
  font-size: 30px;
  color: #000000; }

.product-details button i {
  color: #000000; }

.product-details .quantity-left-minus {
  background: transparent;
  padding: 0 15px; }

.product-details .quantity-right-plus {
  background: transparent;
  padding: 0 15px; }

.product-details button, .product-details .form-control {
  height: 40px !important;
  text-align: center;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  color: #82ae46;
  padding: 10px 20px;
  background: transparent !important;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  -ms-border-radius: 0;
  border-radius: 0;
  font-size: 14px; }
  .product-details button:hover, .product-details button:focus, .product-details .form-control:hover, .product-details .form-control:focus {
    text-decoration: none;
    outline: none; }

.product-details .form-group {
  position: relative; }
  .product-details .form-group .form-control {
    padding-right: 40px;
    color: #000000;
    background: transparent !important; }
    .product-details .form-group .form-control::-webkit-input-placeholder {
      /* Chrome/Opera/Safari */
      color: #4d4d4d; }
    .product-details .form-group .form-control::-moz-placeholder {
      /* Firefox 19+ */
      color: #4d4d4d; }
    .product-details .form-group .form-control:-ms-input-placeholder {
      /* IE 10+ */
      color: #4d4d4d; }
    .product-details .form-group .form-control:-moz-placeholder {
      /* Firefox 18- */
      color: #4d4d4d; }
  .product-details .form-group .icon {
    position: absolute;
    top: 50%;
    right: 20px;
    font-size: 14px;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
    color: #000000; }
    .product-details .form-group .icon span {
      color: #000000; }
    @media (max-width: 767.98px) {
      .product-details .form-group .icon {
        right: 10px; } }
  .product-details .form-group .select-wrap {
    position: relative; }
    .product-details .form-group .select-wrap select {
      font-size: 13px;
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      text-transform: uppercase;
      letter-spacing: 2px; }
</style>
</head>
<body>
<c:forEach var="vo" items="${list }">
<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="${vo.poster }" alt="Colorlib Template">
    						<span class="status">30%</span>
    						<div class="overlay"></div>
    					</a>
    					
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${vo.summary }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
</body>
</html>