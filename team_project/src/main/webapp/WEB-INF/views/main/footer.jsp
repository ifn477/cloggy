<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* footer */
.footercontainer{
   background-color: #fff6e9;
}
.py-5{
   font-family: 'Noto Sans KR', sans-serif;
   width: 100%;
}
.py-5 h5{
	font-size: 15px;
	font-weight: 400;
	margin-bottom: 20px;
}
.py-5 li{
	font-size: 14px;
	font-weight: 300;
}
#scrollToTopButton{
	width: 30px;
	height: 30px;
	border-radius: 30px;
	border: none;
    margin-bottom: 50px;
    background: none;
    position: fixed;
    right: 35px; /* 오른쪽 여백 조절 */
    bottom: 10px; /* 아래 여백 조절 */
    opacity: 0;
}
#scrollToTopButton i{
	width: 50px;
	color: #e28b3a;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button id="scrollToTopButton"><h2><i class="bi bi-chevron-double-up"></i></h2></button>

<!-- footer -->
<div class="footercontainer">
<div class="container">
  <footer class="py-5">
    <div class="row">
      <div class="col-3 mb-3">
        <h5>Shop Information</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2">회사명: (주)클로기</li>
          <li class="nav-item mb-2">사업자번호: 218-2310561-12</li>
          <li class="nav-item mb-2">사업주: 법인 클로기</li>
          <li class="nav-item mb-2">소재지: 경기도 수원시 권선구 AK 6층</li>
        </ul>
      </div>

      <div class="col-3 mb-3">
        <h5>C/S Center</h5>
		<ul class="nav flex-column">
  			<li class="nav-item mb-2">전화번호: 1588-2700</li>
  			<li class="nav-item mb-2">통화가능시간: 9:00AM - 6:00PM</li>
  			<li class="nav-item" style="position: relative;">
   			 카카오톡 상담하기
   			<img src="/dog/image/kakao.png" alt="Kakao" style="margin-left: 10px; height: 30px; position: absolute;">
			<button id="kakao-talk-channel-chat-button" data-channel-public-id="_xenxmCG" data-title="consult"  data-support-multiple-densities="true"
  			style="background: none; border: none; padding: 0; opacity: 0; position: absolute;"
			></button>
  			</li>
		</ul>
	 </div>

      <div class="col-3 mb-3">
        <h5>Bank Info</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2">계좌번호: 우리은행 20150-45-786510</li>
          <li class="nav-item mb-2">계좌주: 김은주</li>
        </ul>
      </div>

      <div class="col-3 mb-3">
        <h5>교환/반품 주소</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2">경기도 군포시 부곡동 451번지<br> 한국복합물류 N동 서관 7층</li>
          <li class="nav-item mb-2">451, Bugock-dong, Gunpo-si,<br>  Gyeonggi-do, Republic of Korea</li>
        </ul>
      </div>
  </footer>
</div>
</div>
<script type="text/javascript">
/* 카카오 상담 */
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.channel.min.js';
    js.integrity = 'sha384-bg2pMhokxyx1zeEM2ol2hJtBagKMjRIZDVI/KITe+j2U5K+Or6HPY1lWDWY8ubEN';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');

    // JavaScript를 사용하여 스크롤 위치에 따라 버튼을 표시/숨김
    window.addEventListener('scroll', function() {
        var button = document.getElementById('scrollToTopButton');
        if (window.scrollY > 150) { // 스크롤 위치가 150px 이상일 때
            button.style.opacity = '1'; // 버튼을 표시
        } else {
            button.style.opacity = '0'; // 버튼을 숨김
        }
    });

    // 버튼 클릭 시 페이지 맨 위로 스크롤
    document.getElementById('scrollToTopButton').addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
</script>
</body>
</html>