<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.row {
		margin: 0px auto;
		width: 900px;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.btn-warning').click(function() {
		var name=$('#name').val();
		if(name.trim()=="") {
			$('#name').focus();
			return;
		}
		var subject=$('#sub').val();
		if(subject.trim()=="") {
			$('#sub').focus();
			return;
		}
		var content=$('#cont').val();
		if(content.trim()=="") {
			$('#cont').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="") {
			$('#pwd').focus();
			return;
		}
		var no=$('#no').val();
		
		$.ajax({
			type:'POST',
			url:'../bQnA/qboard_update_ok.do',
			data:{
				boardno:no,
				memberid:name,
				subject:subject,
				content:content,
				pwd:pwd}, /* {변수명,키:값}  항시!! 데이터가 json으로 돼있음 그리고 키랑 BoardModel에서의 값과 같아야함*/
			
			success:function(response){ // board_update_ok.jsp 에서 받은 no 변수값 가져오기
				var i = response.trim();

				if(i==0) {
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("");
					$('#pwd').focus();
				} else {
					location.href="../bQnA/qboard_list.do?no="+i;
				}
			}
		});
	});
});

</script>
</head>
<body>
<div class="container">
		<h2 class="text-center">수정하기</h2>
		<div class="row">
		<form method="post" action="qboard_update_ok.do"> 
			<table class="table">
				<tr>
					<th class="text-right warning" width="20%">이름</th>
					<th width="80%" class="text-left">
						<input type="text" name="name" size="15" class="input-sm" value="${vo.memberid }" id="name">
						
						<!-- 수정이나 삭제는 꼭 hidden 들어가야 함!!! -->
						<input type="hidden" name="no" value="${vo.boardno }" id="no">
						
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">제목</th>
					<th width="80%" class="text-left">
						<input type="text" name="subject" size="45" class="input-sm" value="${vo.subject }" id="sub">
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">내용</th>
					<th width="80%" class="text-left">
						<textarea rows="10" cols="55" name="content" id="cont">${vo.content }</textarea>
					</th>
				</tr>
				<tr>
					<th class="text-right warning" width="20%">비밀번호</th>
					<th width="80%" class="text-left">
						<input type="password" name="pwd" size="10" class="input-sm" id="pwd">
					</th>
				</tr>
				<tr>
					<th colspan="2" class="text-center">
						<input type="button" value="수정" class="btn btn-sm btn-warning" >  
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"> 
					</th>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>