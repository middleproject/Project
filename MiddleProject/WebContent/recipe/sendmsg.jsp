<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.boder{
font-size:20px; 

color: white; 
border-style: solid;
border-color: olive;
margin-left:275px;
width: 528px;
text-align: center;
background-color: #E6B104;
border-bottom-style: none;
}
</style>
<style type="text/css">
.batag{
width: 550px;
background-color: #FED757;
color: white; 
border-style: solid;
border-color: olive;
text-align: center;

}
</style>


<style type="text/css">
.btn2{
width: 100px;
margin-top: 20px;
position: relative;

top: 8px;

}
</style>



</head>
<body>	
	
      <div class="ftco-section contact-section bg-light">
      <div class="container ">
      	<div class="row d-flex mb-5 contact-info " >
          
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
        
        </div>
         	<div class="boder"> 쪽지 전송
         	</div>
         	
         
         	
         	
        <div class="row block-9 ">
          <div class="col-md-6 order-md-last d-flex">
            <form method="post" action="../recipe/send.do" class="batag">
              <div class="form-group ">
                <input type="text" class="" placeholder="받는사람" name="id" 
                style="position:	relative; bottom: -10px; Left: -60px">
                <input type="button" class="btn2" value="아이디 찾기"
                style="background-color: white; color: black; position:	relative;  Left: -50px">
              </div>
              <div class="form-group">
                <input type="text" class="" placeholder="제목" name="sub" style="position:relative; left: -58px; width: 310px;">
              </div>
              <div class="form-group">
                <textarea name="content" cols="50" rows="10" class="" placeholder="내용"
                
                ></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="쪽지보내기" class="btn2" style="margin-bottom: 20px; margin-top: -20px; background-color: white;">
              </div>
            </form>
          
          </div>

          <div class="col-md-3 d-flex">
          </div>
        </div>
      </div>
    </div>
    
</body>
</html>