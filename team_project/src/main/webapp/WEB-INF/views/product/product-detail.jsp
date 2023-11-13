<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style type="text/css">
/* 별점 */
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

@font-face {
	font-family: 'ChosunSg';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.rate {
	display: inline-block;
	font-size: 14px;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
	color: orange;
}

.container_box {
	display: flex;
	flex-direction: column;
	flex-flow: column wrap;
	align-items: center; /* 가로 중앙 정렬을 위해 추가 */
	margin-top: 5rem;
	margin-bottom: 5rem;
}

.updownbnt {
	background-color: #e28b3a;
	color: white;
	width: 25px;
	height: 25px;
	border: none;
}

.product-detail {
	width: 1000px;
	display: flex;
    flex-direction: column;
    align-items: center;
}

.detail-top {
	display: flex;
	flex-wrap: nowrap;
	height: 28rem;
	margin-bottom: 230px;
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
	width: 100%; 
	height: 100%; 
	object-fit: cover; 
	padding-left: 5px;"
}

.order-area {
	flex-grow: 1;
	height: 28rem;
}

/* 상품정보 */
.product-title {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 27px;
	font-weight: 400;
	color: #463528;
}

.product-price {
	font-size: 20px;
	padding-top: 40px;
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
	padding-top: 55px;
	padding-bottom: 70px;
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

#toggleButton {
	padding: 5px 20px; /* 위아래 패딩과 좌우 패딩을 조절 */
	border: 1px solid #d88402;
	border-radius: 10px;
	color: #d88402;
	background: #fff;
	display: inline-block;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	margin-top: 30px;
	border-radius: 20px;
}
/* 수정버튼 */
#modibnt {
	border-radius: 0;
	width: 300px;
	height: 50px;
	border: 0;
}

/* 리뷰 */
.review-container {
	overflow: hidden;
	width: 729px;
	height: auto;
	align: center;
	/* 	margin-top: 130px; /* 상단 여백 추가 */ */
	border-radius: 10px;
	border: 1px solid #f6eddf;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	text-align: center;
	/* 	margin: 0 auto; */
	padding: 20px;
}

.review-contents {
	margin-left: 50px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.review {
	display: flex;
}

#r_userid {
	text-align: left;
	font-weight: bold;
	color: #e28b3a;
}

.review-box {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
}

.comment {
	color: #e28b3a;
	margin-bottom: 10px;
}

.photo>img {
	border-radius: 10px;
}

.r_content {
	margin-top: 20px;
	text-align: left;
}
.empty-review{
	width: 500px;
    border: 1px solid #f6eddf;
    height: 100px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    display: flex;
    align-items: center;
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
					<div class="thumbnail-area" style="padding-right: 20px;">
						<div class="thumbnail">
							<img alt="상품썸네일" src="${pdetail.p_thumbnail}" >
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
													<img alt="찜하기" src="/dog/image/Footprint_s.png"
														width="50px" height="50px">
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
								<button id="decrease" class="updownbnt">-</button>
								<span id="quantity">1</span>
								<button id="increase" class="updownbnt">+</button>
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
								</span> 
								
								<a id="kakaotalk-sharing-btn" href="javascript:;"><img src="/dog/image/icon-kakao.png"></a>
							</div>
						</div>

						<!-- 장바구니 버튼 -->
						<button class="btn btn-primary py-2" id="addToCart"
							style="background-color: #e28b3a;">add to cart</button>
					</div>
				</div>



				<!-- 리뷰 -->
				<c:choose>
					<c:when test="${empty rdto}">
						<div class="empty-review">아직 등록된 리뷰가 없습니다</div>
					</c:when>
					<c:otherwise>
						<div class="review-box">
							<div class="comment">
								<a href="review-list?product_id=${pdetail.product_id}"
									align="right">리뷰 전체보기</a>
							</div>

							<div class="review-container" style="border-radius: 10px;">
								<div class="review">
									<div class="photo">
										<img src="/dog/image/${rdto.r_photo}" width="100px"
											height="100px">
									</div>

									<div class="review-contents">
										<div id="r_userid">${rdto.userId}</div>
										<div class="rate">
											<c:forEach begin="1" end="${rdto.rate}" varStatus="loop">
												<i class="fa fa-star" style="color: orange;"></i>
											</c:forEach>
										</div>
										<div class="r_content">${rdto.r_content}</div>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

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
							<img alt="상세페이지" src="${pdetail.p_image}"
								style="margin-top: 50px;">
						</div>
						<c:choose>
							<c:when test="${not empty pdetail.p_info}">
								<button id="toggleButton">자세히보기</button>
								<div class="product-info">
									<div class="info">${pdetail.p_info}</div>
								</div>
							</c:when>
							<c:otherwise>
								<script>
									var product-info = document
											.getElementById("product-info");
									if (product-info) {
										product-info.style.height = "5px";
									}
								</script>
								<p class="no-info" style="color: white;">상품설명란</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- 수정버튼 -->
				<c:choose>
					<c:when test="${loginstate == true && member.auth_id == 0}">
						<div
							style="text-align: center; margin-top: 30px; margin-bottom: 70px;">
							<button class="btn btn-primary py-2" id="modibnt"
								style="background-color: #e28b3a;"
								onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">수정</button>
						</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div>


</c:forEach>


<!-- 카카오공유하기 -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
  integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
<script>
  Kakao.init('스크립트 앱키를 입력하세요'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script>
  Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '클로기',
      description: '댕댕이의 선택! 클로기:-)',
      imageUrl:
        'https://vitapet.com/media/sz1czkya/benefits-of-getting-a-puppy-900x600.jpg?anchor=center&mode=crop&width=1240&rnd=132503927246630000',
      link: {
        webUrl: window.location.href,
      },
    },
  });
</script>
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


	//url 공유하기
	//내장 클립보드 api사용
	function clip() {
		  var url = window.location.href; // 현재 페이지의 URL 가져오기
		  navigator.clipboard.writeText(url) // URL을 클립보드에 복사
		    .then(function() {
		      alert("URL이 복사되었습니다.");
		    })
		    .catch(function(error) {
		      console.error("클립보드 복사 실패: ", error);
		    });
		}
	
	//상세설명 접었다 피기
    const productInfo = document.querySelector(".product-info");
    const toggleButton = document.getElementById("toggleButton");

    // 초기에는 product-info를 숨겨둘 것이므로 display 속성을 'none'으로 설정
    productInfo.style.display = "none";

    // 버튼 클릭 시 product-info를 토글 (보이거나 숨김)
    toggleButton.addEventListener("click", function() {
      if (productInfo.style.display === "none") {
        productInfo.style.display = "block"; // 보이게 함
      } else {
        productInfo.style.display = "none"; // 숨김
      }
    });
</script>
</body>
</html>
