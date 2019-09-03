<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>	
	
      <div class="ftco-section contact-section bg-light">
      <div class="container">
      	<div class="row d-flex mb-5 contact-info">
          
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
          <div class="col-md-3 d-flex">
          	
          </div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 order-md-last d-flex">
            <form method="post" action="../recipe/send.do" class="bg-white p-5 contact-form">
              <div class="form-group">
                <input type="text" class="" placeholder="Send Id" name="id">
                <input type="button" class="btn btn-sm btn-primary py-2 px-3" value="아이디 찾기">
              </div>
              <div class="form-group">
                <input type="text" class="" placeholder="Subject" name="sub">
              </div>
              <div class="form-group">
                <textarea name="content" cols="50" rows="10" class="" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
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