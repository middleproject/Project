<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('.recipeSelect').click(function(){
			var no=$(this).attr("title");
			$.ajax({
				type:'post',
				url:'../reserve/recipeSelect.do',
				data:{no:no},
				success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
					$('#select1').html(response);
				}
			});
		});
		$('.btn').click(function(){
			var page=$(this).attr('name');
			var key=$('.pageBtn').attr('title');
			
			$.ajax({
				type:'post',
				url:'../reserve/search2.do',
				data:{page:page,key:key},
				success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
					$('#result').html(response);
				}
			});
		}); 
		
	/* $('#search').click(function(){
		var key = $('#key').val();
		$("#searchbox").hide();
		$.ajax({
			type:'post',
			url:'../reserve/search2.do',
			data:{key:key},
			success:function(response){ // 정상수행 시 수행할 내용 => response가 실행된 내용을 가져옴
				$('#result').html(response);
			}
		});
	}); */

});
</script>
</head>
<body>
<div class="row">
         
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="">
			            <div class="blog-entry align-self-stretch d-md-flex">
			              <a href="../reserve/search.do?no=&page=${curpage}" class="block-20" style="background-image: url('${vo.poster}');">
			              </a>
			              <div class="text d-block pl-md-4">
			              	<div class="meta mb-3">
			                  <div><a href="#">${vo.regdate }</a></div>
			                  <div><a href="#">${vo.made }</a></div>
			                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>${vo.hit }</a></div>
			                </div>
			                <h3 class="heading"><a href="#">${vo.summary }</a></h3>
			                <p>${vo.summary_in}</p>
			               
			                <p><div title="${vo.no}" class="btn btn-primary py-2 px-3 recipeSelect">예약하기</div></p>
			              </div>
			            </div>
		          	</div>
		          </c:forEach>
                </div>
                </div>

            
            
            <!--  -->
            
           
         
        
         <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27 pageBtn" title="${key }">
              <ul>
              	<c:if test="${curpage>BLOCK}">
                	<li>
                		<a id="start" class=btn name="${startpage-1 }">&lt;</a>
                	</li>
                </c:if>
                
                <c:forEach var="i" begin="${startpage}" end="${endpage }" step="1">
	                	<li class="${i==curpage?"active":"" }"><a class=btn name="${i}">${i }</a></li>       
                </c:forEach>
                <c:if test="${endpage<allpage }">
                	<li><a id="end" class=btn name="${endpage+1 }">&gt;</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
</body>
</html>