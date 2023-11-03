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

/* 찜하기 */
.like-check {
    position: absolute;
    right: 1rem;
    top: 17em; /* 원하는 위치에 따라 top 값을 조절하세요. */
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

<img alt="베스트아이템" src="/dog/image/bestcate.jpg" style="width: 100%; margin-bottom: 50px;">

<section class="content">
<div class="container_box">
<c:forEach items="${list}" var="pout" begin="0" end="19">
<div class="product_item">
	<!-- 썸네일 -->
     	<div class="product_thumbnail">
         <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
         	<div class="image-container">
         		<img alt="상품썸네일" src="${pout.p_thumbnail}" width="300px;" height="350px;">
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
         <a href="product-detail?product_id=${pout.product_id }" id="product_name">
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
                console.log(isLikeButton ? '추가 성공' : '삭제 성공');
                location.reload();
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