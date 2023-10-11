<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{
font: black;
}
.cart-container {
	margin: 50px;
}
.order-status {
	display: flex;
	list-style: none;
	fle
}
.cart-table-in {
	display: flex;
	justify-content: space-around;
	align-items : center;
	min-width: 50px;
}
.small-box {
	flex-basis: 100px;
}
.big-box {
	flex-basis: 150px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$()
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="cart-container">
		<!-- 진행상태바 -->
		<div class="order-status">
			<span>장바구니</span> <span>주문/결제</span> <span>완료</span>
		</div>
		<!-- 장바구니 -->
		<form class="orderform" action="/order" method="post">
			<div class="cart-table">
				<table border="1">
					<caption>CART 장바구니에 담긴 상품은 30일 동안 보관됩니다.</caption>
					<thead>
						<tr>
							<th><input type="checkbox" name="chk-all" id="chk-all"
								class="small-box"></th>
							<th class="small-box">이미지</th>
							<th class="big-box">상품정보</th>
							<th class="small-box">수량</th>
							<th class="small-box">상품구매금액</th>
							<th class="small-box">적립금</th>
							<th class="small-box">배송비</th>
							<th class="small-box">선택</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach items="${list}" var="cart">
						<tr>
							<td><input type="checkbox" name="chk-one" id="chk-one"></td>
							<td>썸네일</td>
							<td><span>${cart.product_name}</span> <span>${cart.option}</span>
								<span><button id="opt_change">옵션변경</button></span></td>
							<td><span>qty버튼구현부</span></td>
							<td>${cart.product_price}</td>
							<td></td>
							<td>배송구분</td>
							<td>배송비 계산~</td>
							<td><span><button>주문하기</button></span>
							<span><button>주문하기</button></span></td>
						<tr>
						</c:forEach>
						<tr>
							<td colspan="9">합계금액+배송비</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>