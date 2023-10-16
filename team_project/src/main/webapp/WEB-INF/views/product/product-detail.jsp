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
<table align="center" width="1000px"  style="margin-top: 130px;">
<tr> 
		<td rowspan="3" align="left" width="40%">
		<img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail }" width="350px;" height="400px;"></td>
		<td align="left" style="font-size: 50px; padding-left: 10px;">${pdetail.p_name }</td> 
</tr> 
<tr> 
		<td></td> 
</tr> 

<tr> 
		<td align="left" style="font-size: 30px; padding-left: 10px; ">${pdetail.p_price }원 &nbsp; &nbsp; &nbsp;
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
</body>
</html>