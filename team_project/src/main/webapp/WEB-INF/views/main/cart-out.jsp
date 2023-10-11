<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{
width: 100px;
text-align: center;
}
.row-description{
width: 400px;
}
#chk-all{
width: 20px;
text-align: center;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 진행상태바 -->
	<ul class="order-status">
	 <li>장바구니</li>
	 <li>주문/결제</li>
	 <li>완료</li>
	</ul>
	<form class="orderform" action="/order" method="post">
		<table>
		  <caption>CART   장바구니에 담긴 상품은 30일 동안 보관됩니다.</caption>
			<tr>
				<th><input type="checkbox" name="chk-all" id="chk-all"></th>
				<th>이미지</th>
				<th class="row-description">상품정보</th>
				<th>수량</th>
				<th>상품구매금액</th>
				<th>적립금</th>
				<th>배송비</th>
				<th>선택</th>
			</tr>
			<tr>
				<th>
			</tr>
		</table>



	</form>
</body>
</html>