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
$(function(){
	$('.ingrelist').click(function(){
		var ingreposter=$(this).attr("data-poster");
		var ingrename=$(this).attr("data-name");
		var ingreno=$(this).attr("data-no");
		$('#ingreposter').attr("src",ingreposter);
		$('#ingrename').text(ingrename);
		
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
});
<%--$('.searchButton').on('click',function(){
	  alert('You clicked search button');
	});--%>
</script>
</head>
<body>
<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6 d-flex align-items-center">
           <form class="search">
  <input class="searchTerm" placeholder="Enter your search term ..." /><input class="searchButton" type="submit" />
</form>
          </div>
        </div>
      </div>
    </section>
<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    				<c:forEach var="vo" items="${list }">
    					<li class="ingrelist" data-name="${vo.ingrename }" data-no="${vo.ingreno }"><a href="#" class="active">${vo.ingrename }</a></li>
    					</c:forEach>
    					<div id="searchlist"></div>
    				</ul>
    				
    			</div>
    		</div>
    		<div class="row">
    		     <div id="searchingre"></div>
    			
    		</div>
    		<div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
    	</div>
    </section>
    
</body>
</html>