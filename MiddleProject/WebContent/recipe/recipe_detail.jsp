<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var i=0;
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
	
	
	
	$('#myBtn').click(function(){
		var no=$(this).attr("title");
			
			$.ajax({
				type:'post',
				url:'../recipe/popupmart.do',
				data:{no:no},
				success:function(response){
					$('.modal-content').html(response);
				}
			});
	})
	$('#following').click(function(){
		var id = $('#following').attr("data-id");
		var follow = $('div.desc > h3').text();
		if(id==null){
			alert("로그인 후 이용해주세요");
			return;
		}
		$.ajax({
			type:'post',
			url:'../recipe/follow_ok.do',
			data:{id:id,follow:follow},
			success:function(res)
			{
				window.location.reload()
				alert(follow+"님을 팔로우하였습니다.");
			}
		});
	});
	$('#follow').click(function(){
		var id = $('#follow').attr("data-unid");
		var follow = $('div.desc > h3').text();
		if(id==null){
			alert("로그인 후 이용해주세요");
			return;
		}
		$.ajax({
			type:'post',
			url:'../recipe/unfollow.do',
			data:{id:id,follow:follow},
			success:function(res)
			{
				window.location.reload()
				alert("팔로우가 취소 되었습니다.");
			}
		});
	});
	$('#nojjim').click(function(){
		var id = $('#nojjim').attr("data-nojjim");
		var recipeno = $('#number').attr("data-no");
		if(id==null){
			alert("로그인 후 이용해주세요");
			return;
		}
		$.ajax({
			type:'post',
			url:'../recipe/wish.do',
			data:{id:id,recipeno:recipeno},
			success:function(res)
			{
				window.location.reload()
				alert("찜 목록에 추가되었습니다.");
			}
		});
	});
	$('#jjim').click(function(){
		var id = $('#jjim').attr("data-jjim");
		var recipeno = $('#number').attr("data-no");
		$.ajax({
			type:'post',
			url:'../recipe/unwish.do',
			data:{id:id,recipeno:recipeno},
			success:function(res)
			{
				window.location.reload()
				alert("찜 목록에서 삭제되었습니다.");
			}
		});
	});
	$('.remove').click(function(){
		var msgno = $('#hidden').attr("data-no");
		alert(msgno);
		$.ajax({
			type:'post',
			url:'../recipe/recipeDelete.do',
			data:{msgno:msgno},
			success:function(res)
			{
				window.location.reload();
			}
		});
	});
	var u = 0;
	   $('.updateBtn').click(function(){
	      var no=$(this).attr("value");
	      $('.update').hide();
	      if(u==0) {
	         $('#u'+no).show();
	         u=1;
	      } else {
	         $('#u'+no).hide();
	         u=0;
	      }

		});
});
</script>
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
            margin: 15% auto; /* 15% from the top and centered */
            padding: 10px;
            border: 1px solid #888;
            width: 90%; /* Could be more or less, depending on screen size */                          
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

.table {
    FONT-WEIGHT: 500;
    min-width: 500px !important;
    width: 100%;
    text-align: center;
}
.chat-bubble {
    background-color: #ededed;
    border: 2px solid #666;
    font-size: 35px;
    line-height: 1.3em;
    margin: 10px auto;
    padding: 10px;
    position: relative;
    text-align: center;
    width: 730px;
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    -moz-box-shadow: 0 0 5px #888;
    -webkit-box-shadow: 0 0 5px #888;
    font-family: 'Bangers', arial, serif; 
}
.chat-bubble-arrow-border {
    border-color: #666 transparent transparent transparent;
    border-style: solid;
    border-width: 20px;
    height: 0;
    width: 0;
    position: absolute;
    bottom: -42px;
    left: 30px;
}
.chat-bubble-arrow {
    border-color: #ededed transparent transparent transparent;
    border-style: solid;
    border-width: 20px;
    height: 0;
    width: 0;
    position: absolute;
    bottom: -39px;
    left: 30px;
}
.text-box {
    position: relative;
    float: right;
    right: 0px;
    top: 100px;
    padding: 10px 25px;
    width: 45%;
    background-color: rgba(255, 255, 255, 0.85);
    border-radius: 8px;
    font-size: 1rem;
    line-height: 1.5rem;
}
.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 35px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}
.table tbody tr td {
    text-align: center !important;
    vertical-align: middle;
    padding: 10px 10px;
    border: 1px solid transparent !important;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05) !important;
}

