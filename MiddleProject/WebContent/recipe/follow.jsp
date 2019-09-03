<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>사진 </th>
						        <th>&nbsp;</th>
						        <th>조회 수</th>
						        <th>만든사람</th>
						        <th>날짜</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:forEach var="vo" items="${list }">
						      <tr class="text-center">
						      
						        <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
						        
						        <td class="image-prod"><div class="img" style="background-image:url(${vo.poster});"></div></td>
						        
						        <td class="product-name">
						        	<h3>${vo.summary }</h3>
						        	<p>${vo.summary_in }</p>
						        </td>
						        <td class="price">${vo.hit }</td>
						        <td class="quantity">
						        	${vo.made }
					          </td>
						        <td class="total">${vo.regdate }</td>
						      </tr><!-- END TR-->
						      </c:forEach>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
			</div>
			<%-- <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
              	<c:if test="${curpage>BLOCK}">
                	<li><a href="../recipe/recipe_list.do?page=${startpage-1 }&key=${key}&tag=${tag}&ingre=${ingre}">&lt;</a></li>
                </c:if>
                
                <c:forEach var="i" begin="${startpage}" end="${endpage }" step="1">
	                	<li class=${i==curpage?"active":"" }><a href="../recipe/recipe_list.do?page=${i}&key=${key}&tag=${tag}&ingre=${ingre}">${i }</a></li>       
                </c:forEach>
			 &key=${key}&${tag}&${ingre}
                <c:if test="${endpage<allpage }">
                	<li><a href="../recipe/recipe_list.do?page=${endpage+1 }&key=${key}&tag=${tag}&ingre=${ingre}">&gt;</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </div> --%>
		</section>
</body>
</html>