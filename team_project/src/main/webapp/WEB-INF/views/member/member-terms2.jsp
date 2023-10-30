<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{
	font-family: 'Noto Sans KR', sans-serif;
}
#popupWindow2{
	font-size: 12px;
	padding: 20px;
	background-color: #f6eddf;
	margin: 20px;
}
.logoimg{
   height: 3rem;
   display: flex; 
   justify-content: center; 
   align-items: center; 
   margin: 2rem;
}
</style>
<script type="text/javascript" src="/dog/js/member.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="logoimg">
<img alt="로고" src="/dog/resources/mainimage/cloggy임시.jpg" class="logoimg">
</div>
<div id="popupWindow2" style="text-align: left;">
할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.<br>
단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.<br>
선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br>
</div>
<div style="text-align: center;">
	<button onclick="closePopup();" style="background-color: transparent; border: 0; margin-bottom: 3rem; background-color: buttonface; font-weight: 400; width: 150px; border-radius: 0; border: 0; font-size: 15px; height: 30px;">확인</button>
</div>
</body>
</html>