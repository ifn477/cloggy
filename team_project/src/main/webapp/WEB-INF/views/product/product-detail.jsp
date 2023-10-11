<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

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
	<script src="/dog/js/product-detail.js"></script>


</body>
</html>
