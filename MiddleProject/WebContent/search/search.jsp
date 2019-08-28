<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.ingrelist').click(function(){
		var ingreposter=$(this).attr("data-poster");
		var ingrename=$(this).attr("data-name");
		var ingreno=$(this).attr("data-no");
		$('#ingreposter').attr("src",ingreposter);
		$('#ingrename').text(ingrename);
		
		$.ajax({
			type:'post',
			url:'../search/searchlist.do',
			data:{ino:ingreno},
			success:function(response)
			{
				//alert(response); html 읽는거 확인
				$('#searchlist').html(response);
			}
		});
	});
});
</script>
</head>
<body>
<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6 d-flex align-items-center">
          <img src="../main/images/logo.png">
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
         <table class="table table-hover">
             <c:forEach var="vo" items="${list }">
               <tr class="ingrelist" data-name="${vo.ingrename }" data-no="${vo.ingreno }">
                <td class="text-center"><img src="${vo.ingreposter }" width=30 height=30></td>
                <td class="text-left">${vo.ingrename }</td>
               </tr>
               </c:forEach>
           </table>
           <table class="table">
             <tr>
              <td class="text-center success">searchlist</td>
             </tr>
           </table>
           <div id="searchlist"></div>
         
</body>
</html>
    
 