<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#suggestion').click(function(){
		var pricesug = $('#pricesug').val();
		
		$.ajax({
			type:'post',
			url:'../reserve/priceSelect.do',
			data:{pricesug:pricesug},
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#select5').html(response);
			}
		});
	});
});
</script>
</head>
<body>

		  <div id="searchbox">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group" style="width: 500px">
                  <span class="icon ion-ios-search" id="suggestion"></span>
                  <input type="text" class="form-control" placeholder="Price suggestion..." id="pricesug">
                	 
                </div>
              </form>
            </div>
          </div> 
		
</body>
</html>