<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	 <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="col-md-12 d-flex ftco-animate">
			            <div class="blog-entry align-self-stretch d-md-flex">
			              <a href="../recipe/recipe_detail.do?no=${vo.no }&page=${curpage}" class="block-20" style="background-image: url('${vo.poster}');">
			              </a>
			              <div class="text d-block pl-md-4">
			              	<div class="meta mb-3">
			                  <div><a href="#">${vo.regdate }</a></div>
			                  <div><a href="#">${vo.made }</a></div>
			                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${vo.hit }</a></div>
			                </div>
			                <h3 class="heading"><a href="#">${vo.summary }</a></h3>
			                <p>${vo.summary_in}</p>
			                
			                <p><a href="../recipe/recipe_detail.do?no=${vo.no }&page=${curpage}" class="btn btn-primary py-2 px-3">Read more</a></p>
			              </div>
			            </div>
		          	</div>
		          </c:forEach>
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
              <h3 class="heading">Hot Recipe</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading-1"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 09, 2019</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">고기</a>
                <a href="#" class="tag-cloud-link">곡류</a>
                <a href="#" class="tag-cloud-link">과일</a>
                <a href="#" class="tag-cloud-link">가공식품</a>
                <a href="#" class="tag-cloud-link">채소</a>
                <a href="#" class="tag-cloud-link">해산물</a>
                <a href="#" class="tag-cloud-link">1인분</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
          </div>
                </div>
                
                </div>
                
                
                <!-- 페이지 나누기 -->
                <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="../recipe/recipe_list.do?page=${curpage-1 }">&lt;</a></li>
                <c:forEach var="i" begin="${curpage}" end="${curpage+4 }" step="1">
	                <c:if test="${i==curpage }">
	                	<li class="active"><span>${i}</span></li>
	                </c:if>
	                <c:if test="${i!=curpage }">
	                	<li><a href="../recipe/recipe_list.do?page=${i}">${i }</a></li>
	                </c:if>
                </c:forEach>
                <c:if test="${totalpage!=curpage }">
                <li><a href="../recipe/recipe_list.do?page=${curpage+1 }">&gt;</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
    	
                
    </section>
    
	</body>
</html>