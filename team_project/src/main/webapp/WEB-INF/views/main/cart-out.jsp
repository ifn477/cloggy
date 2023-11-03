<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@charset "UTF-8";

.btn {
	border-radius: 0;
	border: 0;
}

table {
	font-family: 'Noto Sans KR', sans-serif;
	width: 70rem;
	text-align: center;
	margin-bottom: 2rem;
	border-top: 1px solid #f6eddf;
	border-collapse: collapse;
}

th {
	font-weight: 400;
	background-color: #f6eddf;
}

th, td {
	border-bottom: 1px solid #f6eddf;
	padding: 10px;
	font-size: 13px;
	color: #463528;
}

td {
	text-align: center;
}

input {
	padding-left: 10px;
	border-style: none;
	outline: none;
}

caption {
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 500;
	caption-side: top; /* 표 제목을 표의 상단에 배치 */
}

button {
	background-color: #f6eddf;
	border: none;
	  &:hover {
    background: orange;
    color: rgb(255, 251, 244);
    }
}

.pname {
	font-size: medium;
}

#order-button {
	background-color: #d88402;
	text-align: center;
	margin-bottom: 2rem;
	width: 120px;
	height: 50px;
	color: white;
}

.wrap {
	min-height: calc(100vh - 266px); /* footer 높이를 빼준다. */
	display: flex;
	flex-direction: column;
	gap: 30px;
	justify-content: center;
	align-items: center;
}

