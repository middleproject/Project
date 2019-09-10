<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
.search {
  width: 100%;
  position: relative;
}
.search:before {
  position: absolute;
  top: 0;
  right: 0;
  width: 40px;
  height: 40px;
  line-height: 40px;
  font-family: 'FontAwesome';
  content: '\f002';
  background: #8FC357;
  text-align: center;
  color: #fff;
  border-radius: 5px;
  -webkit-font-smoothing: subpixel-antialiased;
  font-smooth: always;
}

.searchTerm {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  width: 100%;
  border: 5px solid #8FC357;
  padding: 5px;
  height: 40px;
  border-radius: 5px;
  outline: none;
}

.searchButton {
  position: absolute;
  top: 0;
  right: 0;
  width: 40px;
  height: 40px;
  opacity: 0;
  cursor: pointer;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function difficulty(){
	$('.difficulty').click(function difficulty(){
		var difficultystep=$(this).attr("data-difficultystep");
		
		
		$('#difficultystep').text(difficultystep);
		$('#choice2').val(difficultystep);
		$.ajax({
			type:'post',
			url:'../search/difficultylist.do',
			data:{info:difficultystep},
			success:function(response)
			{
				
				$('#difficultylist').html(response);
			}
		});
	});
});
$(function(){
	$('.ingrelist').click(function(){
		var ingreposter=$(this).attr("data-poster");
		var ingrename=$(this).attr("data-name");
		var ingreno=$(this).attr("data-no");
		$('#ingreposter').attr("src",ingreposter);
		$('#ingrename').text(ingrename);
		$('#choice').val(ingrename);
		
		$.ajax({
			type:'post',
			url:'../search/searchlist.do',
			data:{ino:ingreno},
			success:function(response)
			{
				
				$('#searchlist').html(response);
			}
		});
	});
	
	$('.searchButton').click(function(){
		var key = $('.searchTerm').val();
		var ingre = $('#choice').val();
		var info = $('#choice2').val();
		
		location.href="../recipe/recipe_list.do?key="+key+"&ingre="+ingre+"&info="+info;
	});
});


</script>
</head>
<body>
<div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Search</h1>
          </div>
        </div>
      </div>
    </div>
<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6 d-flex align-items-center">
           <<div class="search">
  			<input type="text" class="searchTerm"/><input class="searchButton" type="button"  />
			</div>

          </div>
        </div>
      </div>
    </section>
<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center ">
    				<ul class="product-category" >
    				 <c:forEach var="vo" items="${list }">
    					  <li class="ingrelist" data-name="${vo.ingrename }" data-no="${vo.ingreno }"><a class="active">${vo.ingrename }</a></li>
    					</c:forEach>
    					<input type="hidden" id="choice" > 
    					<br><br>
    					<div id="searchlist"></div>
    					<br>
    					<c:forEach var="dvo" items="${dlist }">
    					<li class="difficulty" data-difficultystep="${dvo.difficultystep }"><a class="active">${dvo.difficultystep }</a></li>
    					</c:forEach>
    					<input type="hidden" id="choice2" >
    					
    					
    				</ul>
    				</div>
    			</div>
    		</div>
    		
    		<div class="row" id="searchingre" >
    		<div class="row" id="difficultylist" >
    		
    		</div>
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27" >
              <ul>
                <li><a>&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a>2</a></li>
                <li><a>3</a></li>
                <li><a>4</a></li>
                <li><a>5</a></li>
                <li><a>&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	
    </section>
    
</body>
</html>