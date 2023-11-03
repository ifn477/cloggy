<%@ page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>		
<style type="text/css">
.content{
	max-width: 1300px;	
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 10rem;
	text-align: center;
}
.container_box{
    display: flex;
    flex-wrap: wrap;
    justify-content: inherit;
  	padding-left: 50px; 
}
.product_item {
    min-height: 200px;
    flex-basis: 150px;
    flex-grow: 0;
    position: relative;
    margin-bottom: 50px;
    padding-left: 5px;
    padding-right: 5px;
}

/* 썸네일 */
.product_thumbnail {
    position: relative;
    width: 300px;
    height: 300px;
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

/* 찜하기 */
.like-check {
    position: absolute;
    right: 1.5rem;
    top: 15rem;
    z-index: 1; /* 다른 내용 위에 나타나도록 z-index 값을 설정합니다. */
    height: 20px;
}

.likeDeleteButton, .likeAddButton {
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
    opacity: 0.8;
}

/* 인기상품 */
.best-product-area{
	height: 50rem;
	background-color: #fbf7f0;
}
.best-product{
	width: 70%; 
	height: 37rem;
	text-align: center; 
	margin: 0 auto;
	overflow: hidden;
}
.best-product::-webkit-scrollbar {
	background-color: #d9d4cd;
    border-radius: 10px; /* 스크롤바 모서리 둥글게 설정 */
    width: 10px;
}
.best-product::-webkit-scrollbar-thumb {
  background: #c5b49b;
  border-radius: 10px;
}
.best-product ul{
  width: 355px;
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
    font-size: 27px;
    font-weight: 500;
    color: #463528;
}
.best_product_thumbnail{
	position: relative;
    width: 350px;
    height: 350px;
    background-color: white;
}
.best_product_thumbnail_image{
    max-width: 350px;
    max-height: 350px;
    overflow: hidden;
}
.best_product_thumbnail_image img {
    width: auto;
    height: auto;
    width: 100%;
    height: 100%;
	text-align: center;
}
.best_product_price{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: 18px;
    padding-top: 5px;
}
#best_product_name{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 20px;
    text-align: center;
    margin: 0 auto;
	text-decoration: none;
	color: #463528;
	opacity: 0.95;
}
.best_product_name{
	padding-top: 10px;
	width: 85%;
    text-align: center;
    margin: 0 auto;
}

/* 상품리스트 */
.product_price{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: 16px;
	padding-top: 3px;
}
.product_name{
    width: 85%;
    text-align: center;
    margin: 0 auto;    
}
#product_name{
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	font-size: 18px;
	text-decoration: none;
	color: #463528;
	opacity: 0.95;
}
</style>
<meta charset="UTF-8">
</head>
<body>


<!-- 베스트 슬라이드 -->
<div class="best-product-area">
<div class="best-product-title">
  <p class="best-product-title1">지금 가장 사랑받는</p>
  <h2 class="best-product-title2">BEST ITEM</h2>
</div>
<div class="best-product">
<div class="swiper-container" id="best-product-slide">
  <ul class="swiper-wrapper">
	<c:forEach items="${bestlist}" var="bestproduct" begin="0" end="6">
      <li class="swiper-slide product-item">
        <div class="best_product_thumbnail">
         <a href="product-detail?product_id=${bestproduct.product_id}&userId=${member.userId}">
	        <div class="best_product_thumbnail_image">
	         	<img alt="상품썸네일" src="${bestproduct.p_thumbnail}" >
    		</div>
         </a>
        </div>
        <div class="best_product_name">
          <a href="product-detail?product_id=${bestproduct.product_id}&userId=${member.userId}" id="best_product_name">
			${bestproduct.p_name}
          </a>
        </div>
        <div class="best_product_price">
        	<fmt:formatNumber pattern="#,###" value="${bestproduct.p_price}"/>원 
        </div>
      </li>
    </c:forEach>
  </ul>
</div>
<div class="swiper-scrollbar" style="position: relative; top: 40px; width: 20%; text-align: center; margin: 0 auto;"></div>
</div>
</div>

<script>
var mySwiper = new Swiper('#best-product-slide', {
  slidesPerView: 'auto',
  spaceBetween: 10,
  scrollbar: {
    el: '.swiper-scrollbar',
    hide: false,
  },
  autoplay: {
    delay: 3000, // 3초마다 자동으로 슬라이드 넘김
    disableOnInteraction: false, // 사용자 상호 작용 후에도 계속 자동 슬라이딩 유지
  },
});
</script>


<section class="content">
<div class="container_box">
<c:forEach items="${list}" var="pout">
<div class="product_item">
	<!-- 썸네일 -->
     	<div class="product_thumbnail">
         <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
         	<div class="image-container">
         		<img alt="상품썸네일" src="${pout.p_thumbnail}" width="300px;" height="300px;">
         	</div>
         </a>
     	</div>
       
	<!-- 찜하기 -->
	<div class="like-check">
	    <c:choose>
	        <c:when test="${empty likelist}">
	                    <button class="likeAddButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
	                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="40px" height="40px">
	                    </button>
	        </c:when>
	        <c:otherwise>
	            <c:choose>
	           		<c:when test="${fn:contains(likelist, pout.product_id)}">
	                    <button class="likeDeleteButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
	                        <img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="40px" height="40px">
	                    </button>
	                </c:when>
	                <c:otherwise>
	                    <button class="likeAddButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
	                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="40px" height="40px">
	                    </button>
	                </c:otherwise>
	            </c:choose>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<!-- 상품명 -->
     	<div class="product_name">
         <a href="product-detail?product_id=${pout.product_id }&userId=${member.userId}" id="product_name">
         ${pout.p_name}
         </a>
       </div>
       
	<!-- 가격 -->
	<div class="product_price">
        <fmt:formatNumber pattern="#,###" value="${pout.p_price}"/>원 
	</div>
</div>
</c:forEach>
</div>
</section>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
/*찜하기*/
$(document).ready(function () {
    $('.container_box').on('click', '.likeAddButton, .likeDeleteButton', function () {
        var button = $(this);
        var isLikeButton = button.hasClass('likeAddButton');
        var productId = button.data('productid');
        var userId = button.data('userid');
        var url = isLikeButton ? 'like-add' : 'like-delete';

        var memberLoginState = ${loginstate};
        if (!memberLoginState) {
            alert('로그인 후 이용해 주세요.');
            return;
        }
        
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                product_id: productId,
                userId: userId
            },
            success: function (response) {
                var buttonParent = button.closest('.likecheck');
                if (isLikeButton) {
                    buttonParent.html('<button class="likeDeleteButton" data-productid="' + productId + '" data-userid="' + userId + '"><img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="50px" height="50px"></button>');
                } else {
                    buttonParent.html('<button class="likeAddButton" data-productid="' + productId + '" data-userid="' + userId + '"><img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px" height="50px"></button>');
                }
            },
            error: function (error) {
                console.error('오류 발생', error);
            }
        });
    });
});
</script>
</body>
</html>