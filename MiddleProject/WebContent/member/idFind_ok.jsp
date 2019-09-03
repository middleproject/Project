<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${result=='ERROR' }">
		<script>
			alert("입력하신 Email이 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원님의 아이디는 ${result} 입니다.");
			location.href="signIn.jsp";
		</script>
	</c:otherwise>
</c:choose>