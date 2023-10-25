<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.container_box{
    display: flex;
    flex-wrap: wrap;
    justify-content: inherit;
	padding-left: 4rem;
}
.product_item {
    min-height: 200px;
    flex-basis: 150px;
    flex-grow: 0;
    position: relative;
    text-align: center;
}
.product_thumbnail {
    position: relative;
    width: 300px;
    height: 350px;
    background-color: white;
    display: flex;DD
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
.product_price{
	font-size: 20px;
}
p{
    caption-side: top;
    font-size: 17px;
    font-weight: 500;
    top: 0;
    margin-bottom: 50px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="content">
  <div class="container_box">
          <p>최근 본 상품~~~</p>
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