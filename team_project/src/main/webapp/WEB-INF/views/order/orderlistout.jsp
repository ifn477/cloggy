<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<style type="text/css">
td{
text-align: center;
}

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
<table align="center">
<caption>주문내역조회</caption>
<tr>
	<th style="width:10%">주문번호</th>
	<th style="width:45%">상품정보</th>
	<th style="width:15%">주문일자</th>
	<th style="width:15%">주문금액</th>
	<th style="width:15%">주문상태</th>
</tr>
<c:forEach items="${listo }" var="olist">
<tr>
	<td><a href="order-detail?order_id=${olist.order_id }">${olist.order_id }</a></td>
	<td><a href="product-detail?product_id=${olist.product_id}&userId=${userId}">
	<img src="/dog/image/${olist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${olist.product_id}&userId=${userId}" style="text-decoration: none;">${olist.p_name}</a></td>
	<td>${olist.orderdate}</td>
	<td>${olist.o_price}</td>
	<td>${olist.d_status}<br>
	<c:choose> 
		<c:when test="${olist.d_status eq '배송준비'}">
		<button type="button" onclick="location.href='order-cancle?order_id=${olist.order_id }'">주문취소</button>
		</c:when>
	</c:choose>
	</td>

</tr>
</c:forEach>
</table>
</div>
</body>
</html>