.empty {
	font-family: 'Noto Sans KR', sans-serif;
	width: 70rem;
	height: 20rem;
	background-color: #f6eddf;
	text-align: center;
	margin-top: 1rem;
	margin-bottom: 2rem;
	border-top: 1px solid #f6eddf;
	border-collapse: collapse;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cart {
	justify-content: center;
	width: 70rem;
	margin-top : 2rem;
}

.result td{
	font-size: large;
}
#emptyCart{
	width:100px;
	border-radius:50%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
		<span class="cart">CART</span>

		<%-- 카트가 비어 있는지 확인합니다 --%>
		<c:choose>
			<c:when test="${empty list}">
<!-- 				<span class="comment">장바구니에 담긴 상품은 30일 동안 보관됩니다.</span> -->
				<div class="empty">장바구니에 담긴 상품이 없습니다.</div>
<!-- 				 <img src="/dog/image/empty_cart.jpg" id="emptyCart"> -->
			</c:when>
			<c:otherwise>
				<table align="center">
					<caption>장바구니에 담긴 상품은 30일 동안 보관됩니다.</caption>
					<tr>
						<td colspan="7"><button type="button" class="btn"
								id="deletethis">선택 삭제</button>
							<button type="button" class="btn" id="deleteAll"
								onclick="location.href='delete-all'">전체 삭제</button></td>
					</tr>
					<tr>
						<th><input type="checkbox" name="chk-all" id="chk-all"
							class="chk-all"></th>
						<th>이미지</th>
						<th class="row-description">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>상품구매금액</th>
					</tr>
					<c:set var="totalprice" value="0" />
					<c:forEach items="${list}" var="cart" varStatus="loop">
								<tr>
									<td rowspan="2"><input type="checkbox" name="check-one"
										class="check-one"></td>
									<td rowspan="2"><img src="${cart.p_thumbnail}"
										width="100px"></td>
									<td><div class="pname">${cart.p_name}</div> <input
										type="hidden" name="product_id" value="${cart.product_id}">
										<input type="hidden" name="opt_id" value="${cart.opt_id}">
									</td>

									<td rowspan="2"><fmt:formatNumber pattern="#,##0원">${cart.p_price+cart.opt_price}</fmt:formatNumber>
										<span id="price-${loop.index}" style="display: none;">${cart.p_price+cart.opt_price}</span>
									</td>
									<td rowspan="2">
										<div class="button-container">
											<button type="button" class="decrease"
												data-id="${loop.index}">-</button>
											<span id="quantity-${loop.index}">${cart.cart_quantity}</span>개
											<button type="button" class="increase"
												data-id="${loop.index}">+</button>
										</div>
									</td>
									<td rowspan="2"><span id="subtotal-${loop.index}">
											<fmt:formatNumber pattern="#,##0원">
                        ${cart.cart_quantity * (cart.p_price+cart.opt_price)}
        </fmt:formatNumber>
									</span></td>
								</tr>
								<tr>
									<td><c:choose>
											<c:when test="${cart.opt_id == 0}"> [옵션: 없음] </c:when>
											<c:otherwise>[옵션: ${cart.opt_name}]</c:otherwise>
										</c:choose></td>
								</tr>
					</c:forEach>
				</table>
			</c:otherwise>
			</c:choose>

		<table align="center" class="result">
			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>총 결제금액</th>
			</tr>
			<tr>
				<td class="totalprice"><fmt:formatNumber pattern="#,##0원">${totalprice}</fmt:formatNumber></td>
				<c:set var="shipping" value="${totalprice < 30000 ? 3000 : 0}" />
				<td class="shipping"><fmt:formatNumber pattern="#,##0원">${shipping}</fmt:formatNumber></td>
				<c:set var="finalprice" value="${totalprice + shipping}" />
				<td class="finalprice"><fmt:formatNumber pattern="#,##0원">${finalprice}</fmt:formatNumber>
				</td>
			</tr>
		</table>
		<div>
			<button type="button" id="order-button">주문하기</button>
		</div>
	</div>


	<!-- 	<script src="/dog/js/cart-out.js"></script> -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							// 초기 로딩 시 전체박스, 개별체크박스 선택
							$("input[name='chk-all']").prop('checked', true);
							$("input[name='check-one']").prop('checked',
									$("input[name='chk-all']").prop('checked'));

							///이벤트들///

							// 1. 전체 선택 버튼 클릭 시 모든 체크박스 체크
							$("#chk-all").click(
									function() {
										$("input[name='check-one']").prop(
												'checked',
												$(this).prop('checked'));
										updateTotalPrice();
									});

							// 2. 체크박스가 변경될 때 totalprice 업데이트
							$("input[name='check-one']").change(function() {
								updateTotalPrice();
							});

							// 3. check-one 버튼이 모두 체크되면 chk-all도 체크, 하나라도 해제되면 chk-all도 해제
							$(".check-one")
									.click(
											function() {
												var allChecked = true;
												$(".check-one")
														.each(
																function() {
																	if (!$(this)
																			.prop(
																					"checked")) {
																		allChecked = false;
																		$(
																				"input[name='chk-all']")
																				.prop(
																						'checked',
																						false);
																		return false; // Exit the each loop early if a checkbox is not checked
																	}
																});

												$("input[name='chk-all']")
														.prop('checked',
																allChecked);
												updateTotalPrice();
											});

							// '선택 삭제' 버튼 클릭 이벤트
							$("#deletethis")
									.click(
											function() {
												const checkedBoxes = $('.chk:checked');
												let productIds = [];
												let optIds = [];

												// 선택된 제품의 product_id를 수집해서 배열에 저장
												$(
														"input[name='check-one']:checked")
														.each(
																function() {
																	const productId = $(
																			this)
																			.closest(
																					"tr")
																			.find(
																					"input[name='product_id']")
																			.val();
																	productIds
																			.push(productId);
																	const optId = $(
																			this)
																			.closest(
																					"tr")
																			.find(
																					"input[name='opt_id']")
																			.val();
																	optIds
																			.push(optId);

																});

												if (productIds.length === 0) {
													alert('선택한 상품이 없습니다.');
													return;
												} else {
													alert('선택한 상품이 삭제되었습니다.');
												}

												$
														.ajax({
															type : "POST",
															url : "/dog/deletefromcart",
															data : {
																productIds : productIds
																		.join(","),
																optIds : optIds
																		.join(",")
															},
															success : function(
																	response) {
																location
																		.reload();
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert("오류 발생: "
																		+ error);
															}
														});
											});

							// 4. 수량 증감
							$(".increase, .decrease")
									.click(
											function() {
												var index = $(this).data("id");
												//증감버튼이 여러 개 있기 때문에 해당 행의 index값을 받아와야 원하는 행에 적용됨
												var quantityElement = $("#quantity-"
														+ index);
												//수량값을 숫자로 변환
												var quantity = parseInt(
														quantityElement.text(),
														10);

												// 증가/감소 여부를 판단해 수량 변경
												if ($(this)
														.hasClass("increase")) {
													quantity++;
												} else if (quantity > 1) {
													quantity--;
												}

												//화면에 표시되는 값 변경
												quantityElement.text(quantity);

												//DB로 변경된 quantity 값 보내서 수정하기

												var product_id = $(this)
														.closest("tr")
														.find(
																"input[name='product_id']")
														.val();

												$
														.ajax({
															type : "POST",
															url : "/dog/changeqty",
															data : {
																product_id : product_id,
																quantity : quantity
															},
															success : function(
																	response) {
																if (response === "success") {
																	alert("수량이 변경되었습니다.");
																} else {
																	alert("알 수 없는 응답: "
																			+ response);
																}
															},
														});

												// Recalculate subtotal, total price, and shipping
												updateSubtotal(index);
												updateTotalPrice();
												updateShipping();
											});

							// (1) 소계 업데이트 메서드
							function updateSubtotal(index) {
								var quantityElement = $("#quantity-" + index);
								var quantityValue = parseInt(quantityElement
										.text(), 10);
								var priceValue = parseFloat($("#price-" + index)
										.text().replace(/[^0-9.-]+/g, ""));
								var subtotal = quantityValue * priceValue;
								$("#subtotal-" + index).text(
										formatNumberWithCommas(subtotal));
							}

							// (2) 총계 업데이트 메서드
							function updateTotalPrice() {
								var totalprice = 0;
								$("input[name='check-one']:checked").each(
										function() {
											var index = $(this).closest("tr")
													.find(".decrease").data(
															"id");
											var subtotal = parseFloat($(
													"#subtotal-" + index)
													.text().replace(
															/[^0-9.-]+/g, ""));
											totalprice += subtotal;
										});

								$(".totalprice").text(
										formatNumberWithCommas(totalprice)); // Update the total price element
								updateShipping();
							}

							// (3) 배송비 업데이트 메서드
							function updateShipping() {
								var totalprice = parseFloat($(".totalprice")
										.text().replace(/[^0-9.-]+/g, ""));
								var shipping = totalprice == 0 ? 0
										: totalprice < 30000 ? 3000 : 0;
								var formattedShipping = formatNumberWithCommas(shipping);
								$(".shipping").text(formattedShipping); // Update the shipping element

								var finalprice = totalprice + shipping;
								var formattedFinalPrice = formatNumberWithCommas(finalprice);
								$(".finalprice").text(formattedFinalPrice); // Update the final price element

								// Update the hidden input field for finalprice
								$("#finalprice").val(finalprice);
							}

							// (4) 형식 적용 메서드
							function formatNumberWithCommas(number) {
								return number.toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ",")
										+ '원';
							}

							// 초기값
							updateTotalPrice();
							updateShipping();

						});

		//주문하기버튼
