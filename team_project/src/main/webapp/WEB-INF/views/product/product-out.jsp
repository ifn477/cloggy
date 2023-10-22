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
    display: flex;
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

/* 찜하기 */
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
<section class="content">
<div class="container_box">
  <c:forEach items="${list}" var="pout">
	<div class="product_item">
      	<div class="product_thumbnail">
          <a href="product-detail?product_id=${pout.product_id }">
           <div class="image-container">
          <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="300px;" height="350px;">
           </div>
          </a>
      	</div>
      	<div class="product_name">
          <a href="product-detail?product_id=${pout.product_id }" style="font-size: 20px; text-decoration: none; color: black;">
          ${pout.p_name}
          </a>
        </div>
      	<div class="product_price">
         <fmt:formatNumber pattern="#,###" value="${pout.p_price}"/>원
        </div>
       </div>
  </c:forEach>
</div>
</section>
</body>
</html>