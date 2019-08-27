<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  font-family: 'Open Sans', sans-serif;
  overflow-y: scroll;
}

#output {
  min-height: 43px;
  padding: 10px;
  background-color: rgba(255, 255, 0, 0.14);
}

.form-control {
  padding-right: 27px;
}

.set-changers {
  margin: 20px 0;
}

h4 {
  line-height: 25px;
  font-weight: bold;
  color: #0c9;
}

.demo-info {
  display: inline-block;
  position: absolute;
  top: -12px;
  right: -13px;
}
</style>
</head>
<body>
<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="...search">
                <input type="submit" value="Search" class="submit px-3">
                
             </div>
            </form>
          </div>
        </div>
      </div>
    </section>
<link href='https://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

<div class="container">
  <div class="row">
    <div class="col-md-8 col-md-push-3 col-xs-12">
      
      
        <div>
          <a class="btn btn-default change-emoji-type" data-emoji-type="재료별" href="#재료별">재료별</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="전체" href="#전체">전체</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="육류" href="#육류">육류</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="채소류" href="#채소류">채소류</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="해물류" href="#해물류">해물류</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="가공식품류" href="#가공식품류">가공식품류</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="과일류" href="#과일류">과일류</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="곡류" href="#곡류">곡류</a>
        </div>
      </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-5 col-md-push-3 col-xs-12">
      
      
        <div>
          <input type="checkbox" class="btn btn-default change-emoji-type" data-emoji-type="난이도별" href="#난이도별">난이도별</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="전체" href="#전체">전체</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="아무나" href="#아무나">아무나</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="초급" href="#초급">초급</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="중급" href="#중급">중급</a>
        </div>
      </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-md-7 col-md-push-3 col-xs-12">
        <div>
          <a class="btn btn-default change-emoji-type" data-emoji-type="시간별" href="#시간별">시간별</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="전체" href="#전체">전체</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="10분이내" href="#10분이내">10분이내</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="20분이내" href="#20분이내">20분이내</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="30분이내" href="#30분이내">30분이내</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="60분이내" href="#60분이내">60분이내</a>
          <a class="btn btn-default change-emoji-type" data-emoji-type="2시간이상" href="#2시간이상">2시간이상</a>
        </div>
      </div>
  </div>
</div>

<input type="checkbox" id="brnd-${brnd.no }" name="brand" value="${brnd.no }" />
                                 <label for="brnd-${brnd.no }">&nbsp;&nbsp;${brnd.name }&nbsp;&nbsp;</label>
</div>
</body>
</html>
    
 