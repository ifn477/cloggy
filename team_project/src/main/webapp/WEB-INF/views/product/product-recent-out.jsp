<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>	

<style type="text/css">
.content{
	max-width: 1300px;	
	margin: 0 auto;
	margin-top: 50px;
}
.container_box{
    display: flex;
    flex-wrap: wrap;
    gap: 80px 50px;
    padding-left:10px;
    padding-right:10px;
}
.product_item {
    min-height: 200px;
    flex-basis: 150px;
    flex-grow: 0;
    position: relative;
}
.product_thumbnail {
    position: relative;
}

.like-check{
    position: absolute;
    bottom: 65px;
    left: 15px;
    background-position: -180px -10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h4><strong>최근 본 상품</strong></h4>
<br>
<section class="content">
  <div class="container_box">
    <c:if test="${not empty rplist}">
      <div style="font-size: 15px; font-weight: bold; text-align:left; margin-left: 317px;">
      </div>
      <c:forEach items="${rplist}" var="rout">
        <div class="product_item">
          <div class="product_thumbnail">
            <a href="product-detail?product_id=${rout.product_id}&userId=${member.userId}">
              <img alt="상품썸네일" src="/dog/image/${rout.p_thumbnail}" width="210px;" height="250px;">
            </a>
          </div>
          <div class="product_name">
            <a href="product-detail?product_id=${rout.product_id }" style="font-size: 15px; text-decoration: none;">
              ${rout.p_name}
            </a>
          </div>
          <div class="product_price">
            ${rout.p_price}
          </div>
        </div>
      </c:forEach>
    </c:if>
  </div>
  
  <c:if test="${empty rplist}">
  <h4><strong>최근 본 상품이 없습니다.</strong></h4>
  </c:if>
</section>
</body>
</html>