</style>

<meta charset="UTF-8">
</head>
<body>


	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<table class="table">
						<div class="chat-bubble">
							${vo.summary }
						        <div class="chat-bubble-arrow-border"></div>
						        <div class="chat-bubble-arrow"></div>
						        </div><br>
						        <p>
						<img src="${vo.poster }" alt="" style="width:900px" class="img-fluid">
						</p>
				            <h2>${vo.summary_in }</h2>
				            
				    
				    	<tr>
				    		<td><img src="../recipe/multiple-users-silhouette.png"><br>${info[0] }</td>
				    		<td><img src="../recipe/alarm-clock.png"><br>${info[1] }</td>
						    <td><img src="../recipe/star.png"><br>${info[2] }</td> 
					    <tr>
					
						</table>
						
					<!-- 재료 테이블 -->
							<!-- <div class="col-lg-9 ftco-animate">	 -->
							<div class="btn btn-info" id="myBtn" title="${vo.no }">가격비교</div>
					
					
				
						
						<h2 class="text-left">재 료! <font size="4pt;" color="gray"><EM>Ingredients</EM></font></h2>
							<table class="table">
										  <tr>
										  <c:forEach var="ingredetail" items="${ilist }" varStatus="s">
										    <c:if test="${count/2<=s.index}">
										    <th>${ingredetail }</th>
										    </c:if>
										    </c:forEach>
										  </tr>	 
										<tr>
										  <c:forEach var="ingredetail" items="${ilist }" varStatus="s">
										    <c:if test="${count/2>s.index }">
										    <th>${ingredetail }</th>
										    </c:if>
										    </c:forEach>
										  </tr>
								</table>		
					<!-- 조리 순서 테이블 -->
					<table class="table">
						<h2 class="text-left">조리 순서! <font size="4pt;" color="gray"><EM>step</EM></font></h2>
						<div class="row">
							<div class="col-lg-8 ftco-animate">
								<c:forEach var="poster" items="${step_poster }" varStatus="s">
									<tr>
										<td><h4 class="text-left">${step[s.index]}</h4></td>
											<td><img src="${poster }" style="height:350px;width:350px;"></td>
									</tr>
								</c:forEach>
							</div>
						</div>
					</table>
					<c:if test="${complete!=null }">
						 <div class="text-center">
						 <h2 class="text-center">완료! <font size="4pt;" color="gray"><EM>complete!</EM></font></h2>
							<img src="${complete }" style="width:720px;height=400px;">
						 </div>
					</c:if>
 					
 				
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
						<c:forEach var="tag" items="${tagStr }">
			                <a href="../recipe/recipe_list.do?tag=${fn:substring(tag,1,fn:length(tag)) }" class="tag-cloud-link">${tag }</a>
			                </c:forEach>
						</div>
					</div>
					<!-- 팔로우 처리 -->
					<c:if test="${folloCount==0 }">
						<a href="#"><img alt="" src="following.png" id="following" data-id=${sessionScope.id }></a>
					</c:if>
					<c:if test="${folloCount!=0 }" >
						<a href="#"><img alt="" src="follow.png" id="follow" data-unid=${sessionScope.id }></a>
					</c:if>
					<!-- wish 처리 -->
					<c:if test="${wishCount==0 }">
						<a href="#"><img alt="" src="nojjim.png" id="nojjim" data-nojjim=${sessionScope.id }></a>
					</c:if>
					<c:if test="${wishCount!=0 }">
						<a href="#"><img alt="" src="jjim.png" id="jjim" data-jjim=${sessionScope.id }></a>
					</c:if>
					<c:if test="${sessionScope.id==vo.made }">
						<a href="#" class="btn btn-sm btn-primary remove" data-no="${vo.no }">삭제</a>
					</c:if>
					<input type="hidden" id="number" data-no=${vo.no }>
					
					<div class="about-author d-flex p-4 bg-light">
						<div class="bio align-self-md-center mr-4">
							<img src="${vo.image }" style="height:200px;width:200px;" alt="Image placeholder"
								class="img-fluid mb-4">
						</div>
						<div class="desc align-self-md-center">
							<h3>${vo.made}</h3>
							<p>${vo.tip }</p>
						</div>
					</div>
					
					
				</div>
				    <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon ion-ios-search"></span>
                  <input type="text" class="form-control" placeholder="Search...">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 class="heading">Categories</h3>
              <ul class="categories">
                <li><a href="#">Vegetables <span>(12)</span></a></li>
                <li><a href="#">Fruits <span>(22)</span></a></li>
                <li><a href="#">Juice <span>(37)</span></a></li>
                <li><a href="#">Dries <span>(42)</span></a></li>
              </ul>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Related Recipe</h3>
              <c:forEach var="hvo" items="${list }">
              <c:if test="${vo.no!=hvo.no }">
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(${hvo.poster});"></a>
	                <div class="text">
	                  <h3 class="heading-1"><a href="../recipe/recipe_detail.do?no=${hvo.no }">${hvo.summary }</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> ${hvo.regdate }</a></div>
	                    <div><a href="#"><span class="icon-person"></span> ${hvo.made }</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> ${hvo.hit }</a></div>
	                  </div>
	                </div>
	              </div>
              </c:if>
              </c:forEach>
              </div>
            

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Tag Cloud</h3>
              <div class="tagcloud">
              		<a href="../recipe/recipe_list.do?&tag=고기" class="tag-cloud-link">고기</a>
	                <a href="../recipe/recipe_list.do?&tag=혼밥" class="tag-cloud-link">혼밥</a>
	                <a href="../recipe/recipe_list.do?&tag=간단" class="tag-cloud-link">간단</a>
	                <a href="../recipe/recipe_list.do?&tag=라면" class="tag-cloud-link">라면</a>
	                <a href="../recipe/recipe_list.do?&tag=안주" class="tag-cloud-link">안주</a>
	                <a href="../recipe/recipe_list.do?&tag=마라" class="tag-cloud-link">마라</a>
	                <a href="../recipe/recipe_list.do?&tag=에어프라이" class="tag-cloud-link">에어프라이</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
			</div>
			
		</div>
	</section>
	
		<!-- 댓글Start -->
	<div class="container">
      <table class="table">
            <tr>
            <c:forEach var="rvo" items="${replylist }">
               <table class="table">
                  <!-- ♥홍길동 2019년 09월 01일 15시 50분 34초 -->
                  <tr>
                     <th class="text-left" >
                        <font color="red">♥</font><font color="grey"><b>${rvo.name }</b></font>님<font color="red">♥</font>
                        &nbsp;${rvo.dbday } 작성
                     </th>
                     <th class="text-right">               
                           <c:if test="${sessionScope.id==rvo.id }"><!-- 본인일 경우만 수정과 삭제 가능 -->
                              <a href="#" class="btn btn-xs btn-primary updateBtn" value="${rvo.no }">수정</a>         
                              <a href="../recipe/reply_delete.do?no=${rvo.no }&bno=${vo.no}" class="btn btn-xs btn-danger">삭제</a>            
                           </c:if>   
                        </th>
                  </tr>
                  <tr>
                     <th class="text-left"" colspan="2">${rvo.msg }</th>
                  </tr>
                  <tr style="display:none" id="u${rvo.no }" class="update">
                     <th class="text-left" colspan="2">
                        <form name="frm" method="post" action="../recipe/reply_update.do">
                           <textarea rows="3" cols="90" name="msg" style="float:left">${rvo.msg }</textarea>
                           <input type="hidden" name="bno" value="${vo.no }" >
                           <input type="hidden" name="no" value="${rvo.no }">
                           <input type="submit" value="수정하기" class="btn btn-sm btn-primary" style="height:65px">
                        </form>
                     </th>
                  </tr>
               </table>   
            </c:forEach>
            </tr>
      </table>    
	
		<!-- 로그인한 사람만 댓글달기 허용 -->
		 <c:if test="${sessionScope.id!=null }">
		<table class="table">
			<tr>
				<th class="text-left">
				<form name="frm" method="post" action="../recipe/reply_insert.do">
					<textarea rows="3" cols="100" name="msg" style="float:left"></textarea>
					<input type="hidden" name="bno" value="${vo.no }" ><!--  vo = 게시물번호 -->
					<input type="hidden" name="id" id="id" value="${sessionScope.id }">
					<input type="submit" value="댓글쓰기" class="btn btn-sm btn-primary" style="height:80px">
				</form>
				</th>
			</tr>
		</table>
		 </c:if> 
	</div>

	<!-- 댓글End -->
	
 
      <!-- Modal content -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
    <div class="modal-content">
    <span class="close">&times;</span>                                                               
    </div>
 
    </div>
</body>
</html>