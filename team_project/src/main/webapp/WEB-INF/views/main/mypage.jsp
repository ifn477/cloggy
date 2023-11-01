<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<style type="text/css">

/* 배송진행사항 */
.mypage ul {
	list-style: none;
	padding: 0;
}

div {
	font-family: 'Noto Sans KR', sans-serif;
}

.mypage-step {
	overflow: hidden;
	width: 729px;
	height: 117px;
	align: center;
	margin-top: 130px; /* 상단 여백 추가 */
	border-radius: 10px;
	background-color: #f6eddf;
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	text-align: center;
	margin: 0 auto;
}

ul {
	list-style: none;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.mypage-step li {
	float: left;
	position: relative;
	width: 20%;
	height: 70px;
	background:
		url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_arrow11x21.png)
		0 90% no-repeat;
	font-size: 0px;
	line-height: 0px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.mypage-step li em {
	top: 25px;
	color: #d88402;
	font-style: normal;
	font-size: 40px;
	line-height: 50px;
	font-weight: 500;
}

.mypage-step li em, .mypage-step li span {
	display: block;
	position: absolute;
	left: 0;
	width: 100%;
	text-align: center;
	vertical-align: top;
}

.mypage-step li span {
	top: 70px;
	color: #d88402;
	font-size: 16px;
	line-height: 22px;
}

.mypage-step li:first-child {
	background: 0 0;
}

.d_text {
	margin-bottom: 0;
	width: 730px;
	margin-top: 0px;
}

caption {
	margin-bottom: 0;
}

td.username {
	font-size: xxx-large;
}

.namecoupon {
	width: 729px;
	margin-bottom: 0;
}

.namecoupon th {
	border-radius: 10px;
	border-bottom: 0px solid #f6eddf;
	padding: 10px;
}

.couponcnt {
	float: right;
	padding: 0;
}

.mylink {
	width: 729px;
}

table.namecoupon {
	border-top: 0px solid #f6eddf
}

.card mybaby {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-content: center;
	margin-bottom: 20px; /* Adjust margin as needed */
	/*     width: 100%; /* Ensure the cards take the full width */
	*/
}

.card-img-top {
	border-radius: 50%;
	width: 200px;
	height: 200px;
}

.mypage-container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.mybaby {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	gap: 10px;
	align-items: center;
	margin-bottom: 20px;
	align-items: center; /* 필요에 따라 여백 조절 */
}

.mybabycomment {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: flex-end;
	margin-top: 20px;
	margin-bottom: 10px;
	color: #d88402;
	width: 720px;
	font-size: 1.5rem;
	margin-top: 20px
}

.card-contents {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 20px;
}

#more {
	color: gray;
	font-size: 1rem;
}

#babyInput {
	padding-top: 45px;
}

.modify {
	width: 100%;
	display: flex;
	justify-content: center;
	border-top: 1px solid lightgrey;
	padding: 10px;
}
.girl{
	color: pink;
	font-weight: bold;
}
.boy{
	color: skyblue;
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="mypage-container">

		<!-- 이름,쿠폰 -->
		<table class="namecoupon" align="center">
			<td class="username"><img src="image/Footprint_full_s.png"
				style="width: 100px; opacity: 0.5;"> <span
				style="vertical-align: bottom; margin-left: 5px;">${member.userId}</span>
				</caption>
			<tr>
				<td class="couponcnt"><img src="image/쿠폰티켓.png"
					style="width: 60px; margin-right: 570px; margin-left: 20px">보유쿠폰
					${couponCount}개</td>
			</tr>
		</table>

		<!-- 우리 아이 -->
		<div class="mybabycomment">
			<span>우리아이</span> <span id="more">더보기</span>
		</div>
		<c:choose>
			<c:when test="${empty babyList}">
				<div class="mypage-step" id="babyInput">
					<a href="mybaby-input">나와 함께 사는 반려견을 등록해주세요!</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="mybaby">
					<c:forEach items="${babyList}" var="bb" varStatus="loop">
						<c:if test="${loop.index < 2}">
							<div class="card mybaby"
								style="width: 230px; display: flex; flex-direction: row; justify-content: center;">
								<!-- Limit to the first 2 items -->
								<div class="card-contents">
									<img src="/dog/image/${bb.baby_photo}" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">${bb.baby_name}</h5>
										<p class="card-text">
											${bb.baby_type} 
											 <c:choose>
										        <c:when test="${bb.baby_gender == '여아'}">
										             <span class="girl">♀</span>
										        </c:when>
										        <c:otherwise>
										             <span class="boy">♂</span>
										        </c:otherwise>
										   	 </c:choose>
											<br> ${bb.baby_birth}
											${bb.baby_bodytype}
										</p>
										<div class="modify">
											<a href="mybaby-modifyForm">수정하기</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<div class="card mybaby">
						<div class="card-contents" height="373px">
							<img src="/dog/image/graypreview.png" class="card-img-top"
								alt="...">
							<div class="card-body">
								<a href="mybaby-input"> 반려동물을 추가해보세요!<br> <br>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>



		<!-- 배송진행안내 -->

		<c:set var="preparationCount" value="0" />
		<c:set var="shippingCount" value="0" />
		<c:set var="completedCount" value="0" />

		<c:forEach items="${list}" var="ocnt">
			<c:choose>
				<c:when test="${ocnt.d_status eq '배송준비'}">
					<c:set var="preparationCount" value="${preparationCount + 1}" />
				</c:when>
				<c:when test="${ocnt.d_status eq '배송중'}">
					<c:set var="shippingCount" value="${shippingCount + 1}" />
				</c:when>
				<c:when test="${ocnt.d_status eq '배송완료'}">
					<c:set var="completedCount" value="${completedCount + 1}" />
				</c:when>
			</c:choose>
		</c:forEach>

		<table class="d_text" align="center">
			<caption>주문/배송조회</caption>
		</table>

		<ul class="mypage-step">
			<li><em> ${preparationCount} </em> <span>배송준비</span></li>

			<li><em> ${shippingCount} </em> <span>배송중</span></li>

			<li><em> ${completedCount} </em> <span>배송완료</span></li>
		</ul>

		<table align="center" class="mylink">
			<tr>
				<td><a href="orderlistout">주문내역</a></td>
			</tr>
			<tr>
				<td><a href="cart-out">장바구니</a></td>
			</tr>
			<tr>
				<td><a href="like-out">찜목록</a></td>
			</tr>
			<tr>
				<td><a href="recent-products">최근 본 상품</a></td>
			</tr>
		</table>



	</div>
</body>
</html>