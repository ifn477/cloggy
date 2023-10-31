<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container_box {
	display: flex;
	flex-direction: column;
	flex-flow: column wrap;
	align-items: center; /* 가로 중앙 정렬을 위해 추가 */
	margin-top: 5rem;
	margin-bottom: 5rem;
}

.product-detail {
	width: 1000px;
}

.detail-top {
	display: flex;
	flex-wrap: nowrap;
	height: 28rem;
	margin-bottom: 10rem;
}
/* 썸네일 */
.thumbnail-area {
	flex-grow: 0;
	height: 28rem;
}

.thumbnail {
	position: relative;
	width: 400px; /* 원하는 가로 크기로 설정 */
	height: 450px; /* 원하는 세로 크기로 설정 */
	background-color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	margin-top: 20px;
}

.thumbnail img {
	max-width: 130%;
	max-height: 130%;
	object-fit: cover;
	margin-right: 30px;
}

.order-area {
	flex-grow: 1;
	height: 28rem;
}

/* 상품정보 */
.product-title {
	font-size: 27px;
}

.product-price {
	font-size: 20px;
	padding-bottom: 20px;
	padding-top: 150px;
}

.options-container {
	padding-bottom: 20px;
}

.likeDeleteButton, .likeAddButton {
	background: none;
	border: none;
	padding: 0;
	margin: 0;
	cursor: pointer;
	opacity: 0.8;
	padding-top: 30px;
	padding-bottom: 150px;
	padding-right: 5px;
}

.cart-container {
	padding-bottom: 20px;
}

.form-select {
	width: 600px;
}

#addToCart {
	margin-top: 20px;
	border-radius: 0;
	width: 600px;
	height: 50px;
	border: 0;
}

/* 추천상품 */
.detail-recommend {
	height: 23rem;
	margin-bottom: 30px;
}

.recommend-title {
	font-weight: 400;
	font-size: 20px;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 30px;
	color: #463528;
}

.recommend-item {
	display: flex;
	width: 250px;
	text-align: center;
}

