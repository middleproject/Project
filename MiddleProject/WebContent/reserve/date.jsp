<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

	$('#monthSel').change(function(){
		var strYear=document.getElementById("yearSel").value;
		var strMonth=document.getElementById("monthSel").value;
		var id=$('#select3_').attr("title");
		
		$.ajax({
			type:'post',
			url:'../reserve/date.do',
			data:{strYear:strYear,strMonth:strMonth,id:id},
			success:function(response) {
				$('#print').html(response);
			}
		})
	});
	
	$('.dates').click(function(){ // 녹색 버튼 (class=dates)을 클릭했을 때
		var year=$(this).attr("data-year");
		var month=$(this).attr("data-month");
		var day=$(this).text();
		var id=$('#select3_').attr("title");
		
		//$('#reserve_day').text(data); // reserve.jsp에서 출력
		
		// ajax로 time출력
		$.ajax({
			type:'post',
			url:'../reserve/time.do',
			data:{year:year,month:month,day:day,id:id},
			success:function(response) {
				$('#print').html(response);
			}
		})
	})
});
</script>
</head>
<body>
 <table style="width: 550px;">
       <caption class="text-center">${year }년 ${month }월</caption>
        <tr>
          <td>
            <form method="post" action="diary.do">
	            <select name="year" class="input-sm" id="yearSel">
	              <c:forEach var="i" begin="2019" end="2025">
	               <option ${i==year?"selected":"" }>${i}</option>
	              </c:forEach>
	            </select>년도&nbsp;&nbsp;
	            <select name="month" class="input-sm" id="monthSel">
	              <c:forEach var="i" begin="1" end="12">
	               <option ${i==month?"selected":"" }>${i}</option>
	              </c:forEach>
	            </select>월
            </form>
          </td>
        </tr>
       </table>
       <table>
        <tr class="success">
          <c:set var="color" value="black"/>
          <c:forEach var="sw" items="${strWeek }" varStatus="s">
            <c:choose>
              <c:when test="${s.index==0 }">
                <c:set var="color" value="red"/>
              </c:when>
              <c:when test="${s.index==6 }">
                <c:set var="color" value="blue"/>
              </c:when>
              <c:otherwise>
                <c:set var="color" value="black"/>
              </c:otherwise>
            </c:choose>
            <td class="text-center" width=80><b style="color:${color}">${sw }</b></td>
          </c:forEach>
        </tr>
        <c:set var="week" value="${week }"/>
        <c:set var="color" value="black"/>
        <c:forEach var="i" begin="1" end="${lastday }" varStatus="s">
          <c:choose>
              <c:when test="${week==0 }">
                <c:set var="color" value="red"/>
              </c:when>
              <c:when test="${week==6 }">
                <c:set var="color" value="blue"/>
              </c:when>
              <c:otherwise>
                <c:set var="color" value="black"/>
              </c:otherwise>
            </c:choose>
          <c:if test="${i==1 }">
           <tr>
           <c:forEach var="j" begin="1" end="${week }">
             <td width=21 height=21>&nbsp;</td>
           </c:forEach>
          </c:if>
          
          <c:if test="${i==today }">
           <td width=21 height=21 class="text-center" style="background-color: green "><div id="circle" style="color:white;">${i }</div></td>
          </c:if>
          <c:if test="${i!=today && i==rList[i-1]}"> <!-- 같지않으면 무색 => 예매 X -->
          <td width=21 height=21 class="text-center"><div id="circle" style="color:${color};">${i }</span></td>
           
          
          </c:if>
          <c:if test="${i!=today && i!=rList[i-1]}"> <!-- 같은 날이면 초록색 => 예매가능한 날짜 -->
           <td width=21 height=21 class="text-center"><div id="circle" style="color:${color};background-color:green" class="btn btn-sm btn-primary dates" data-year="${year }" data-month="${month }">${i }</div></td>
          </c:if>
          
          <c:set var="week" value="${week+1 }"/>
          <c:if test="${week>6 }">
            <c:set var="week" value="0"/>
            </tr>
            <tr>
          </c:if>
        </c:forEach>
        </tr>
       </table>
</body>
</html>