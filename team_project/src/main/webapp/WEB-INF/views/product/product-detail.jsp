<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.button-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.button-container input[type="button"] {
	margin: 0;
}

.review-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	/* Optionally, set the height to fill the entire viewport */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="pdetail">
		<table align="center" width="1000px" style="margin-top: 130px;">
			<tr>
				<td><input type="hidden" id="product_id"
					value="${pdetail.product_id}"></td>
			</tr>
			<tr>
				<td><img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail}"
					width="350px;" height="400px;"></td>
			</tr>
			<tr>
				<td align="center" style="font-size: 40px; padding-left: 10px;">${pdetail.p_name}</td>
			</tr>
			<tr>
				<td id=align= "right" style="font-size: 30px; padding-left: 10px;">
					<div id="price">
						<fmt:formatNumber pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber>
					</div>
				</td>
			</tr>

			<!--     수량 선택  		-->
			<tr>
				<td>
					<div class="button-container">
						<button id="decrease">-</button>
						<span id="quantity">1</span>
						<button id="increase">+</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>Total Price: <span id="totalPrice"><fmt:formatNumber
							pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber></span></td>
			</tr>

			<tr>
				<td colspan="2"><button id="addToCart">장바구니 추가</button></td>
			</tr>
		</table>

		<!-- 리뷰 -->
		<div class="review-container">
			<div class="review">
				<table width="500px">
					<tr>
						<td colspan="2"><a
							href="review-out?product_id=${pdetail.product_id}" align="right">리뷰
								전체보기</a></td>
					</tr>

					<tr>
						<td rowspan="2" width="120px"><img
							src="/dog/review-img/${rdto.r_photo}" width="100px"
							height="100px"></td>
						<td height="30px">${rdto.userId}</td>
					</tr>
					<tr>
						<td>${rdto.r_content}</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- 		다시 내용	 -->
		<table>
			<tr>
				<td colspan="2" style="padding-top: 150px;">${pdetail.p_info }<br>
					<img alt="상세페이지" src="/dog/image/${pdetail.p_image}" width="700px;">
				</td>
			</tr>

			<c:choose>
				<c:when test="${loginstate==true && member.auth_id==0}">
					<tr>
						<td colspan="2" style="text-align: right;"><input
							type="button" value="수정"
							onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">
						</td>
				</c:when>
			</c:choose>
		</table>
	</c:forEach>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 	<script src="/dog/js/product-detail.js"></script> -->
	<script type="text/javascript">
	$(document)
	.ready(
			function() {
				var quantity = 1; // 초기 수량은 1으로 설정

				function formatNumberWithCommas(number) {
					return number.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",")
							+ '원';
				}

				// total_price 업데이트 함수
				function updateTotalPrice() {
					var quantityValue = parseInt($("#quantity")
							.text(), 10);
					var priceValue = parseFloat($("#price").text()
							.replace(/[^0-9.-]+/g, ""));

					var totalPrice = quantityValue * priceValue;
					var formattedTotalPrice = formatNumberWithCommas(totalPrice);
					$("#totalPrice").text(formattedTotalPrice);
				}

				// + 버튼을 클릭할 때 수량을 증가시키는 이벤트 핸들러
				$("#increase").click(function() {
					quantity++;
					$("#quantity").text(quantity);
					updateTotalPrice();
				});

				// - 버튼을 클릭할 때 수량을 감소시키는 이벤트 핸들러
				$("#decrease").click(function() {
					if (quantity > 1) {
						quantity--;
						$("#quantity").text(quantity);
						updateTotalPrice();
					}
				});

				$("#addToCart").click(function() {
					var product_id = $("#product_id").val();
					console.log("product id: " + product_id);
					console.log("quantity: " + quantity);


					// Ajax를 사용하여 서버로 데이터 전송
				      $.ajax({
				        type: "POST", // 또는 "GET"에 따라 적절하게 변경
				        url: "/dog/addtocart", // 컨트롤러의 URL을 여기에 지정
				        data: {
				          product_id: product_id,
				          quantity: quantity
				        },
				        success: function(response) {
				            if (response === "success") {
				                alert("장바구니에 상품이 추가되었습니다.");
				            } else if (response === "no") {
				            	alert("사용자가 로그인하지 않았습니다.");
				                // 다른 처리를 수행할 수 있음
				            } else {
				            	alert("알 수 없는 응답: " + response);
				            }
				        },

				      });
				});
			});
	</script>
</body>
</html>