.recommend-thumbnail {
	position: relative;
	width: 200px; /* 원하는 가로 크기로 설정 */
	height: 230px; /* 원하는 세로 크기로 설정 */
	background-color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.thumbnail img {
	max-width: 130%;
	max-height: 130%;
	object-fit: cover;
}

.recommend-item a {
	text-decoration: none;
	color: black;
}
/* 상품상세 */
.detail-info {
	margin-bottom: 30px;
}

.info-item {
	text-align: center;
}

.product-info {
	width: 700px;
	text-align: center;
	margin: 0 auto;
}

/* 수정버튼 */
#modibnt {
	border-radius: 0;
	width: 300px;
	height: 50px;
	border: 0;
}
</style>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${list}" var="pdetail">
		<div class="container_box">
			<div class="product-detail">
				<!-- 상단 -->
				<div class="detail-top">
					<tr>
						<td><input type="hidden" id="product_id"
							value="${pdetail.product_id}"></td>
					</tr>
					<!-- 썸네일(상단 왼쪽) -->
					<div class="thumbnail-area">
						<div class="thumbnail">
							<img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail}">
						</div>
					</div>

					<!-- 상단 오른쪽 -->
					<div class="order-area">
						<div class="product-title">${pdetail.p_name}</div>

						<div class="product-price">
							<span id="price">판매가&emsp;<fmt:formatNumber
									pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber></span>
						<!-- 찜하기 -->
						<div class="likecheck"
							style="display: inline-block; float: right;">
							<c:choose>
								<c:when test="${empty likelist}">
									<button class="likeAddButton"
										data-productid="${pdetail.product_id}"
										data-userid="${member.userId}">
										<img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px"
											height="50px">
									</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${fn:contains(likelist, pdetail.product_id)}">
											<button class="likeDeleteButton"
												data-productid="${pdetail.product_id}"
												data-userid="${member.userId}">
												<img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png"
													width="50px" height="50px">
											</button>
										</c:when>
										<c:otherwise>
											<button class="likeAddButton"
												data-productid="${pdetail.product_id}"
												data-userid="${member.userId}">
												<img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px"
													height="50px">
											</button>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- 찜하기 end -->			
						</div>

						<!-- 옵션, 수량 -->
						<div class="options-container">
							<select class="form-select" class="haha" id="haha" name="haha">
								<option data-opt_price="0" data-opt_id="0">옵션을 선택해주세요</option>
								<c:forEach items="${optlist}" var="opt">
									<option data-opt_name="${opt.opt_name}"
										data-opt_price="${opt.opt_price}" data-opt_id="${opt.opt_id}">
										${opt.opt_name} &emsp; (+${opt.opt_price})</option>
								</c:forEach>
							</select>
						</div>

						<div class="cart-container">
							<div class="button-container"
								style="display: inline-block; vertical-align: top;">
								<button id="decrease">-</button>
								<span id="quantity">1</span>
								<button id="increase">+</button>
							</div>
							<div class="total-price"
								style="display: inline-block; float: right;">
								Total Price: <span id="totalPrice"><fmt:formatNumber
										pattern="#,##0원">
				        ${pdetail.p_price}</fmt:formatNumber></span>
							</div>
						</div>

						<!-- url공유하기 -->
						<div class="share">
							<div class="share-text"
								style="display: inline-block; text-align: left;">공유하기</div>
							<div class="product-url"
								style="display: inline-block; float: right;">
								<span class="button gray medium" style="margin-right: 5px;">
									<a href="#" onclick="clip(); return false;"
									style="text-decoration: none;"> <img
										src="/dog/image/url.png">
								</a>
								</span> <a href="javascript:shareKakao();" id="btnKakao"><img
									src="/dog/image/icon-kakao.png"></a>
							</div>
						</div>

						<!-- 장바구니 버튼 -->
						<button class="btn btn-primary py-2" id="addToCart"
							style="background-color: #e28b3a;">add to cart</button>
					</div>
				</div>
				<!-- 리뷰 -->
				<div class="review-container">
					<div class="review">
						<table width="500px">
							<tr>
								<td colspan="2"><a
									href="review-out?product_id=${pdetail.product_id}"
									align="right">리뷰 전체보기</a></td>
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

				<!-- 추천상품리스트 -->
				<div class="detail-recommend" id="recommendContainer">
					<c:choose>
						<c:when test="${not empty recommend_list}">
							<div class="recommend-title">판매자 추천상품</div>
							<div class="recommend-item">
								<c:forEach items="${recommend_list}" var="recommend_product">
									<span style="display: inline-block; margin-right: 10px;">
										<a
										href="product-detail?product_id=${recommend_product.product_id}">
											<div class="recommend-thumbnail">
												<img src="/dog/image/${recommend_product.p_thumbnail}"
													height="200px;">
											</div>
											<div>${recommend_product.p_name}</div>
											<div>
												<fmt:formatNumber pattern="#,###원"
													value="${recommend_product.p_price}" />
											</div>
									</a>
									</span>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<script>
								// 추천 상품 목록이 없을 때 <div class="detail-recommend">의 높이를 조절
								var recommendContainer = document
										.getElementById("recommendContainer");
								if (recommendContainer) {
									recommendContainer.style.height = "5px";
								}
							</script>
							<p class="no-recommend" style="color: white;">추천상품란</p>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 상세설명 -->
				<div class="detail-info">
					<div class="info-item">
						<div class="product-infoimage">
							<img alt="상세페이지" src="/dog/image/${pdetail.p_image}"
								style="margin-top: 50px;">
						</div>
						<div class="product-info">
							<div class="info">${pdetail.p_info}</div>
						</div>
					</div>
				</div>

				<!-- 수정버튼 -->
				<div
					style="text-align: center; margin-top: 30px; margin-bottom: 70px;">
					<button class="btn btn-primary py-2" id="modibnt"
						style="background-color: #e28b3a;"
						onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">수정</button>
				</div>
			</div>
		</div>

		<!-- 리뷰 -->
		<div class="review-container">
			<div class="review">
				<table width="500px" align="center">
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
		
		<!-- 수정버튼 -->
		<div style="text-align: center; margin-top:30px; margin-bottom:70px;">
		    <button class="btn btn-primary py-2" id="modibnt" style="background-color: #e28b3a;" 
		    onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">수정</button>
		</div>
	</div>
