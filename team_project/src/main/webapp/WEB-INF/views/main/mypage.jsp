<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.mypage-container {
    display: flex;
    justify-content: space-between;

}
.mypage{
 text-align: left;
 padding-left: 50px;
 padding-top: 100px;
}
.mypage a:hover {
    color:#d88402; /* 원하는 hover 컬러로 변경하세요 */
    text-decoration: none; /* 밑줄 제거 (선택 사항) */
}

.mypage ul {
    list-style: none;
    padding: 0;

}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage-container">
<div class="mypage">
<ul>
<li><a href="member-info">내정보</a></li>
<li><a href="orderlistout">주문내역</a></li>
<li><a href="recent-products">장바구니</a></li>
<li><a href="like-out">찜한 상품</a></li>
<li><a href="recent-products">최근본상품</a></li>
</ul>
</div>


<!-- 이름,쿠폰 -->




<!-- 찜하기 -->

<!-- 최근본상품 -->



<!-- 문의내역 -->
</div>

</body>
</html>