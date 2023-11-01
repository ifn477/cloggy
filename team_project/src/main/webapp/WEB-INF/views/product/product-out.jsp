<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>	
<link rel="stylesheet" a href="/dog/css/widthtable.css">
<style type="text/css">
#product-name{
	font-size: 15px; 
	text-decoration: none; 
	color: black;
}
.btn{
	width: 90px;
	height: 30px;
	line-height: 15px;
	font-size: 13px;
	background-color: #A8A8A8;
	margin-bottom: 5px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="product-table" align="center">
<caption>전체상품리스트</caption>
    <tr>
      <th style="width: 15%">상품 썸네일</th>
      <th style="width: 35%">상품명</th>
      <th>가격</th>
      <th style="width: 7%">수량</th>
      <th style="width: 5%">조회수</th>
      <th style="width: 5%">판매량</th>
    </tr>
    <c:forEach items="${list}" var="pout">
      <tr class="product-item">
        <td class="product-thumbnail">
            <img alt="상품 썸네일" src="/dog/image/${pout.p_thumbnail}" width="50px" height="50px">
        </td>
        <td class="product-name">
          <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}" id="product-name">
            ${pout.p_name}
          </a>
        </td>
        <td class="product-price">
          <fmt:formatNumber pattern="#,###" value="${pout.p_price}"/>원
        </td>
        <td class="product-stock">
        	${pout.p_stock}
        </td>
        <td class="product-hits">
        	${pout.p_hits}
        </td>
        <td class="product-sell">
        	${pout.p_sell}
        </td>
      </tr>
    </c:forEach>

<!--페이징 처리-->
<tr style="border-left: none;border-right: none; border-bottom: none;">
   <td colspan="6" style="text-align: center; border-bottom: none;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="product-out?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: #d88402;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="product-out?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="product-out?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
<!--페이징 처리-->

    <tr>
    <td colspan="6" style="text-align: center; border-bottom: none;">
        <form action="product-searchview" method="post">
            <select name="p_item" style="width: 70px; height: 30px; margin-top: 30px;" class="search-select">
                <option value="p_name">상품명</option>
                <option value="category1">대분류</option>
                <option value="category2">중분류</option>
            </select>
            <input type="text" name="p_value" style="height: 30px; width: 200px; border: 1px solid #DBDBDB; margin-top: 30px;">
            <button class="btn btn-primary py-2" id="qnabnt" type="submit">검색</button>
        </form>
    </td>
</tr>
</table>
</body>
</html>
