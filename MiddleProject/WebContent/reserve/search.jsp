<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#search').click(function(){
		var key = $('#key').val();
		$("#searchbox").remove();
		$.ajax({
			type:'post',
			url:'../reserve/search2.do',
			data:{key:key},
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#result').html(response);
			}
		});
	});
});
</script>
</head>
<body>
	 <section class="ftco-section ftco-degree-bg" style="display: ">
      
     	<div>
		  <div id="searchbox">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group" style="width: 500px">
                  <span class="icon ion-ios-search" id="search"></span>
                  <input type="text" class="form-control" placeholder="Search..." id="key">
                	 
                </div>
              </form>
            </div>
          </div> 
		</div>
       	<!-- <div id=result style="overflow:auto; width:100%; height:400px;"></div> -->
       	<div id=result></div>
        
 
                
    </section>
</body>
</html>