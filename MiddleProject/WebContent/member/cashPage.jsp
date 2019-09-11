<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐시충전</title>

<!-- <style type="text/css">
.vr { 
    display: block;
    width:1px;
    height: 100px;
    background-color:#000;

}
</style> -->

</head>

<body>
   <div class="hero-wrap hero-bread"
      style="background-image: url('../main/images/bg_1.jpg');"></div>

   <section class="ftco-section">
   <div class="container" >
      <div class="row justify-content-center" >
         <div class="col-xl-7 ftco-animate" >
            <form id="cash_frm" name="chargeInfo" method="post"
               action="cashPage_ok.do" class="Cash" onsubmit="return validate();">
               <h3 class="mb-4 billing-heading">캐시 충전</h3>
               <p style="border-bottom: solid">
               <div style="border: 1px solid #444444; background-color:white; height: 600px;">

                  <div style="margin: 20px; border: 1px solid gray; height: 100px; bottom: 10px; background-color: #e0e9fc">
                     <div class="col-md-10">
                        <div style="position: relative; bottom: -33px; right: -20px; font-size: 22px; color: #5277c5">충전금액
                     </div>
                        <div id="charge" name="charge" style="position: relative; bottom: -28px; right: -120px; margin-bottom: -25px;margin-top: -30px; color: red; font-size: 18px;">
                        0</div><div style="position: relative; right: -175px; bottom: -23px; color: black;">원</div>
                        <div style="position: relative; bottom:10px; right: -350px; color: #5277c5;font-size: 22px;" >보유금액:</div><div style="position: relative; bottom:50px; right: -470px; color: black;font-size: 20px;"> ${sessionScope.pay}원</div>
                        
                     </div>
                  </div>	

                  <div style="margin: 20px 20px -10px 20px; color: #5277c5;font-size: 18px; ">충전금액선택</div>
                  <hr>

                  <div class="col-md-10">

                     <div style="margin: 20px 20px -10px 20px;">
                        <input type="radio" name="selectCash" value="1000">1000원
                     </div>
                     <div
                        style="margin: 20px 20px -10px 20px; position: relative; right: -130px; top: -36px;">
                        <input type="radio" name="selectCash" value="5000">5000원
                     </div>
                     <div
                        style="margin: 20px 20px -10px 20px; position: relative; right: -270px; top: -73px;">
                        <input type="radio" name="selectCash" value="10000">10000원
                     </div>
                     <div style="margin: -50px 20px -10px 20px;">
                        <input type="radio" name="selectCash" value="직접입력">직접입력   <input
                           type="text" id="money" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" readonly="readonly" style="width: 100px;">원
                     </div>

                  </div>
                  <div style="margin: 50px 20px -10px 20px; color: #5277c5; font-size: 18px;">결제수단선택</div>
                  <hr style="margin-bottom: 20px;">




                  <div style="margin: 20px 20px -10px 20px;">
                     <input name="paymentMethod" type="radio">무통장 입금 <input
                        name="paymentMethod" type="radio" style="margin-left: 20px;">쿠폰등록
                  </div>
				  
				  
                  <div class="col-md-10"
                     style="position: relative; bottom: -130px; right: -200px; ">
                     <input type="submit" value="충전하기" style="width: 100px; height: 35px; border-color: #527eee;background-color: #5e8afb; color: white;"> 
                     <a href="../mypage/mypageMain.do"><input type="button"
                        value="취소하기" style="background-color: #5e8afb; color: white; width: 100px; height: 35px; border-color: #527eee"></a>
                  </div> 


               </div>
            </form>
         </div>
	

      </div>


   </div>
   </section>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
   $(function(){
      $('input:radio[name="selectCash"]').change(function() {
         $('#money').val("");
         if ($(this).val() == "직접입력") {
            $('#money').attr("readonly", false);
         } else {
            $('#money').attr("readonly", true);
            $('#charge').text($(this).val());
         }
      });
      
      $('#money').keyup(function(){
         $('#charge').text($('#money').val());
      });
      

   });
</script>
</html>