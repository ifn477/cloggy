<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/widthtable.css">
<style type="text/css">
.coupondownload-area {
    height: 50rem;
    margin-top: 10rem;
}

.coupon_box {
    text-align: center;
    margin: 0 auto;
    margin-top: 1rem;
    width: 500px;
    height: 200px;
    border-radius: 5px;
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    justify-content: space-between;
    position: relative; /* 추가: 상대 위치 설정 */
}
.coupon_box img{
    width: 95%;
    height: 100%;	
}
.coupon-name {
    color: white;
    font-size: 20px;
    font-weight: 500;
    position: absolute; /* 추가: 절대 위치 설정 */
    bottom: 37px;
    margin-left: 20px;
}

.coupon-icon {
    position: absolute; 
    top: 65px; 
    right: 60px;
}
.coupon-discount{
    position: absolute; 
    margin-left: 1rem;
    color: white;
    font-size: 85px;
    font-weight: 600;
    bottom: 55px; 
}

.coupon-icon button {
    background: none;
    border: none;
    padding: 0;
}

.coupon-icon button i{
    font-size: 50px;
    color: white;
}

.coupon-box img {
    width: 100%;
    height: 100%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="coupondownload-area">
    <c:forEach items="${list}" var="coupondown">
        <div class="coupon_box">
            <img alt="쿠폰" src="/dog/image/coupon.jpg">
            <div class="coupon-discount">
                ${coupondown.c_discount}%
            </div>
	        <div class="coupon-name">
                ${coupondown.c_name}
            </div>
            <div class="coupon-icon">
<%--                 <a href="coupon-download?c_code=${coupondown.c_code}&c_enddate=${coupondown.c_enddate} --%>
<%-- 	 				     &c_stock=${coupondown.c_stock}&userId=${member.userId}"><i class="bi bi-chevron-bar-down"></i></a> --%>
            	<button onclick="downloadCoupon('${coupondown.c_code}', '${coupondown.c_enddate}', '${coupondown.c_stock}', '${member.userId}')">
                    <i class="bi bi-chevron-bar-down"></i>
                </button>
            
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    function downloadCoupon(couponCode, endDate, stock, userId) {
        // 여기에 AJAX 요청을 보내고 성공하면 알림창을 표시합니다.
        $.ajax({
            type: 'POST',
            url: 'coupon-download',
            data: {
                c_code: couponCode,
                c_enddate: endDate,
                c_stock: stock,
                userId: userId
            },
            success: function (response) {
            	if(response == "ok"){
	                alert('쿠폰 다운로드 성공');
            	}
            	else{
	                alert('제한된 쿠폰 수량을 다 받았습니다');
            	}
            },
            error: function (error) {
                console.error('오류 발생', error);
                alert('쿠폰 다운로드 실패');
            }
        });
    }
</script>

</body>
</html>
