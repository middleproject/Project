<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<section class="ftco-section">
    	<div class="container">
    	<div class="row">
	<c:forEach var="vo" items="${list }">
		<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="../recipe/recipe_detail.do?no=${vo.no }" class="img-prod"><img class="img-fluid" src="${vo.poster }" alt="Colorlib Template">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${vo.summary }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span>${vo.made }</span></p>
		    					</div>
	    					</div>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    		</div>
    		</div>
    		</section>
</body>
</html>