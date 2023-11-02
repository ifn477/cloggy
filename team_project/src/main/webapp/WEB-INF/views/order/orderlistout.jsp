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


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
	<input type="hidden" class="order_id" value="${olist.order_id}">
	<td><a href="product-detail?product_id=${olist.product_id}&userId=${userId}">
	<input type="hidden" class="product_id" value="${olist.product_id}">
	<img src="/dog/image/${olist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${olist.product_id}&userId=${userId}" style="text-decoration: none;">${olist.p_name}</a></td>
	<td>${olist.orderdate}</td>
	<td>${olist.o_price}</td>
	<td>${olist.d_status}<br>
	<c:choose> 
		<c:when test="${olist.d_status eq '배송준비'}">
		<button type="button" onclick="location.href='order-cancle?order_id=${olist.order_id }'">주문 취소</button>
		 <button type="button" onclick="openTermsPopup1(this)">리뷰 등록</button>
		</c:when>
	</c:choose>
	</td>

</tr>
</c:forEach>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
    function openTermsPopup1(button) {
        var order_id = $(button).closest('tr').find('.order_id').val();
        var product_id = $(button).closest('tr').find('.product_id').val();
        console.log("주문번호: " + order_id);
        console.log("제품번호: " + product_id);
        window.open('review-input?order_id=' + order_id + '&product_id='+ product_id, '', 'width=500,height=800');
    }
</script>
</body>
</html>