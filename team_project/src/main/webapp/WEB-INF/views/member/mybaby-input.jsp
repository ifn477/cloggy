<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(document).ready(function() {
		$('#target_img').click(function(e) {
			$('#file').click(); // 파일 업로드 창 열기
			e.preventDefault();
		});

		// 파일 선택 시 파일 경로를 표시
		$('#file').change(function() {
			var filename = $(this).val().split('\\').pop(); // 파일 이름만 추출
			$('#target_img').attr('src', 'image/camera.png'); // 업로드한 이미지 대신 기본 이미지로 설정
			$('input[name="target_url"]').val(filename); // 업로드한 파일 이름을 hidden input에 설정

			// 파일 업로드 후 자동으로 크롭 팝업 띄우기
			openCropModal();
		});

		// 성별 버튼 클릭 시 색깔 변경
		$('.genderbtn').click(function() {
			// 모든 성별 버튼의 색상 초기화
			$('.genderbtn').css('background-color', '');

			// 클릭된 버튼의 색상을 변경
			$(this).css('background-color', 'orange');
			$(this).css('color', 'white');

			return false; // 폼 제출 방지
		});

		// 체형 버튼 클릭 시 색깔 변경
		$('.bodytypebtn').click(function() {
			// 모든 성별 버튼의 색상 초기화
			$('.bodytypebtn').css('background-color', '');

			// 클릭된 버튼의 색상을 변경
			$(this).css('background-color', 'orange');
			$(this).css('color', 'white');

			return false; // 폼 제출 방지
		});
	});

	크롭 팝업 열기
	function openCropModal() {
		$('#cropModal').modal('show'); // 모달 팝업 열기
		var image = document.getElementById('target_img');
		var cropper = new Cropper(image, {
			aspectRatio : 1, // 크롭 비율 (1:1)
			viewMode : 1, // 크롭 박스 안에 이미지가 꽉 차도록 설정
		});
	}

	크롭 완료 후 이미지 업로드
	function uploadCroppedImage() {
		var croppedData = cropper.getCroppedCanvas().toDataURL();

		// 업로드 코드 추가
	}

	모달이 닫힐 때 크롭 데이터 초기화
	$('#cropModal').on('hidden.bs.modal', function() {
		var image = document.getElementById('target_img');
		var cropper = new Cropper(image, {
			aspectRatio : 1,
			viewMode : 1,
		});
	});
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
</head>

