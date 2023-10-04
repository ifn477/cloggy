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
<script type="text/javascript">
// 장바구니
function addcart() {
    const productId = document.querySelector('input[name="product_id"]').value;
    const quantity = document.getElementById('result').innerText;

    // Create a JSON object with the data to send
    const data = {
        product_id: productId,
        quantity: quantity
    };

    // Send the data to the server using AJAX
   fetch('/addcart', {
    method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        // Handle the response as needed (e.g., show a success message)
        alert('상품이 장바구니에 추가되었습니다.');
    })
    .catch(error => {
    	alert('Error', error);
    });
}

// 총 금액 계산 후 출력

	document.addEventListener('DOMContentLoaded', function () {
    const minusbtn = document.getElementById('minusbtn');
    const plusbtn = document.getElementById('plusbtn');
    const resultElement = document.querySelector('#result');
    const priceElement = document.querySelector('#price');

    minusbtn.addEventListener('click', function () {
        const currentQuantity = parseInt(resultElement.innerText);
        if (currentQuantity > 1) {
            resultElement.innerText = (currentQuantity - 1).toString();
            updateTotalPrice();
        }
    });

    plusbtn.addEventListener('click', function () {
        const currentQuantity = parseInt(resultElement.innerText);
        resultElement.innerText = (currentQuantity + 1).toString();
        updateTotalPrice();
    });

    // Function to update the total price
    function updateTotalPrice() {
        const currentQuantity = parseInt(resultElement.innerText);
        const price = parseFloat(priceElement.innerText.replace(/[^\d.-]/g, ''));
        const totalPrice = currentQuantity * price;

        // Display the total price with formatting
        document.querySelector('#totalPrice').innerText = totalPrice.toLocaleString('ko-KR') + '원';
    }
});



</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="addcart" method="post">
		<c:forEach items="${list}" var="pdetail">
			<table align="center" width="1000px" style="margin-top: 130px;">
				<tr>
					<td><input type="hidden" name="product_id"
						value="${pdetail.product_id}"></td>
				</tr>
				<tr>
					<td><img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail }"
						width="350px;" height="400px;"></td>
				</tr>
				<tr>
					<td align="center" style="font-size: 40px; padding-left: 10px;">${pdetail.p_name }</td>
				</tr>
				<tr>
					<td id=align= "right" style="font-size: 30px; padding-left: 10px;">
						<div id="price">
							<fmt:formatNumber pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber>
						</div>
					</td>
				</tr>

				<!--수량 선택 -->
				<tr>
					<td>
						<div class="button-container">
						
						
						</div>
					</td>
				</tr>
				<tr>
					<td>Total Price: <span id="totalPrice">0</span></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="장바구니 추가"
						onclick="addcart()"></td>
				</tr>
			</table>

			<!--             리뷰 -->
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
						<img alt="상세페이지" src="/dog/image/${pdetail.p_image}"
						width="700px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="button" value="수정"
						onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">
					</td>
			</table>
		</c:forEach>
	</form>



</body>
</html>