</div>
</c:forEach>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		/* 쿠키 생성 및 저장 */
		function onPageLoad() {
			var url = window.location.href;
			var product_Id = getProduct_IDFromURL(url);
			console.log("product_Id::" + product_Id);

			if (product_Id) {
				var recentProducts = getCookie('recent_products');
				var recentProductIds = recentProducts ? recentProducts
						.split('/') : [];

				if (!recentProductIds.includes(product_Id)) {
					recentProductIds.push(product_Id);
				}

				if (recentProductIds.length > 10) {
					recentProductIds.shift();
				}

				recentProducts = recentProductIds.join('/');

				var expirationDate = new Date();
				expirationDate.setTime(expirationDate.getTime()
						+ (24 * 60 * 60 * 1000));
				console.log("expirationDate::" + expirationDate);
				setCookie('recent_products', recentProducts, expirationDate);
			}
		}

		window.addEventListener('load', onPageLoad);

		function setCookie(cookieName, value, expirationDate) {
			var cookieValue = escape(value)
					+ ((expirationDate == null) ? '' : '; expires='
							+ expirationDate.toUTCString());
			document.cookie = cookieName + '=' + cookieValue;
		}

		/* 쿠키 가져오기 */
		function getCookie(cookieName) {
			var name = cookieName + '=';
			var decodedCookie = decodeURIComponent(document.cookie);
			var cookieArray = decodedCookie.split(';');

			for (var i = 0; i < cookieArray.length; i++) {
				var cookie = cookieArray[i];
				while (cookie.charAt(0) == ' ') {
					cookie = cookie.substring(1);
				}
				if (cookie.indexOf(name) == 0) {
					return cookie.substring(name.length, cookie.length);
				}
			}
			return '';
		}

		function getProduct_IDFromURL(url) {
			var regex = /[?&]product_id=(\d+)/;
			var match = regex.exec(url);
			if (match && match[1]) {
				return match[1];
			}
			return null;
		}
		/*찜하기*/
		$(document).ready(function () {
		    $('.container_box').on('click', '.likeAddButton, .likeDeleteButton', function () {
		        var button = $(this);
		        var isLikeButton = button.hasClass('likeAddButton');
		        var productId = button.data('productid');
		        var userId = button.data('userid');
		        var url = isLikeButton ? 'like-add' : 'like-delete';

		        var memberLoginState = ${loginstate};
		        if (!memberLoginState) {
		            alert('로그인 후 이용해 주세요.');
		            return;
		        }
		        
		        $.ajax({
		            type: 'POST',
		            url: url,
		            data: {
		                product_id: productId,
		                userId: userId
		            },
		            success: function (response) {
		                var buttonParent = button.closest('.likecheck');
		                if (isLikeButton) {
		                    buttonParent.html('<button class="likeDeleteButton" data-productid="' + productId + '" data-userid="' + userId + '"><img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="50px" height="50px"></button>');
		                } else {
		                    buttonParent.html('<button class="likeAddButton" data-productid="' + productId + '" data-userid="' + userId + '"><img alt="찜하기" src="/dog/image/Footprint_s.png" width="50px" height="50px"></button>');
		                }
		            },
		            error: function (error) {
		                console.error('오류 발생', error);
		            }
		        });
		    });
		});
		/*장바구니*/
		$(document)
				.ready(
						function() {
							var quantity = 1; // 초기 수량은 1으로 설정
							let priceValue = parseFloat($("#price").text()
									.replace(/[^0-9.-]+/g, ""));

							// 옵션 선택 시 이벤트 핸들러
							$("#haha")
									.change(
											function() {
												var selectedOption = $(this)
														.find("option:selected");
												var optName = selectedOption
														.data("opt_name");
												var optPrice = selectedOption
														.data("opt_price");

												// 제품 가격 -> optPrice + 기존 가격으로 업데이트
												var updatedPrice = priceValue
														+ optPrice;
												$("#price")
														.text(
																formatNumberWithCommas(updatedPrice)); // 업데이트된 가격을 화면에 출력
												updateTotalPrice(); // total_price 업데이트 함수 호출
											});

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

							$("#addToCart")
									.click(
											function() {
												var product_id = $(
														"#product_id").val();
												var selectedOption = $(
														"#haha option:selected")
														.val();

												var selectedOption = $("#haha")
														.find("option:selected");
												var optId = selectedOption
														.data("opt_id");

												// 추출된 데이터 사용
												console.log("product id: "
														+ product_id);
												console.log("quantity: "
														+ quantity);
												console.log("선택한 옵션의 번호: "
														+ optId);

												// Ajax를 사용하여 서버로 데이터 전송
												$
														.ajax({
															type : "POST", // 또는 "GET"에 따라 적절하게 변경
															url : "/dog/addtocart", // 컨트롤러의 URL을 여기에 지정
															data : {
																product_id : product_id,
																quantity : quantity,
																optId : optId
															},
															success : function(
																	response) {
																if (response === "success") {
																	alert("장바구니에 상품이 추가되었습니다.");
																} else if (response === "no") {
																	alert("사용자가 로그인하지 않았습니다.");
																	// 다른 처리를 수행할 수 있음
																} else {
																	alert("알 수 없는 응답: "
																			+ response);
																}
															},

														});
											});
						});

		//카카오 공유하기
		function shareKakao() {
			console.log('shareKakao 함수가 호출되었습니다.');
			var thisUrl = document.URL;
			// 사용할 앱의 JavaScript 키 설정
			Kakao.init('3eebd9335d1049afaa57ca1a1e68a170');
			// 카카오링크 버튼 생성
			Kakao.Link.createDefaultButton({
				container : '#btnKakao', // 카카오공유버튼ID
				objectType : 'feed',
				content : {
					title : "클로기", // 보여질 제목
					description : "클로기 상세페이지", // 보여질 설명
					imageUrl : thisUrl, // 콘텐츠 URL
					link : {
						webUrl : thisUrl
					}
				}
			});
		}
		//url 공유하기
		function clip() {

			var url = '';
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			url = window.document.location.href;
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("URL이 복사되었습니다.")
		}
</script>
</body>
</html>