<body>
	<form action="mybaby-save" method="post" enctype="multipart/form-data">
		<div class="babyTable">
			<div class="baby_photo">
				<img src="image/camera.png" id="target_img" height="200px"> <input
					type="file" id="file" name="baby_photo" style="display: none;"
					accept=".jpg, .png"> <input type="hidden" name="target_url">
			</div>
			<!-- 크롭 팝업 모달 -->
			<div class="modal fade" id="cropModal" tabindex="-1" role="dialog"
				aria-labelledby="cropModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="cropModalLabel">크롭 이미지</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<img src="" id="target_img" style="max-width: 100%;">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary"
								onclick="uploadCroppedImage()">크롭 완료</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 크롭 팝업 모달 끝 -->
			<div class="baby_name">
				이름을 입력해주세요 <input type="text" name="baby_name">
			</div>
			<div class="baby_type">
				견종을 등록해주세요 <select>
					<option value="">-- 강아지 종류를 선택하세요 --</option>
					<option value="믹스">세상에서 하나뿐인 믹스</option>
					<option value="골든 리트리버">골든 리트리버</option>
					<option value="그레이트 덴">그레이트 덴</option>
					<option value="그레이트 피레니즈">그레이트 피레니즈</option>
					<option value="꼬똥드툴레아">꼬똥드툴레아</option>
					<option value="닥스훈트">닥스훈트</option>
					<option value="달마시안">달마시안</option>
					<option value="댕견">댕견</option>
					<option value="도베르만">도베르만</option>
					<option value="라사압소">라사압소</option>
					<option value="라이카">라이카</option>
					<option value="래브라도 리트리버">래브라도 리트리버</option>
					<option value="러프 콜리">러프 콜리</option>
					<option value="로트와일러">로트와일러 </option>
					<option value="롯드와일러">롯드와일러</option>
					<option value="말티스">말티스</option>
					<option value="미니어쳐 핀셔">미니어쳐 핀셔</option>
					<option value="미니어쳐슈나우저">미니어쳐슈나우저</option>
					<option value="바센지">바센지</option>
					<option value="바셋 하운드">바셋 하운드</option>
					<option value="버니즈 마운틴 독">버니즈 마운틴 독</option>
					<option value="베들링턴 테리어">베들링턴 테리어</option>
					<option value="벨지안 말리노이즈">벨지안 말리노이즈</option>
					<option value="보더콜리">보더콜리</option>
					<option value="보르조이">보르조이</option>
					<option value="보스턴테리어">보스턴테리어</option>
					<option value="불 마스티프">불 마스티프</option>
					<option value="불 테리어">불 테리어</option>
					<option value="불독">불독</option>
					<option value="불테리어">불테리어</option>
					<option value="브리타니 스파니엘">브리타니 스파니엘</option>
					<option value="비글">비글</option>
					<option value="비숑 프리제">비숑 프리제</option>
					<option value="비즐라">비즐라</option>
					<option value="빠삐용">빠삐용</option>
					<option value="사모예드">사모예드</option>
					<option value="삽살개">삽살개</option>
					<option value="샤페이">샤페이</option>
					<option value="세인트 버나드">세인트 버나드</option>
					<option value="셔틀랜드쉽독">셔틀랜드쉽독</option>
					<option value="슈나우저">슈나우저</option>
					<option value="시바견">시바견</option>
					<option value="시베리안 허스키">시베리안 허스키</option>
					<option value="시츄">시츄</option>
					<option value="실키테리어">실키테리어</option>
					<option value="아메리칸 코카 스파니엘">아메리칸 코카 스파니엘</option>
					<option value="아메리칸코카스파니엘">아메리칸코카스파니엘</option>
					<option value="아이리쉬 울프하운드">아이리쉬 울프하운드</option>
					<option value="아키타">아키타</option>
					<option value="알래스카 말라뮤트">알래스카 말라뮤트</option>
					<option value="오스트랄리안 세퍼드">오스트랄리안 세퍼드</option>
					<option value="올드 잉글리쉬 쉽독">올드 잉글리쉬 쉽독</option>
					<option value="와이어 폭스 테리어">와이어 폭스 테리어</option>
					<option value="요크셔테리어">요크셔테리어</option>
					<option value="웨스트하이랜드화이트테리어">웨스트하이랜드화이트테리어</option>
					<option value="웰시코기">웰시코기</option>
					<option value="잉글리쉬 코커 스파니엘">잉글리쉬 코커 스파니엘</option>
					<option value="재패니스 스피츠">재패니스 스피츠</option>
					<option value="재패니즈 친">재패니즈 친</option>
					<option value="잭 러셀 테리어">잭 러셀 테리어</option>
					<option value="저먼 세퍼드">저먼 세퍼드</option>
					<option value="저먼 셰퍼드 독">저먼 셰퍼드 독</option>
					<option value="제주개">제주개</option>
					<option value="진돗개">진돗개</option>
					<option value="차우 차우">차우 차우</option>
					<option value="치와와">치와와</option>
					<option value="카디건 웰시코기">카디건 웰시코기</option>
					<option value="카우카시안 오브차카">카우카시안 오브차카</option>
					<option value="케인코르소">케인코르소</option>
					<option value="콜리">콜리</option>
					<option value="킹 찰스 스파니엘">킹 찰스 스파니엘</option>
					<option value="토이푸들">토이푸들</option>
					<option value="퍼그">퍼그</option>
					<option value="페키니즈">페키니즈</option>
					<option value="펨브록 웰시 코기 ">펨브록 웰시 코기</option>
					<option value="포메라니안">포메라니안</option>
					<option value="포인터">포인터</option>
					<option value="폭스테리어">폭스테리어</option>
					<option value="푸들">푸들</option>
					<option value="풍산개">풍산개</option>
					<option value="프랜치 불독">프랜치 불독</option>
					<option value="프렌치불독">프렌치불독</option>
					<option value="핏불테리어">핏불테리어</option>
					<option value="휘핏">휘핏</option>
				</select>
			</div>
			<div class="baby_birth" name="baby_birth">
				생일을 입력해주세요 <select>
					<option name="baby_birth_year" value="">-- 년 --</option>
					<option name="baby_birth_year" value="2023" >2023년</option>
					<option name="baby_birth_year" value="2022" >2022년</option>
					<option name="baby_birth_year" value="2021" >2021년</option>
					<option name="baby_birth_year" value="2020" >2020년</option>
					<option name="baby_birth_year" value="2019" >2019년</option>
					<option name="baby_birth_year" value="2018" >2018년</option>
					<option name="baby_birth_year" value="2017" >2017년</option>
					<option name="baby_birth_year" value="2016" >2016년</option>
					<option name="baby_birth_year" value="2015" >2015년</option>
					<option name="baby_birth_year" value="2014" >2014년</option>
					<option name="baby_birth_year" value="2013" >2013년</option>
					<option name="baby_birth_year" value="2012" >2012년</option>
					<option name="baby_birth_year" value="2011" >2011년</option>
					<option name="baby_birth_year" value="2010" >2010년</option>
				</select> <select>
					<option name="baby_birth_month" value="">-- 월 --</option>
					<option name="baby_birth_month" value="12">12월</option>
					<option name="baby_birth_month" value="11">11월</option>
					<option name="baby_birth_month" value="10">10월</option>
					<option name="baby_birth_month" value="9">9월</option>
					<option name="baby_birth_month" value="8">8월</option>
					<option name="baby_birth_month" value="7">7월</option>
					<option name="baby_birth_month" value="6">6월</option>
					<option name="baby_birth_month" value="5">5월</option>
					<option name="baby_birth_month" value="4">4월</option>
					<option name="baby_birth_month" value="3">3월</option>
					<option name="baby_birth_month" value="2">2월</option>
					<option name="baby_birth_month" value="1">1월</option>
				</select> <select name="birth_day">
					<option value="">-- 일 --</option>
					<!-- 1일부터 31일까지 옵션 추가 -->
					<option name = "baby_birth_day" value="31">31일</option>
					<option name = "baby_birth_day" value="30">30일</option>
					<option name = "baby_birth_day" value="29">29일</option>
					<option name = "baby_birth_day" value="28">28일</option>
					<option name = "baby_birth_day" value="27">27일</option>
					<option name = "baby_birth_day" value="26">26일</option>
					<option name = "baby_birth_day" value="25">25일</option>
					<option name = "baby_birth_day" value="24">24일</option>
					<option name = "baby_birth_day" value="23">23일</option>
					<option name = "baby_birth_day" value="22">22일</option>
					<option name = "baby_birth_day" value="21">21일</option>
					<option name = "baby_birth_day" value="20">20일</option>
					<option name = "baby_birth_day" value="19">19일</option>
					<option name = "baby_birth_day" value="18">18일</option>
					<option name = "baby_birth_day" value="17">17일</option>
					<option name = "baby_birth_day" value="16">16일</option>
					<option name = "baby_birth_day" value="15">15일</option>
					<option name = "baby_birth_day" value="14">14일</option>
					<option name = "baby_birth_day" value="13">13일</option>
					<option name = "baby_birth_day" value="12">12일</option>
					<option name = "baby_birth_day" value="11">11일</option>
					<option name = "baby_birth_day" value="10">10일</option>
					<option name = "baby_birth_day" value="9">9일</option>
					<option name = "baby_birth_day" value="8">8일</option>
					<option name = "baby_birth_day" value="7">7일</option>
					<option name = "baby_birth_day" value="6">6일</option>
					<option name = "baby_birth_day" value="5">5일</option>
					<option name = "baby_birth_day" value="4">4일</option>
					<option name = "baby_birth_day" value="3">3일</option>
					<option name = "baby_birth_day" value="2">2일</option>
					<option name = "baby_birth_day" value="1">1일</option>
					<!-- 1일부터 31일까지의 일을 추가 -->
				</select>
			</div>
			<div>성별을 선택해 주세요
			 <button class="genderbtn" name="babygender">남아</button>
			 <button class="genderbtn" name="babygender">여아</button>
			</div>
			<div>체형을 선택해 주세요
			 <button class="bodytypebtn" name ="bodytype">날씬</button>
			 <button class="bodytypebtn" name ="bodytype">보통</button>
			 <button class="bodytypebtn" name ="bodytype">통통</button>
			</div>
		</div>
		<input type="submit" value="작성완료">
	</form>
</html>