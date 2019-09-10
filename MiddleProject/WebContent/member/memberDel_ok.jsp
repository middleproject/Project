<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${msg =='OK' }">
	<script>
		alert("회원탈퇴 되었습니다.");
		location.href="../main/main.do";
	</script>
</c:if>
<c:if test="${msg =='FAIL' }">
	<script>
		alert("입력하신 비밀번호가 틀렸습니다.");
		history.back();
	</script>
</c:if>

