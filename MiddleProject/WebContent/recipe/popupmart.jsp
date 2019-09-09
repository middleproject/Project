<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
						<div class="col-lg-8">	
						
							
								<table class="table">
									<tr>
										 <td class="text-left">
									           <table class="table">
									            <tr>
									            <img src="homePlus.png" style="width:100px; height: 100px;">
									             <td class="text-center info">HomePlus</td>
									           </tr>
									           </table>
									           <table class="table table-hover">
									             
									             <c:forEach var="ivo" items="${homelist }">
									             	
									             	<tr>
									                <td >${ivo.ingredetailname } : ${ivo.price }원(${ivo.unit })</td>
									               </tr>
									               
									             </c:forEach>
									             
									           </table>
									         </td>
									         <td>
									           <table class="table">
									            <tr>
									            <img src="emart.png" style="width:100px; height: 100px;">
									             <td class="text-center info">E-Mart</td>
									            </tr>
									           </table>
									           <table class="table table-hover">
									             
									             <c:forEach var="lvo" items="${emartlist }">
									             	
									             	<tr>
									                <td >${lvo.ingredetailname } : ${lvo.price }원(${lvo.unit })</td>
									               </tr>
									               
									             </c:forEach>
									             
									           </table>
									         </td>
									         <td>
									           <table class="table">
									            <tr>
									            <img src="LotteMart.png" style="width:100px; height: 100px;">
									             <td class="text-center info">Lotte-Mart</td>
									            </tr>
									           </table>
									           <table class="table table-hover">
									             
									             <c:forEach var="evo" items="${lottelist }">
									         
									             	<tr>
									                <td >${evo.ingredetailname } : ${evo.price }원(${evo.unit })</td>
									               </tr>
									               
									             </c:forEach>
									             
									           </table>
									         </td>
									</tr>
								</table>
							</div>
</body>
</html>