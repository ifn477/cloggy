<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>주문내역조회</h2>

<table align="center" border="1">
<tr>
<th>주문번호</th><th>상품정보</th><th>주문일자</th><th>주문금액</th><th>주문상태</th><th>리뷰 작성</th>
</tr>
<c:forEach items="${listo }" var="olist">
<tr>
	<td><a href="order-detail?order_id=${olist.order_id }">${olist.order_id }</a></td>
	<td><a href="product-detail?product_id=${olist.product_id }">
	<img src="/dog/image/${olist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${olist.product_id }" text-decoration: none;">${olist.p_name}</a></td>
	 <td>${olist.orderdate}</td>
	<td>${olist.o_price}</td>
	<td>${olist.d_status}<br>
		<button type="button" onclick="location.href='order-cancle?order_id=${olist.order_id }'">주문취소</button>
	</td>
	<td>
		<input type="hidden" id="order_id" name="order_id" value="${olist.order_id}">
		<input type="button" value="리뷰 작성하기" onclick="openTermsPopup1()">
	</td>

</tr>
</c:forEach>
</table>
<script type="text/javascript">
		function openTermsPopup1() {
			var order_id = $("#order_id").val();
			console.log("order_id");
			window.open('review-input?order_id=' + order_id, '',
					'width=500,height=800');
		}
	</script>
</body>
</html>