$("#order-button").click(function() {
    const checkedBoxes = $('.chk:checked');
    let productIds = [];
    let optionIds = []; // 옵션 아이디 배열 추가

    // 선택된 제품의 product_id와 opt_id(옵션 아이디)를 수집해서 배열에 저장
    $("input[name='check-one']:checked").each(function() {
        const productId = $(this).closest("tr").find("input[name='product_id']").val();
        const optionId = $(this).closest("tr").find("input[name='opt_id']").val(); // 옵션 아이디 수집
        productIds.push(productId);
        optionIds.push(optionId); // 옵션 아이디를 배열에 추가
    });

    console.log("제품 아이디: " + productIds);
    console.log("옵션 아이디: " + optionIds);

    if (productIds.length === 0) {
        console.log('선택한 상품이 없습니다.');
        return;
    } else {
        console.log('주문하러~고고');
    }

    // 서버로 제품 아이디와 옵션 아이디 배열을 전송
    $.ajax({
        type: "POST",
        url: "/dog/order",
        async: false,
        data: {
            productIds: productIds.join(","),
            optionIds: optionIds.join(",") // 옵션 아이디 전송
        },
        success: function(response) {
            $('body').html(response);
            $('#order-results').html(response);
        },
        error: function(xhr, status, error) {
            alert("오류 발생: " + error);
        }
    });
});
	</script>
</body>
</html>
