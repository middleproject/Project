<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
section.hero > div.home-slider > div.slider-item > div.doHyeon > h1{
    	font-family: 'Do Hyeon', sans-serif;
    	font-size: 21px;
  		color: black;
    
    } 
</style>
</head>
<body>
    <!-- END nav -->

    <section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
	      
	      <div class="slider-item" style="background-image: url(../main/images/1_2_test.jpg);">
	      	
	      	<div class="overlay"></div>
	        <div class="container">
	        
	          <div class="row slider-text justify-content-center align-items-center doHyeon" data-scrollax-parent="true">
	            <div class="col-md-12 ftco-animate text-center">
	              
	              <h1 class="mb-2">Recently Registered &amp; Recipe</h1>
	              <h2 class="subheading mb-4">최근 등록된  &amp; 따끈따끈한 레시피</h2>
	              <p><a href="../recipe/recipe_list.do" class="btn btn-primary">최근 등록된 레시피</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(../main/images/1__test.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">

	              <h1 class="mb-2">A Notice Of The Week</h1>
	              <h2 class="subheading mb-4">Please &amp; check it </h2>

	             <!--  <h1 class="mb-2">@@@@hi hello &amp; JSP</h1>
	              <h2 class="subheading mb-4">Spring &amp; JAVA </h2> -->

	              <p><a href="../databoard/databoard_list.do" class="btn btn-primary">금주의 공지사항</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	      
	      <div class="slider-item" style="background-image: url(../main/images/1_2_3_test.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">

	              <h1 class="mb-2">Is There Any Recipe You Want? </h1>
	              <h2 class="subheading mb-4">Search &amp; for it </h2>
<!-- 	              <p><a href="../search/search.do" class="btn btn-primary">검색</a></p> -->

	              <h1 class="mb-2">We Have Everything</h1>
	              <h2 class="subheading mb-4">Find The Recipe  &amp; You Want </h2>
	              <p><a href="../search/search.do" class="btn btn-primary">원하는 레시피를 찾아보세요!!</a></p>

	            </div>

	          </div>
	        </div>
	      </div>
	      

	      
	    </div>
    </section>
<%-- --%>
    <section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              
              <div class="media-body">
                <h3 class="heading"><a href="../recipe/recipeRegister.do">레시피 등록</a></h3>
                <span>Recipe Registration</span>
              </div>
            </div>      
          </div>
          
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <!-- <h3 class="heading">예약하기</h3>    -->   
                <c:if test="${sessionScope.id!=null }">
		         	 <h3 class="heading"><a href="../reserve/reserve.do">예약하기</a></h3>
		         </c:if>
		         <c:if test="${sessionScope.id==null }">
		         	 <h3 class="heading"><a onclick="javascript:alert('로그인을 하세요');">예약하기</a></h3>
		         </c:if>         
                <span>Recipe reservation</span>
              </div>
            </div>    
          </div>
          
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <c:if test="${sessionScope.id!=null }">
		         	 <h3 class="heading"><a href="../member/cashPage.do">지갑충전</a></h3>
		         </c:if>
		         <c:if test="${sessionScope.id==null }">
		         	 <h3 class="heading"><a onclick="javascript:alert('로그인을 하세요');">지갑충전</a></h3>
		         </c:if>   
                <span>Charging</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading"><a href="../bQnA/qboard_list.do">문의하기</a></h3>
                <span>To contact</span>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>

		<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">List Of Recipes Divided By Material</span>
            <h2 class="mb-4">재료별로 나눈 레시피 목록</h2>
            <p>육류/해산물류/과일류/채소류/가공식품류/곡류</p>
          </div>
        </div>   		
    	</div>
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(https://t1.daumcdn.net/cfile/tistory/220E5B35572F53E113);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=고기">Meat</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(http://www.bapsangnews.com/img/r/j/1524017758_rjpf7gy37zdgtmf4kr0s.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=채소">Vegetables</a></h2>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(http://haemul.365food.com/resource/upload/mini/haemul/special[1].gif);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=해산물">SeaFoods</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(http://www.farminsight.net/news/photo/201904/2077_2907_856.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=즉석">Processed Foods</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(http://www.postech.ac.kr/wp-content/uploads/2018/07/159-23-1.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=과일">Fruits</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(http://cfile236.uf.daum.net/image/1679334B50F3CBB920183E);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="../recipe/recipe_list.do?key=쌀">Cereals</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

<%-- --%>
    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Today's Popular Recipes</span>
            <h2 class="mb-4">오늘의 인기요리 BEST8</h2>
            <p>오늘 하루 회원님들이 가장 많이 찾은 요리 8가지</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    		<c:forEach var="vo" items="${rlist }" varStatus="s">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="../recipe/recipe_detail.do?no=${vo.no}" class="img-prod"><img class="" src="${vo.poster }" width="300" height="300">
    						<span class="status"><c:if test="${s.index<3 }">Hot!!&nbsp;</c:if> 오늘 기록한 조회 수 :&nbsp;${vo.hit }</span>
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${vo.made }</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="price-sale">${vo.summary }</span></p>
		    					</div>
	    					</div>
	    					<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>
    
	
		<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading">Popular Chef</span>
            <h2 class="mb-4">이달의 쉐프</h2>
            <p>이달의 팔로우가 많은 인기요리사</p>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
            <c:forEach var="mvo" items="${mList }" varStatus="s">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(${mvo.poster})">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text text-center">
                    <p class="mb-5 pl-4 line">${mvo.intro }</p>
                    <p class="name">${mvo.name }</p>
                    <span class="position">member${s.index }</span>
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
    	<div class="container">
				<div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
          	<span class="subheading">Site visitors</span>
            <h2 class="mb-4">방문자 수</h2>
            <div id="timer" class="d-flex mt-5">
				<div class="time pl-3" id="Total">${TotalCount }<span>TOTAL</span></div>
			  	<div class="time pl-3" id="Today">${TodayCount }<span>TODAY</span></div>
			</div>
			<p>총 방문자수　　| 오늘의 방문자수</p>
            <p></p>
            <h3><a href="http://www.10000recipe.com/">Benchmarking</a></h3>
            <span class="price"><a href="https://www.sist.co.kr/index.do">Made By-쌍용강북교육센터 G강의장</a></span>

          </div>
        </div>   		
    	</div>
    </section>
    
    
    
    
</body>
</html>