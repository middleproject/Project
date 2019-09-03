<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result=='OK' }">
	<script>
		alert("회원가입을 축하합니다!");
		location.href="../main/main.do";
	</script>
</c:if>
