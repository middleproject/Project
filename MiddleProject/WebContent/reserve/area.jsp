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
		$('.jiyock').click(function(){
			var title=$(this).text();
			var areaName=$(this).attr("name");
			$.ajax({
				type:'post',
				url:'../reserve/areaSelect.do',
				data:{title:title,areaName:areaName},
				success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
					$('#select2').html(response);
				}
			});
		});

});
</script>
</head>
<body>
	<section class="ftco-section">
    	<div class="container">
    		<div class="">
    			<div class="col-md-12 text-center" style="width: 530px;padding-left: 0px;">
    				<ul class="product-category">
    					<li><a class="active jiyock" name="서울">서울특별시</a></li>
    					<li><a class="active jiyock" name="인천">인천광역시</a></li>
    					<li><a class="active jiyock" name="부산">부산광역시</a></li>
    					<li><a class="active jiyock" name="대구">대구광역시</a></li>
    					<li><a class="active jiyock" name="대전">대전광역시</a></li>
    					<li><a class="active jiyock" name="광주">광주광역시</a></li>
    					<li><a class="active jiyock" name="울산">울산광역시</a></li>
    					<li><a class="active jiyock" name="세종">세종특별자치시</a></li>
    					<br>
    				</ul>

    			</div>
    		</div>
    	</div>
    </section>
    		
</body>
</html>