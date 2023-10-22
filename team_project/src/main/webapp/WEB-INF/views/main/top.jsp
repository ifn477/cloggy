<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<style type="text/css">
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap');
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}
.nanumbarungothic * {
 font-family: 'NanumBarunGothic', sans-serif;
 }
/* 맨위 안내 라인   */
#topswiper {
  width: 100%;
  height: 2.2rem;
  line-height: 2.2rem;
  background-color: #d88402;
  overflow: hidden;
  position: relative; /* 부모 요소로부터 상대 위치를 사용합니다. */
}
#topwrapper {
  height: 100%; /* swiper-wrapper의 높이를 100%로 설정하여 swiper-container 내부 크기를 가득 채우도록 합니다. */
}
#topslide {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 13px;
  color: white;
  height: 100%; 
}
.swiper-container a{
text-decoration: none;
color: white;
}
/* 로고 */
.logoimg{
	height: 3rem;
}

/* 네비바 */
.navbar-nav .nav-link {
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 15px; /* 네비게이션 링크의 글꼴 크기 설정 */
}
.form-control.me-2 {
  width: 200px; /* 입력 필드의 너비 설정 */
  height: 30px;
  font-size: 13px; /* 입력 필드의 글꼴 크기 설정 */
}
.btn.btn-outline-success {
   height: 30px;
   line-height: 15px;
   border-color: #a26300;
   color: #a26300;
  font-size: 13px; /* 버튼의 글꼴 크기 설정 */
}
.nav-link:hover {
  color: #e48b00; /* 마우스 호버 시 변경할 색상으로 설정 */
}
.dropdown-menu {
	border-style: none;
	width: auto;
}
#searchicon{
  cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
}
#membericon:hover {
  cursor: pointer; 
}
#membericon{
	padding-left: 15px; 
	padding-right: 15px;
	padding-bottom: 5px;
}
#dropdown-menu-left {
    right: 0;
    left: auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 맨위안내 -->
  <div class="swiper-container" id="topswiper">
    <div class="swiper-wrapper" id="topwrapper">
      <div class="swiper-slide" id="topslide"><a href="login-input">♥로그인 후 클로기의 다양한 혜택을 만나보세요♥</a></div>
      <div class="swiper-slide" id="topslide">지금 클로기는 전품목 무료배송 이벤트 중!</div>
      <div class="swiper-slide" id="topslide">♥건강에도 좋고 맛있는 덴탈껌 10% SALE♥ ~2024.02.15 23:59PM</div>
    </div>
  </div>

  <script type="text/javascript">
    // Swiper를 초기화합니다.
    var mySwiper = new Swiper('.swiper-container', {
      direction: 'vertical', 
      slidesPerView: 1, 
      spaceBetween: 0,
      loop: true, 
      autoplay: {
        delay: 3000, // 슬라이드 간의 시간 간격 (3초로 설정)
        disableOnInteraction: false, // 사용자 상호작용 후에도 자동 재생을 계속 활성화
      },
    });
  </script>

<!-- 네비바 -->
<nav class="navbar navbar-expand-lg bg-transparent" style="margin-top: 1.7rem; margin-bottom: 0.5rem;">
  <div class="container-fluid">
	<!-- 로고 -->
      <a href="main" class="navbar-brand">
      <img alt="로고" src="/dog/resources/mainimage/cloggy임시.jpg" class="logoimg">
    </a>
  
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
          <li class="nav-item">
          <a class="nav-link" href="main" role="button" aria-expanded="false">main</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="#" role="button" aria-expanded="false">best♥</a>
          </li>
<!-- 관리자모드로 옮기기  -->
          		<li class="nav-item dropdown" onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
		    <a class="nav-link" href="#" role="button" aria-expanded="false">상품관리</a>
		    <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="product-input">상품입력</a></li>
		        <li><a class="dropdown-item" href="product-out">상품리스트</a></li>
		    </ul>
		</li>
<!--  제품카테시작   -->
		<li class="nav-item dropdown" onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
		    <a class="nav-link" href="#" role="button" aria-expanded="false">사료</a>
		    <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="product-out-total?category1_id=1">전체보기</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=13">퍼피(1세미만)-건식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=11">퍼피(1세미만)-습식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=12">퍼피(1세미만)-자연식</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=16">어덜트(1-7세)-건식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=14">어덜트(1-7세)-습식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=15">어덜트(1-7세)-자연식</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=19">시니어(7세이상)-건식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=17">시니어(7세이상)-습식사료</a></li>
		        <li><a class="dropdown-item" href="product-out-cate?category1_id=1&category2_id=18">시니어(7세이상)-자연식</a></li>
		    </ul>
		</li>

        <li class="nav-item dropdown"  onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
          <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">간식</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="product-out-total?category1_id=2">전체보기</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=2&category2_id=21">수제간식</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=2&category2_id=22">빵/케이크</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=2&category2_id=23">덴탈껌</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=2&category2_id=24">뼈간식</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=2&category2_id=25">껌</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown"  onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
          <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">용품</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="product-out-total?category1_id=3">전체보기</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=3&category2_id=31">위생용품</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=3&category2_id=32">칫솔/치약</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=3&category2_id=33">미용/관리</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=3&category2_id=34">목욕용품</a></li>
            <li><a class="dropdown-item" href="product-out-cate?category1_id=3&category2_id=35">장난감</a></li>
          </ul>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="#" role="button" aria-expanded="false">event</a>
          </li>
        <li class="nav-item dropdown"  onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
          <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">공지사항</a></li>
            <li><a class="dropdown-item" href="#">Q&A게시판</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown"  onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
          <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">쿠폰</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="coupon-input">쿠폰생성</a></li>
            <li><a class="dropdown-item" href="coupon-out">쿠폰조회</a></li>
            <li><a class="dropdown-item" href="coupon-downloadform">쿠폰다운로드</a></li>
            <li><a class="dropdown-item" href="coupon-list?userId=${member.userId }">쿠폰사용</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="검색하기" aria-label="Search">
      	<i class="bi bi-search" id="searchicon" onclick="location.href='#'"></i>
      </form>
        <li class="nav-item dropdown list-unstyled" onmouseenter="openDropdown(this)" onmouseleave="closeDropdown(this)">
        <a class="nav-link" href="search-all" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="membericon">
      	<i class="bi bi-person" style="font-size: 25px; color: #545454;"></i>
        </a>
        <ul class="dropdown-menu" id="dropdown-menu-left">
          <li><a class="dropdown-item" href="login-input">로그인</a></li>
          <li><a class="dropdown-item" href="member-input">회원가입</a></li>
        </ul>
        </li>
    </div>
  </div>
</nav>

<script type="text/javascript">
function openDropdown(element) {
    // 드롭다운 트리거와 드롭다운 메뉴 요소 가져오기
    const dropdownTrigger = element.querySelector('.nav-link');
    const dropdownMenu = element.querySelector('.dropdown-menu');

    // 드롭다운 메뉴를 열고 스타일을 조정
    dropdownMenu.style.display = 'block';
    dropdownMenu.style.position = 'absolute';
    dropdownMenu.style.willChange = 'transform';
    dropdownMenu.style.top = (dropdownTrigger.offsetTop + dropdownTrigger.offsetHeight) + 'px';
}

// 드롭다운 메뉴를 닫을 때
function closeDropdown(element) {
    const dropdownMenu = element.querySelector('.dropdown-menu');
    dropdownMenu.style.display = 'none';
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>