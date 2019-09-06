<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	 // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];                                          

    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
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
		
		var poster=$('#select1_hi').attr("title");
		var no=$('#select1_').attr("title");
		var title=$('#select1_').text();
		
		var id=$('#select3_').attr("title");
		var name=$('#select3_').text();
		
		var time=$('#select4_').attr("title");
		var date=$('#select4_').text();
		
		var price=$('#select5_').attr("title");
		
		var msg=$('#select6_').attr("title");
		
		
		$.ajax({
			type:'post',
			url:'../reserve/final.do',
			data:{poster:poster,no:no,title:title,id:id,name:name,time:time,date:date,price:price,msg:msg},
			success:function(response){
				$('.modal-content').html(response);
			}
		});


	});
	
});
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
     							<div class="btn btn-info" id="myBtn">예약 확인</div>	
     							
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
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
    <div class="modal-content">
    <span class="close">&times;</span>                                                               
    
    <!-- <form action="../reserve/final.do" method="post">
	<table class="table" style="width: 550px;" >
		
		
		<tr>
			<td colspan="2"><img id="fimg" src="" width=500px height="500px"></td>
		</tr> 
		<tr>
			<td class="text-left">레시피 번호 :</td>
			<td class="text-left" id="frecipeno">
			<input type="hidden" id="hrecipeno" name="no" value="">
			</td>
			
		</tr>
		<tr>
			<td class="text-left">레시피 제목 :</td>
			<td class="text-left" id="frecipetitle">
			<input type="hidden" id="hrecipetitle" name="title" value="">
			</td>
		</tr>
		<tr>
			<td class="text-left">요리사(id) :</td>
			<td class="text-left" id="fcheif" title="">
			<input type="hidden" id="hcheif" name=id value="">
			</td>
		</tr>
		<tr>
			<td class="text-left">날짜(시간대) :</td>
			<td class="text-left" id="fdate" title="">
			<input type="hidden" id="hdate" name="date" value="">
			<input type="hidden" id="htime" name="time" value="">
			</td>
		</tr>
		<tr>
			<td class="text-left">제시된 가격 :</td>
			<td class="text-left" id="fprice">
			<input type="hidden" id="hprice" name="price" value="">
			</td>
		</tr>
		<tr>
			<td class="text-left">요청사항 :</td>
			<td class="text-left" id="fcommand">
			<input type="hidden" id="hcommand" name="command" value="">
			</td>
		</tr>
	</table>
	<center><input type="submit" class="btn btn-info"></center>
	</form> -->
      </div>
 
    </div>
</body>
</html>