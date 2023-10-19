<%@ page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    gap: 50px 20px;
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
.likeDeleteButton{
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
}
.likeAddButton{
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
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
</head>
<body>
<section class="content">
<div class="container_box">
  <c:forEach items="${list}" var="pout">
	<div class="product_item">
      	<div class="product_thumbnail">
          <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
          <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="300px;" height="350px;">
          </a>
      	</div>
      	<div class="product_name">
          <a href="product-detail?product_id=${pout.product_id}" style="font-size: 20px; text-decoration: none;">
          ${pout.p_name}
          </a>
                
<!-- 찜하기 -->
<div class="like-check">
    <c:choose>
        <c:when test="${empty likelist}">
                    <button class="likeAddButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px" height="50px">
                    </button>
        </c:when>
        <c:otherwise>
            <c:choose>
           		<c:when test="${fn:contains(likelist, pout.product_id)}">
                    <button class="likeDeleteButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
                        <img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="50px" height="50px">
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="likeAddButton" data-productid="${pout.product_id}" data-userid="${member.userId}">
                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px" height="50px">
                    </button>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>
</div>
<!-- 찜하기 -->
      	<div class="product_price">
          ${pout.p_price}
        </div>
       </div>
  </c:forEach>
</div>
</section>
</body>
</html>