<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피등록</title>

<style type="text/css">
hr {
   width: 100%;
   border-top-width: 5px;
   padding-bottom: 20px;
   border-color: teal;
   border-left: 5px;
}
</style>



</head>
<body>
   <div class="hero-wrap hero-bread"
      style="background-image: url('../main/images/bg_1.jpg');"></div>

   <section class="ftco-section">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-xl-9 ftco-animate">
            <form method="post" name="fileForm" action="../recipe/recipeUpload.do"
               class="signUp" enctype="multipart/form-data">
               <h3 class="mb-4 billing-heading">레시피 등록</h3>
               <hr>
               <div class="row align-items-end">


                  <div class="col-md-12">
                     <div class="form-group">

                        <label>레시피 제목 </label> <input type="text" name="summary"
                           style="margin-left: 100px;">
                     </div>
                  </div>
                  <div class="col-md-10">
                     <label style="margin-right: 95px;">사진 올리기</label> <input
                        type='file' id="imgInput" /> <img id="image_section" width=300
                        height=300
                        style="position: relative; right: -195px; top: 25px; margin-bottom: 30px;">
                  </div>
               </div>

               <div class="col-md-12">
                  <div class="form-group">
                     <label style="position: relative; top: -80px;">요리 소개 </label>
                     <textarea name="summary_in"
                        style="margin-left: 115px; width: 250px; height: 100px">
                        </textarea>
                  </div>
               </div>

               <div class="col-md-10">
                  <div class="form-group">
                     <label style="margin-right: 115px;">요리정보</label> <select>
                        <option>인원</option>
                        <option name=info1>1~2인분</option>
                        <option name=info1>3~4인분</option>
                        <option name=info1>5인분 이상</option>
                     </select> <select>
                        <option>시간</option>
                        <option name=info2>10~30분</option>
                        <option name=info2>30~60분</option>
                        <option name=info2>1시간</option>
                     </select> <select>
                        <option>난이도</option>
                        <option name=info3>초급</option>
                        <option name=info3>중급</option>
                        <option name=info3>고급</option>
                     </select>
                  </div>
               </div>



               <hr>

               <input type="text" name="textbox1" placeholder="재료"
                  style="background-color: yellow; width: 150px;">
               <div class="col-md-8">
                  <input type="text" class="ingre1" placeholder="예)돼지고기"
                     style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
               </div>
               <div class="col-md-8">
                  <input type="text" name="ingre2" placeholder="예)양배추"
                     style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
               </div>
               <div class="col-md-8">
                  <input type="text" name="ingre3" placeholder="예)참기름"
                     style="position: relative; left: 220px; top: -34px; margin-bottom: 10px;">
               </div>

               <input type="button" value="추가"
                  style="position: relative; left: 500px; bottom: 165px;"
                  onclick="add();">
               <div id="textdiv"></div>
               <hr>

               <label style="position: relative; top: -100px;">요리 과정</label>

            

               <input type='file' id="imgInput2" style="position: relative; left: -50px; top: -50px;" /> <img
                  name="step_poster" id="image_section2" width="300" height=300; style="position: relative; left: -350px; bottom: -150px; " >
                     
                     <textarea
                  style="position: relative; left: 0px; top:-20px; width: 400px; height: 150px; margin-top: 200px;"
                  placeholder="예)라면을 끓일떄 물을 3분간 끓이고 스프넣고 후레이크넣고 면을 넣습니다."
                  name="step"></textarea>
               <hr>


               <label>요리 팁</label>
               <div class="col-md-8">
                  <textarea
                     style="position: relative; left: 160px; top: -34px; width: 400px; height: 150px;"
                     placeholder="예)고기에는 소금보다 설탕을 먼저넣어야 단맛이 겉돌지 않고 육질이 부드러워요"
                     name="tip"></textarea>

               </div>
               <hr>
               <label>요리완성 사진</label>
               <div class="col-md-8">
                  <input type='file' id="imgInput3" style="position: relative; left: -20px; bottom:-10px; margin-bottom: 50px;" /> <img
                  name="complete" id="image_section3" width="300" height=300 />

               </div>

               <hr>
               <label>태그</label>
               <div class="col-md-8">
                  <input type="text" name="tag"
                     style="position: relative; left: 220px; top: -34px;" name="tag">
               </div>

               <hr>




               <div class="col-md-10">
                  <div class="form-group">
                     <input type="submit" class=" btn-success btn-lg" value="등록하기"
                        style="margin-right: 100px; margin-left: 200px;"> <input
                        type="button" value="취소하기" class=" btn-warning btn-lg"
                        onClick="self.location='mypageMain.do';">

                  </div>
               </div>
            </form>
         </div>
      </div>

   </div>
   </section>

   <!-- END -->
   <!-- 재료추가 -->
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript">
      var num = 4;
      function add() {
         if(num==7){
            alert("7개 까지 입력가능합니다.");
            return;
         }
         $("#textdiv")
               .append(
                     "<br>"
                           + "<input type='text'  name='ingre"+num+"' style='position: relative; left: 235px; top:-90px; margin-bottom: 10px; '/>");
         num++;
         
      }
   </script>
   <!--  사진첨부 -->
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript">
      function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
               $('#image_section').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
         }
      }

      $("#imgInput").change(function() {
         readURL(this);
      });
   </script>

   <!-- 요리과정 사진첨부 -->
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript">
      function readURL2(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
               $('#image_section2').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
         }
      }

      $("#imgInput2").change(function() {
         readURL2(this);
      });
   </script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
   <script type="text/javascript">
      function readURL3(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
               $('#image_section3').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
         }
      }

      $("#imgInput3").change(function() {
         readURL3(this);
      });
   </script>


</body>
</html>