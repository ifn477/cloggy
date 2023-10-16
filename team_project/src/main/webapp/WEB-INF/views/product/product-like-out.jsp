<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>	
<style>
  .container_box {
    display: flex;
    flex-wrap: wrap;
    gap: 120px;
    margin-left: 100px;
  }

  .product_item {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 10px; 
  }

.product_thumbnail {
  position: relative;
}

.like_icon {
  position: absolute;
  top: 105px;
  left: 0;
}

  .product_name {
    font-size: 20px;
    text-decoration: none;
  }
   .product_price {
    display: block; 
    font-size: 16px;
    margin-top: 5px;
  margin-left: auto;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h4><strong>찜 목록</strong></h4>
<br>

<section class="content">
<div class="container_box">
  <c:if test="${not empty list}">
  <c:forEach items="${list}" var="pout">
	<div class="product_item">
      	<div class="product_thumbnail">
          <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
          <!--
          <img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="30px" height="30px" class="like_icon">
          -->
          <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="110px;" height="140px;">
          </a>
      	</div>
      	<div class="product_name">
          <a href="product-detail?product_id=${pout.product_id }" style="font-size: 20px; text-decoration: none;">
          ${pout.p_name}
          </a>
        <div class="product_price">
        <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
        </div>
        </div>
       </div>
  </c:forEach>
  </c:if>
  
  <c:if test="${empty list}">
  <h4 style="text-align: center;"><strong>찜한 상품이 없습니다.</strong></h4>
  </c:if>
</div>
</section>
</body>
</html>