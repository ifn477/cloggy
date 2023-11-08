<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#map {
    width: 550px;
    height: 500px;
    margin: 0 auto; /* 가로 중앙 정렬을 위한 margin 속성 추가 */
    margin-bottom: 10rem;
}
.company-info-area{
	width: 1100px;
	height: 800px;
	text-align: center;
	margin: 0 auto;
}
.company-info{
	margin-top: 7rem;
	width: 50%;
	height: 500px;
	float: left;
}
.info-title{
    font-family: 'Noto Sans KR', sans-serif;
	float: left;
	font-size: 20px;
	font-weight: 500;
	color: #827C75;
	padding-left: 10px;	
}
.info{
	margin-top: 20rem;
	text-align: left;
}
.info b{
	padding-right: 1rem;
	padding-left: 10px;
}
.info img{
	width: 150px;
	margin-bottom: 1rem;
}
.map-in{
	margin-top: 7rem;
	background-color: #d88402;
	width: 50%;
	height: 500px;
	float: right;
}
</style>
<meta charset="utf-8">
<title>마커 생성하기</title>
</head>
<body>
<div class="company-info-area">
	<div class="company-info-in">
		<div class="company-info">
			<div class="info-title">회사정보</div>
			<div class="info">
				<img alt="회사정보로고" src="/dog/resources/mainimage/cloggy임시.jpg"><br>
				<b>회사명</b> (주)클로기<br>
				<b>E-mail</b> custom_center@dangdang2.co.kr<br>
				<b>문의전화</b> 031-456-5678<br>
				<b>고객센터 이용시간</b> 월~금 09:00 ~ 18:00 (12:00 ~ 13:00 점심시간)<br>
				<b>주소</b> 경기 파주시 회동길 125-11 효형출판 2층 (우)10881<br><br>
			</div>
		</div>
		<div class="map-in">
			<div id="map"></div>
		</div>
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3eebd9335d1049afaa57ca1a1e68a170"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
//         center: new kakao.maps.LatLng(37.706601, 126.687244), // 지도의 중심좌표
        center: new kakao.maps.LatLng(37.707401, 126.687244), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.707401, 126.687244); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
</body>
</html>