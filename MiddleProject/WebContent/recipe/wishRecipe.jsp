<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>	

<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>

	<section class="ftco-section" >
	<div class="container" >
		<div class="row justify-content-center" >
				<p style="position: relative; left: -350px;">찜한 레시피.</p>	

				<div class="col-md-14" style="text-align: center; margin-left: 100px;">
				<c:forEach var="vo" items="${list }">
					<div class="col-md-16"
						style="text-align: center; float: left; margin-right: 20px; margin-bottom: 50px;  "	 >
						<div class="product"
							style=" width: 300px; height: 350px; color: white; ">

							<a href="recipe_detail.do?no=${vo.no }&page=1" class="img-prod"><img class="img-fluid"
								src="${vo.poster }" alt="Colorlib Template"
								style="width: 280px; height: 330px;"> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="#">${vo.summary }</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span>${vo.made }</span>
										</p>
									</div>
								</div>
							</div>
							<!--     						 <div class="bottom-area d-flex px-3">
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
    						</div>  -->
						</div>
					</div>
					</c:forEach>
			</div>
		</div>
	</div>
	

	
	</section>
</body>
</html>