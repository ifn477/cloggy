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
<th>주문번호</th><th>상품정보</th><th>주문일자</th><th>주문금액</th><th>주문상태</th>
</tr>
<c:forEach items="${listo }" var="olist">
<tr>
	<td><a href="order-detail?order_id=${olist.order_id }">${olist.order_id }</a></td>
	<td><a href="product-detail?product_id=${olist.product_id }">
	<img src="/dog/image/${olist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${olist.product_id }"  text-decoration: none;">${olist.p_name}</a></td>
	 <td>${olist.orderdate}</td>
	<td>${olist.o_price}</td>
	<td>${olist.d_status}<br>
		<button type="button" onclick="location.href='order-cancle?order_id=${olist.order_id }'">주문취소</button>
	</td>

</tr>
</c:forEach>
</table>
</body>
</html>