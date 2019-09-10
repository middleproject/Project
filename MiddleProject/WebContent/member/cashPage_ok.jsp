<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 'OK' }">
	<script>
		alert("캐시충전완료!\n 현재 보유중인 캐쉬는 ${curCash} 원 입니다.");
		<c:redirect url="../main/main.do"/>
	</script>
</c:if>

<c:if test="${result != 'OK' }">
	<script>
		alert("오류 발생...");
		history.back();
	</script>
</c:if>