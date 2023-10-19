<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.likeDeleteButton{
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
}
.likeAddButton{
    background: none;
    border: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
/* 쿠키 생성 및 저장 */
function onPageLoad() {
  var url = window.location.href;
  var product_Id = getProduct_IDFromURL(url);
  console.log("product_Id::" + product_Id);

  if (product_Id) {
    var recentProducts = getCookie('recent_products');
    var recentProductIds = recentProducts ? recentProducts.split('/') : [];
   
    if (!recentProductIds.includes(product_Id)) {
      recentProductIds.push(product_Id);
    }

    if (recentProductIds.length > 10) {
      recentProductIds.shift();
    }

    recentProducts = recentProductIds.join('/');

    var expirationDate = new Date();
    expirationDate.setTime(expirationDate.getTime() + (24 * 60 * 60 * 1000));
    console.log("expirationDate::" + expirationDate);
    setCookie('recent_products', recentProducts, expirationDate);
  }
}

window.addEventListener('load', onPageLoad);


function setCookie(cookieName, value, expirationDate) {
  var cookieValue = escape(value) + ((expirationDate == null) ? '' : '; expires=' + expirationDate.toUTCString());
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
                console.log(isLikeButton ? '추가 성공' : '삭제 성공');
                location.reload();
            },
            error: function (error) {
                console.error('오류 발생', error);
            }
        });
    });
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container_box">
<c:forEach items="${list}" var="pdetail">
<table align="center" width="1000px"  style="margin-top: 130px;">'
<tr>
				<td><input type="hidden" id="product_id"
					value="${pdetail.product_id}"></td>
			</tr>
<tr> 
		<td rowspan="3" align="left" width="40%">
		<img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail }" width="350px;" height="400px;"></td>
		<td align="left" style="font-size: 50px; padding-left: 10px;">${pdetail.p_name }</td> 
</tr> 


<tr> 
		<td align="left" style="font-size: 30px; padding-left: 10px; "><span id="price">
						<fmt:formatNumber pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber>
					</span> &nbsp; &nbsp; &nbsp;
<!-- 찜하기 -->
    <c:choose>
        <c:when test="${empty likelist}">
                    <button class="likeAddButton" data-productid="${pdetail.product_id}" data-userid="${member.userId}">
                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="70px" height="70px">
                    </button>
        </c:when>
        <c:otherwise>
            <c:choose>
           		<c:when test="${fn:contains(likelist, pdetail.product_id)}">
                    <button class="likeDeleteButton" data-productid="${pdetail.product_id}" data-userid="${member.userId}">
                        <img alt="찜해제" src="/dog/image/Footprint_full_pink_s.png" width="70px" height="70px">
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="likeAddButton" data-productid="${pdetail.product_id}" data-userid="${member.userId}">
                        <img alt="찜하기" src="/dog/image/Footprint_s.png" width="70px" height="70px">
                    </button>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
<!-- 찜하기 -->
</td>
</tr> 
<tr>
			<!-- 옵션 선택 -->
			<td><select class="haha" id="haha" name="haha">
					<option data-opt_price=0 data-opt_id=0>옵션을 선택해주세요</option>
					<c:forEach items="${optlist}" var="opt">
						<!-- 데이터를 data-* 속성에 저장합니다. -->
						<option data-opt_name="${opt.opt_name}"
							data-opt_price="${opt.opt_price}"
							data-opt_id="${opt.opt_id}">${opt.opt_name} &emsp;
							(+${opt.opt_price})</option>
					</c:forEach>
			</select>

					<div class="button-container">
						<button id="decrease">-</button>
						<span id="quantity">1</span>
						<button id="increase">+</button>
					</div>
			Total Price: <span id="totalPrice"><fmt:formatNumber
							pattern="#,##0원">${pdetail.p_price}</fmt:formatNumber></span>
			<button id="addToCart">장바구니 추가</button>
			</tr>


<tr>
		<td colspan="2" style="padding-top: 150px;">
		${pdetail.p_info }<br>
		<img alt="상세페이지" src="/dog/image/${pdetail.p_image}" width="700px;">
		</td>
</tr> 
<tr> 
		<td colspan="2" style="text-align: right;"> 
			<input type="button" value="수정" onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">
		</td>
</table>
</c:forEach>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var quantity = 1; // 초기 수량은 1으로 설정
							let priceValue = parseFloat($("#price").text().replace(/[^0-9.-]+/g, ""));

							// 옵션 선택 시 이벤트 핸들러
							$("#haha").change(function() {
							  var selectedOption = $(this).find("option:selected");
							  var optName = selectedOption.data("opt_name");
							  var optPrice = selectedOption.data("opt_price");
							
							  // 제품 가격 -> optPrice + 기존 가격으로 업데이트
							  var updatedPrice = priceValue + optPrice;
							  $("#price").text(formatNumberWithCommas(updatedPrice)); // 업데이트된 가격을 화면에 출력
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

							$("#addToCart").click(function() {
								var product_id = $("#product_id").val();
								var selectedOption = $("#haha option:selected").val();

								 var selectedOption = $("#haha").find("option:selected");
							     var optId = selectedOption.data("opt_id");

							      // 추출된 데이터 사용
								console.log("product id: " + product_id);
								console.log("quantity: " + quantity);
								console.log("선택한 옵션의 번호: " + optId);

								// Ajax를 사용하여 서버로 데이터 전송
								$.ajax({
									type : "POST", // 또는 "GET"에 따라 적절하게 변경
									url : "/dog/addtocart", // 컨트롤러의 URL을 여기에 지정
									data : {
										product_id : product_id,
										quantity : quantity,
										optId: optId
									},
									success : function(response) {
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