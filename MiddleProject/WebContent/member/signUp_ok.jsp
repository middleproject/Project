<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result=='OK' }">
	<script>
		alert("회원가입을 축하합니다!");
		location.href="../main/main.do";
	</script>
</c:if>
<c:if test="${result!='OK' }">
	<script>
		alert("오류발생, 다시 시도 해주세요");
		history.back();
	</script>
</c:if>
