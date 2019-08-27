<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<style type="text/css">
.table {
    FONT-WEIGHT: 500;
    min-width: 500px !important;
    width: 100%;
    text-align: center;
}
.chat-bubble {
    background-color: #ededed;
    border: 2px solid #666;
    font-size: 35px;
    line-height: 1.3em;
    margin: 10px auto;
    padding: 10px;
    position: relative;
    text-align: center;
    width: 730px;
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    -moz-box-shadow: 0 0 5px #888;
    -webkit-box-shadow: 0 0 5px #888;
    font-family: 'Bangers', arial, serif; 
}
.chat-bubble-arrow-border {
    border-color: #666 transparent transparent transparent;
    border-style: solid;
    border-width: 20px;
    height: 0;
    width: 0;
    position: absolute;
    bottom: -42px;
    left: 30px;
}
.chat-bubble-arrow {
    border-color: #ededed transparent transparent transparent;
    border-style: solid;
    border-width: 20px;
    height: 0;
    width: 0;
    position: absolute;
    bottom: -39px;
    left: 30px;
}
.text-box {
    position: relative;
    float: right;
    right: 0px;
    top: 100px;
    padding: 10px 25px;
    width: 45%;
    background-color: rgba(255, 255, 255, 0.85);
    border-radius: 8px;
    font-size: 1rem;
    line-height: 1.5rem;
}
.main-img {
    height: 400px;
    overflow: hidden;
    background: url(http://css3.zerois.net/images/pic1.jpg) top center no-repeat;
    background-size: cover;
}
.text-center {
    text-align: center;
}
.container {
    max-width: 1400px;
}
.divclass{
	width:2000px;	
}
</style>
<meta charset="UTF-8">
</head>
<body>

	<section class="ftco-section ftco-degree-bg">
		<div class="container divclass">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<table class="table">
						<div class="chat-bubble">
							${vo.summary }
						        <div class="chat-bubble-arrow-border"></div>
						        <div class="chat-bubble-arrow"></div>
						        </div><br>
						        <p>
						<img src="${vo.poster }" alt="" style="width:900px" class="img-fluid">
						</p>
				            <h2>${vo.summary_in }</h2>
				            
				    <table class="table">
				    	<tr>
				    		<td><img src="../recipe/multiple-users-silhouette.png"><br>${info[0] }</td>
				    		<td><img src="../recipe/alarm-clock.png"><br>${info[1] }</td>
						    <td><img src="../recipe/star.png"><br>${info[2] }</td> 
					    <tr>
					</table>
						</table>
					<!-- 재료 테이블 -->
					<table class="table">
						<h2 class="text-left">재 료! <font size="4pt;" color="gray"><EM>Ingredients</EM></font></h2>
							
							<div class="col-lg-8 ftco-animate">
								<c:forEach var="ingredetail" items="${ingre }" varStatus="s">
									<th>${ingredetail }</th>
								</c:forEach>
							</div>
						
					</table>
					<!-- 조리 순서 테이블 -->
					<table class="table">
						<h2 class="text-left">조리 순서! <font size="4pt;" color="gray"><EM>step</EM></font></h2>
						<div class="row">
							<div class="col-lg-8 ftco-animate">
								<c:forEach var="step" items="${step }" varStatus="s">
									<tr>
										<td><h4 class="text-left">${step}</h4></td>
										<c:if test="${step_poster[s.index]!=null }">
										<td><img src="${step_poster[s.index] }" style="height:350px;width:350px;"></td>
										</c:if>
									</tr>
								</c:forEach>
							</div>
						</div>
					</table>
 					
 					<!-- 태그부터 만든이 Tip-->
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<c:forEach var="tag" items="${tagStr }">
							<a href="#" class="tag-cloud-link">${tag }</a> 
							</c:forEach>
						</div>
					</div>

					<div class="about-author d-flex p-4 bg-light">
						<div class="bio align-self-md-center mr-4">
							<img src="${vo.image }" style="height:200px;width:200px;" alt="Image placeholder"
								class="img-fluid mb-4">
						</div>
						<div class="desc align-self-md-center">
							<h3>${vo.made }</h3>
							<p>${vo.tip }</p>
						</div>
						
					</div>
					
					
				</div>
				    <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon ion-ios-search"></span>
                  <input type="text" class="form-control" placeholder="Search...">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 class="heading">Categories</h3>
              <ul class="categories">
                <li><a href="#">Vegetables <span>(12)</span></a></li>
                <li><a href="#">Fruits <span>(22)</span></a></li>
                <li><a href="#">Juice <span>(37)</span></a></li>
                <li><a href="#">Dries <span>(42)</span></a></li>
              </ul>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Related Recipe</h3>
              <c:forEach var="hvo" items="${list }">
              <c:if test="${vo.no!=hvo.no }">
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(${hvo.poster});"></a>
	                <div class="text">
	                  <h3 class="heading-1"><a href="../recipe/recipe_detail.do?no=${hvo.no }">${hvo.summary }</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> ${hvo.regdate }</a></div>
	                    <div><a href="#"><span class="icon-person"></span> ${hvo.made }</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> ${hvo.hit }</a></div>
	                  </div>
	                </div>
	              </div>
              </c:if>
              </c:forEach>
              </div>
            

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Tag Cloud</h3>
              <div class="tagcloud">
              <c:forEach var="tag" items="${tagStr }">
                <a href="#" class="tag-cloud-link">${tag }</a>
                </c:forEach>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
			</div>
			
		</div>
	</section>
</body>
</html>