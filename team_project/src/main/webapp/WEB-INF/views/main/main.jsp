<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 대메인 */
.carousel-item {
   height: 35rem;
}	

/* 소개글 */
#one_text {
   font-family: 'Noto Sans KR', sans-serif;
   position: relative;
   padding: 120px 0 0;
   text-align: center;
}
#one_text h2 {
    font-size: 25px;
    line-height: 1;
    padding-bottom: 25px;
    font-weight: 400;
    letter-spacing: 0px;
    color: #463528;    
}
#one_text p {
    font-size: 13px;
    font-weight: 300;
    line-height: 1.7;
}

/* 인기상품 */
.best-product-area{
	margin-top: 9rem;
	height: 50rem;
	background-color: #fff9f1;
}
.best-product{
	width: 90%; 
	height: 37rem;
	text-align: center; 
	margin: 0 auto;
	overflow: hidden;
}
.best-product::-webkit-scrollbar {
	top: 50px;
	height: 5px;
	background-color: #d9d4cd;
    border-radius: 10px; /* 스크롤바 모서리 둥글게 설정 */
}
.best-product::-webkit-scrollbar-thumb {
  background: #999; /* 스크롤바 색상 설정 */
  border-radius: 10px; /* 스크롤바 모서리 둥글게 설정 */
}
.best-product ul{
  width: 380px;
  padding: 0;
  margin: 0;
}
.product-item {
  display: inline-block; /* 리스트 항목을 옆으로 나란히 배치 */
  margin-right: 1px; /* 항목 간 간격 설정 */
}
.best-product-title {
	padding-top: 5rem;
	text-align: center;
	margin-bottom: 3rem;
}
.best-product-title1 {
    font-size: 15px;
    font-weight: 400;
    margin-bottom: 5px;
    color: #d88402;
}
.best-product-title2 {
    font-size: 30px;
    font-weight: 500;
    color: #463528;
}
.best_product_thumbnail{
	position: relative;
    width: 380px;
    height: 450px;
    background-color: white;
}
.best_product_thumbnail_image{
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 380px;
    max-height: 450px;
    overflow: hidden;
}
.best_product_thumbnail_image img {
    width: 120%;
    height: 120%;
 	text-align: center; 
}
#product_name{
	font-size: 20px;
    font-weight: 500;
    margin-top: 20px;
    margin-bottom: 5px;
}

/* 신상품 */
.new-product{
	background-color: white;
	height: 100rem;
}
.new-product-title{
	text-align: center;
	padding-top: 5rem;
	margin-bottom: 3rem;
}
.new-product p {
    font-size: 15px;
    font-weight: 400;
    margin-bottom: 5px;
    color: #d88402;
}
.new-product h2 {
    font-size: 30px;
    font-weight: 500;
    color: #463528;
}
.new-product-list{
	max-width: 70%;	
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 10rem;
}
.new-product_thumbnail {
    position: relative;
    width: 300px;
    height: 350px;
    background-color: white;
    display: flex;
    justify-content: center;
    align-items: center;
}
.new-image-container {
    max-width: 300px;
    max-height: 350px;
    overflow: hidden;
    text-align: center;
}
.new-image-container img {
    width: auto;
    height: auto;
    max-width: 100%;
    max-height: 100%;
}
.product_price{
	font-size: 20px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 대메인 -->
<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
   <div class="carousel-indicators">
     <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
     <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
     <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
   </div>
   <div class="carousel-inner">
	 <div class="carousel-item active d-flex justify-content-center align-items-center">
	   <img src="/dog/resources/mainimage/클로기%20대메인1.jpg" class="d-block" style="width: 100%; cursor: pointer;" onclick="location.href='#'">
	 </div>
     <div class="carousel-item">
       <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
       <a href="#">
       <image width="100%" height="100%" xlink:href="/dog/resources/mainimage/클로기%20대메인2.jpg" preserveAspectRatio="xMidYMid slice" />
       </a>
       </svg>
     </div>
     <div class="carousel-item">
       <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
       <a href="#">
       <image width="100%" height="100%" xlink:href="/dog/resources/mainimage/cloggymain.jpg" preserveAspectRatio="xMidYMid slice" />
       </a>
       </svg>
     </div>
   </div>
   <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
     <span class="visually-hidden">Previous</span>
   </button>
   <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
     <span class="carousel-control-next-icon" aria-hidden="true"></span>
     <span class="visually-hidden">Next</span>
   </button>
</div>


<div id="one_text">
	<h2>
		cloggy는
	</h2>
	<p>
		댕댕이들의 행복을 위해서<br>
		아주 맛있고 인기 많은 사료와 간식들로<br>
        알차게 구성한 강아지 용품샵 입니다🐶
	</p>
</div>

<!-- 인기상품 슬라이드 -->
<div class="best-product-area">
<div class="best-product-title">
  <p class="best-product-title1">실시간 인기순위!</p>
  <h2 class="best-product-title2">NOW BEST</h2>
</div>
<div class="best-product">
<div class="swiper-container" id="best-product-slide">
  <ul class="swiper-wrapper">
    <c:forEach items="${bestlist}" var="best">
      <li class="swiper-slide product-item">
        <div class="best_product_thumbnail">
          <a href="product-detail?product_id=${bestproduct.product_id}&userId=${member.userId}">
          	<div class="best_product_thumbnail_image">
            	<img alt="썸네일 자리" src="/dog/image/${best.p_thumbnail}">
          	</div>
          </a>
        </div>
        <div class="product_name" id="product_name">
          <a href="product-detail?product_id=${best.product_id}&userId=${member.userId}" style="text-decoration: none; color: black;">
			${best.p_name}
          </a>
        </div>
        <div class="product_price" style="color: black;">
          ${best.p_price}
        </div>
      </li>
    </c:forEach>
  </ul>
</div>
<div class="swiper-scrollbar" style="position: relative; top: 100px; width: 40%; text-align: center; margin: 0 auto;"></div>
</div>
</div>

<!-- 신상품 -->
<div class="new-product">
<div class="new-product-title">
	<p>따끈따끈한 신상품</p>
	<h2>NEW ITEM</h2>
</div>
<div class="new-product-list" style="width: 1300px; margin: 0 auto;">
  <div class="new-product-listin" style="display: flex; flex-wrap: wrap; justify-content: space-between;">
    <c:forEach var="i" begin="0" end="10" step="1">
      <div class="new-product-item" style="width: 200px; margin: 10px; text-align: center;">
        <div class="new_product_thumbnail">
          <a href="#">
            <div class="new-image-container">
              <img alt="썸네일 자리" src="/dog/image/11.jpg">
            </div>
          </a>
        </div>
        <div class="new-product_name" id="new-product_name">
          <a href="#">
            이름[i]
          </a>
        </div>
        <div class="new-product_price" style="color: black;">
          가격
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</div>
<script type="text/javascript" src="./js/main.js"></script>
</body>
</html>