<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<header style="text-align: center; background-color:#FFB8E0; ">
	<h1 id="title">☆우리조 화이팅☆</h1>
</header>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main" id="maintext">MAIN</a>
    </div>
    <ul class="nav navbar-nav">
    
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="member-input">회원입력</a></li>
          <li><a href="#">카테1-2</a></li>
          <li><a href="#">카테1-3</a></li>
        </ul>
      </li>
    
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자상품관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="product-input">상품입력</a></li>
          <li><a href="product-out">상품출력</a></li>
          <li><a href="#">카테1-3</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">사료<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="product-out-total?category1_id=1">전체보기</a></li>
					<li><a href="product-out?category1_id=1&category2_id=11">퍼피</a></li>
					<li><a href="product-out?category1_id=1&category2_id=12">어덜트</a></li>
					<li><a href="product-out?category1_id=1&category2_id=13">시니어</a></li>
					<li><a href="product-out?category1_id=1&category2_id=14">전연령</a></li>
					<li><a href="product-out?category1_id=1&category2_id=15">습식사료</a></li>
					<li><a href="product-out?category1_id=1&category2_id=16">자연식</a></li>
					<li><a href="product-out?category1_id=1&category2_id=17">에어/동결사료</a></li>
					<li><a href="product-out?category1_id=1&category2_id=18">건식사료</a></li>
					<li><a href="product-out?category1_id=1&category2_id=19">소프트사료</a></li>
					<li><a href="product-out?category1_id=1&category2_id=20">처방식</a></li>
				</ul></li>
				
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">간식<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="product-out-total?category1_id=2"> 전체보기 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=21"> 수제간식 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=22"> 빵/케이크 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=23"> 덴탈껌 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=24"> 뼈간식 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=25"> 껌 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=26"> 동결/건조 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=27"> 저키 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=28"> 사사미/육포 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=29"> 캔/파우치 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=30"> 소시지 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=31"> 비스켓/쿠키 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=32"> 파우더/토핑 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=33"> 우유/분유/음료 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=34"> 영양/기능 </a></li>
					<li><a href="product-out?category1_id=2&category2_id=35"> 처방식 </a></li>
				</ul></li>



			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">용품<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="product-out-total?category1_id=3"> 전체보기 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=41"> 배변용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=42"> 위생용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=43"> 칫솔/치약 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=44"> 미용/관리 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=45"> 목욕용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=46"> 장난감 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=47"> 노즈워크 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=48"> 훈련용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=49"> 산책용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=50"> 하우스/방석 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=51"> 울타리/안전문 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=52"> 이동장/유모차 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=53"> 가방/카시트 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=54"> 의류/악세사리 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=55"> 급식기/급수기 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=56"> 정수/자동급식기 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=57"> 기저귀 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=58"> 사료통/사료삽 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=59"> 넥카라/수술 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=60"> 반려인용품 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=61"> 파티 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=62"> 스텝/매트 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=63"> 건강관리 </a></li>
					<li><a href="product-out?category1_id=3&category2_id=64"> 외장칩 </a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">결제<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="order"> 결제 </a></li>
					<li><a href="naverpay"> 네이버페이간편결제 </a></li>
				
				</ul></li>	
				
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">회사정보<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="info"> 회사정보 </a></li>
					 <li><a href="qna-input">Q&A입력</a></li>
        			 <li><a href="qna-out">Q&A게시판</a></li>
       				 <li><a href="#">카테2-3</a></li>
				</ul></li>	
      
     </ul>
<c:choose>
	<c:when test="${loginstate==true}">
		    <ul class="nav navbar-nav navbar-right">
      			<li><a href="#"><span class="glyphicon glyphicon-user"></span>${member.userId}님 반갑습니다!</a></li>
      			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="member-out">출력/ 수정/ 삭제</a></li>
						<li><a href="member-searchForm">검색</a></li>
						<li class="divider">
						<li><a href="member-searchForm">내정보</a></li>
						<li><a href="member-searchForm">회원 탈퇴</a></li>
					</ul>
				</li>
      			<li><a href="logout"><span class="glyphicon glyphicon-log-in"></span>Logout</a></li>
   			</ul>
	</c:when>
	<c:otherwise>
		    <ul class="nav navbar-nav navbar-right">
      			<li><a href="member-input"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      			<li><a href="login-input"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   			</ul>
	</c:otherwise>
</c:choose>
  </div>
</nav>

</html>