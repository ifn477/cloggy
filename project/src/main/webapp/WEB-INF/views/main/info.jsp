<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#map {
    width: 500px;
    height: 350px;
    margin: 0 auto; /* 가로 중앙 정렬을 위한 margin 속성 추가 */
}
</style>
    <meta charset="utf-8">
    <title>마커 생성하기</title>
    
</head>
<body>
<h3>회사명 미정</h3><br>


<b>E-mail</b> custom_center@dangdang2.co.kr<br>
<b>문의전화</b> 031-456-5678<br>
<b>고객센터 이용시간</b> 월~금 09:00 ~ 18:00 (12:00 ~ 13:00 점심시간)<br>
경기 파주시 회동길 125-11 효형출판 2층 (우)10881<br><br>

<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b2e261752eb139b8bf49db8b9e7cf02"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.706601, 126.687244), // 지도의 중심좌표
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