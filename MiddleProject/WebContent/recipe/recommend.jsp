<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#search').click(function(){
		var key = $('#key').val();
		location.href="../recipe/recipe_list.do?key="+key;
	});
});
</script>
<meta charset="UTF-8">
</head>
<body>
	<div class="hero-wrap hero-bread"
		style="background-image: url('../main/images/bg_1.jpg');"></div>
	 <section class="ftco-section ftco-degree-bg">
      <div class="container">
     	<div>
			<c:if test="${key!=null && key.trim()!='' }">
					<h2 class="text-center">'${key }' 검색 결과 입니다</h2><br>
				</c:if>
				</div>
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
                  <span class="icon ion-ios-search" id="search"></span>
                  <input type="text" class="form-control" placeholder="Search..." id="key">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 class="heading">난이도</h3>
              <ul class="categories">
                <li><a href="../recipe/recipe_list.do?&info=아무나">아무나 <span></span></a></li>
                <li><a href="../recipe/recipe_list.do?&info=초급">초급 <span></span></a></li>
                <li><a href="../recipe/recipe_list.do?&info=중급">중급 <span></span></a></li>
                <li><a href="../recipe/recipe_list.do?&info=고급">고급 <span></span></a></li>
              </ul>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Tag Cloud</h3>
              <div class="tagcloud">
                <a href="../recipe/recipe_list.do?&tag=고기" class="tag-cloud-link">고기</a>
                <a href="../recipe/recipe_list.do?&tag=혼밥" class="tag-cloud-link">혼밥</a>
                <a href="../recipe/recipe_list.do?&tag=간단" class="tag-cloud-link">간단</a>
                <a href="../recipe/recipe_list.do?&tag=라면" class="tag-cloud-link">라면</a>
                <a href="../recipe/recipe_list.do?&tag=안주" class="tag-cloud-link">안주</a>
                <a href="../recipe/recipe_list.do?&tag=마라" class="tag-cloud-link">마라</a>
                <a href="../recipe/recipe_list.do?&tag=에어프라이" class="tag-cloud-link">에어프라이</a>
              </div>
            </div>

            
          </div>
                </div>
                
                </div>
   
                
    </section>
    
	</body>
</html>