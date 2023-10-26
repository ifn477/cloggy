<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>	
<style type="text/css">
*{
	font-family: 'NanumBarunGothic';
}
.content{
	max-width: 70%;	
	margin: 0 auto;
	margin-top: 50px;
    margin-bottom: 10rem;
}
.container_box {
    display: flex;
    flex-wrap: wrap;
    padding-left: 10px;
    width: 1200px;
    margin-left: 95px;
}
.product_item {
    min-height: 200px;
    position: relative;
    text-align: center;
    margin-bottom: 5rem;
    margin-right: 0px;
}
.product_thumbnail {
    position: relative;
    width: 200px;
    background-color: white;
    display: flex;
    flex-direction :column;
    justify-content: center;
    align-items: center;
}
.image-container {
    max-width: 300px;
    max-height: 350px;
    overflow: hidden;
    text-align: center;
}
.image-container img {
    width: auto;
    height: auto;
    max-width: 100%;
    max-height: 100%;
}
.product_name_price{
	display:flex;
	flex-direction:column;

	width: 150px;
	text-align: center;
}

.product_price{
	margin-top: 5px;
	font-size: 15px;
}
p{
    caption-side: top;
    font-size: 17px;
    font-weight: 500;
    top: 0;
    margin-left : 135px;
    margin-bottom: 50px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
   <p>최근 본 상품</p>
  <div class="container_box">
    <c:if test="${not empty rplist}">
      <div style="font-size: 15px; font-weight: bold; text-align:left;">
      </div>
      <c:forEach items="${rplist}" var="rout">
        <div class="product_item">
          <div class="product_thumbnail">
            <a href="product-detail?product_id=${rout.product_id}&userId=${member.userId}">
              <img alt="상품썸네일" src="/dog/image/${rout.p_thumbnail}" width="145px;" height="160px;">
            </a>
            	<div class="product_name_price">          
          <div class="product_name" style="font-weight: 600;">
            <a href="product-detail?product_id=${rout.product_id }&userId=${member.userId}" style="font-size: 13px; text-decoration: none;">
              ${rout.p_name}
            </a>
          </div>
          <div class="product_price" style="font-size: 12px;">
          <fmt:formatNumber value="${rout.p_price}" pattern="#,##0"/>원
          </div>
          </div>
          </div>
        </div>
      </c:forEach>
    </c:if>
  </div>
  <c:if test="${empty rplist}">
            <p style="text-align: center; margin-top: 7rem;">최근 본 상품이 없습니다.</p>
  </c:if>
</section>
</body>
</html>