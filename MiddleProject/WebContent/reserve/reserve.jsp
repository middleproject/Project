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
	
	$.ajax({
		type:'post',
		url:'../reserve/blank.do',
		
		success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
			$('#print').html(response);
		}
	});
	
	$('.recipe').click(function(){
				
		$.ajax({
			type:'post',
			url:'../reserve/search.do',
			
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#print').html(response);
			}
		});
	});
	$('.area').click(function(){
				
		$.ajax({
			type:'post',
			url:'../reserve/area.do',
			
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	$('.cheif').click(function(){
		var area=$('#select2_').attr("title");
		$.ajax({
			type:'post',
			url:'../reserve/cheif.do',
			data:{area:area},
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	$('.datetime').click(function(){
		var id=$('#select3_').attr("title");
		$.ajax({
			type:'post',
			url:'../reserve/date.do',
			data:{id:id},
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	$('.costomprice').click(function(){
		$.ajax({
			type:'post',
			url:'../reserve/price.do',
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	$('.command').click(function(){
		$.ajax({
			type:'post',
			url:'../reserve/command.do',
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	$('.final').click(function(){
		
		$.ajax({
			type:'post',
			url:'../reserve/final.do',
			success:function(response){
				$('#print').html(response);
			}
		});
	});
	
});
function reserve() {
	var title=$('#reserve_title').text();
	var tname=$('#reserve_theater').text();
	var rdate=$('#reserve_day').text();
	var rtime=$('#reserve_time').text();
	var inwon=$('#reserve_inwon').text();
	var price=$('#reserve_price').text();
	
	$.ajax({
		type:'post',
		url:'../movie/insert.do',
		data:{
			title:title,
			tname:tname,
			rdate:rdate,
			rtime:rtime,
			inwon:inwon,
			price:price
		},
		success:function(response) {
			alert("예매 신청이 완료됐습니다.");
			location.href="../movie/mypage.do"
		}
	});
}

</script>
</head>
<body>
	 <div class="hero-wrap hero-bread" style="background-image: url('../main/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread" class="jua">예약하기</h1>
          </div>
        </div>
      </div>
    </div>
    
    
    
<div class="container">
	<div class="row">
		<table class="table">
			<tr>
				<td class="col-sm-6" >	<!-- style="background-color: red"  style="padding-top: 40px;"-->
					<table class="table-hover" >
						<tr class="recipe">
							<td class="text-center" width="500">
             					<div>레시피 선택&nbsp;<span id=select1></span> </div>
         					</td>
         				</tr>
						<tr class="area">
				         	<td class="text-center info">
								<div>지역선택&nbsp;<span id=select2></span>  </div>
				        	</td>
        				</tr>
        
       					<tr class="cheif">
        					<td class="text-center info">
           						<div>요리사 선택&nbsp;<span id=select3></span></div>
           						<div id="date"></div>
           					<td>
     					</tr>
       
     					<tr class="datetime">
	       					<td class="text-center info">
	           					<div>날짜&시간선택&nbsp;<span id=select4></span></div>
	           				</td>
       					</tr>   
   	
   						<tr class="costomprice">
   							<td class="text-center info">
            					<div>예약 금액 제시&nbsp;<span id=select5></span></div>
								<div id="time">
								</div>
							</td>
        				</tr>
        
        				<tr class="command"><!-- style="background-color: green" -->
        					<td class="text-center info">
								<div>요청사항&nbsp;<span id=select6></span></div>
           						<div id="inwon"></div>
           					</td>
     					</tr>
     					<tr class="final">
     						<td>
     							<div class="btn btn-info">예약 확인</div>	
     						</td>
     					</tr>
    				</table> 
    				
     			</td>
     		

<!--  -->
		
				<td rowspan="2" class="col-sm-6" id="print">
				
			<!-- 	<img src="../main/images/1__test.jpg" width="500"> -->
					<!-- <div class="container" id=result >
						<table>
							<tr>
								<td>
									 <div id="print" width="500"></div>   <img src="../main/images/1__test.jpg" width="500"> 
								</td>
							</tr>
						</table>
					</div>	 -->

			</td>
		</tr>
</table>
	</div>
</div>
</body>
</html>