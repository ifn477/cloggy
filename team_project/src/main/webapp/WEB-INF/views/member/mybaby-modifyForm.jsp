<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
min-height: calc(100vh - 500px);
}

.babyTable {
	margin-top : 50px;
	display: flex;
	height: 100%;
	flex-flow: column nowrap; /*direction+wrap*/
	gap: 10px;
	/* 중심축 기준 정렬 */
	justify-content: flex-start; /*위와 동일한데 갭을 일정하게*/
	/* 반대축(수평축) 기준 정렬 */
	align-items: center;
	align-content: center;
	flex-direction : column;
}

.baby_input_table {
	display: grid;
	grid-template-columns: 1fr 2fr;
	grid-auto-rows: minmax(30px, auto);
	grid-gap: 5px;
}

input[type=text], select {
	width: 1fr 2fr;
/* 	height: ; */
/* 	font-size: ; */
	border-color : #d88402;
	background-color : rgb(255, 246, 233);
	box-shadow: none;
	border: 2px solid #ffffff;
    box-shadow: 0 0 5px #ffffff;
}
input:focus { outline: none !important; border-color: #d88402; box-shadow: 0 0 5px #d88402; background-color :rgb(255, 246, 233); }

.baby_photo{
	margin-bottom : 20px;
}

button {
	background-color: rgb(255, 246, 233);
	border: none;
	  &:hover {
    background: #ED9309;
    color: rgb(255, 246, 233);
    }
}
.submitbtn{
	margin-top : 20px;
	background-color: #ED9309;
	text-align: center;
	margin-bottom: 2rem;
	width: 120px;
	height: 40px;
	color: white;
	border-radius: 0;
	border: 0;
}
img{
	width: 200px;
	height: 200px;
	border-radius: 50%;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
	    const realUpload = $('.real-upload');
	    const upload = $('#upload');

	    var baby_gender = null;
	    var baby_bodytype = null;
	    
// 	    upload.addEventListener('click', () => realUpload.click());
		upload[0].addEventListener('click', function() {
		    realUpload.click();
		});

	
		
		$('.genderbtn').click(function() {
		    // 모든 성별 버튼의 색상 초기화
		    $('.genderbtn').css('background-color', '');
		    $('.genderbtn').css('color', ''); // 추가 - 기존에 선택되었던 버튼의 텍스트 색상 초기화

		    // 클릭된 버튼의 색상을 변경
		    $(this).css('background-color', 'orange');
		    $(this).css('color', 'white');

		    var baby_gender = $(this).val(); // 선택된 버튼의 value 값 추출
		    
		    $('input[name="selectedGender"]').val(baby_gender); // hidden input 필드에 선택된 값을 설정

		    console.log("선택된 gender 값: " + baby_gender);

		    return false; // 폼 제출 방지
		});


		// 체형 버튼 클릭 시 색깔 변경
		$('.bodytypebtn').click(function() {
		    // 모든 성별 버튼의 색상 초기화
		    $('.bodytypebtn').css('background-color', '');
		    $('.bodytypebtn').css('color', ''); // 추가 - 기존에 선택되었던 버튼의 텍스트 색상 초기화

		    // 클릭된 버튼의 색상을 변경
		    $(this).css('background-color', 'orange');
		    $(this).css('color', 'white');

		    var baby_bodytype = $(this).val(); // 선택된 버튼의 value 값 추출
		    $('input[name="selectedBodyType"]').val(baby_bodytype); // hidden input 필드에 선택된 값을 설정

		    console.log("선택된 bodyType 값: " + baby_bodytype);

		    return false; // 폼 제출 방지
		});

		
		
		
		
		$('.real-upload').on('change', function() {
		    if (this.files && this.files[0]) {
		        var reader = new FileReader();

		        reader.onload = function(e) {
		            var img = new Image();
		            img.src = e.target.result;

		            img.onload = function() {
		                var canvas = document.createElement('canvas');
		                var ctx = canvas.getContext('2d');
		                var max = Math.max(img.width, img.height);

		                // 원 모양의 클리핑 영역을 생성
		                canvas.width = max;
		                canvas.height = max;
		                ctx.beginPath();
		                ctx.arc(max / 2, max / 2, max / 2, 0, 2 * Math.PI);
		                ctx.clip();

		                // 이미지를 원 모양으로 그립니다.
		                ctx.drawImage(img, 0, 0, max, max);

		                // 업로드된 이미지를 미리보기로 설정
		                $('#upload').attr('src', canvas.toDataURL());
		                $('#upload').show();
		            };
		        };

		        reader.readAsDataURL(this.files[0]);
		    }
		});
	});

</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
</head>

<body>
	<form action="mybaby-save" method="post" enctype="multipart/form-data">
		<div class="babyTable">
<c:forEach items="${babylist}" var="baby">
			<!-- 			사진 업로드 -->
			<div class="baby_photo">
				<img src="/dog/image/${baby.baby_photo}" id="upload" height="200px"> <input
					type="file" class="real-upload" name="baby_photo"
					style="display: none;" accept=".jpg, .png">
			</div>

			<div class="baby_input_table">
				<div>이름을 입력해주세요</div>
				<div class="baby_name">
					<input type="text" name="baby_name" value="${baby.baby_name}">
				</div>
		
				
				<div>견종을 등록해주세요</div>
				<div class="baby_type">
					<select name="baby_type"  value="${baby.baby_type}">
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
						<option value="로트와일러">로트와일러</option>
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
				<div>생일을 입력해주세요</div>
			<div class="baby_birth">
				<input type="date" name="baby_birth" value="${baby.baby_birth}">
				</div>
				<div>성별을 선택해 주세요</div>
				<div>
					<button class="genderbtn" name="baby_gender" value="남아">남아</button>
					<button class="genderbtn" name="baby_gender" value="여아">여아</button>
					<input type="hidden" name="selectedGender" value="">

				</div>
				<div>체형을 선택해 주세요</div>
				<div>
					<button class="bodytypebtn" name="baby_bodytype" value="날씬">날씬</button>
					<button class="bodytypebtn" name="baby_bodytype" value="보통">보통</button>
					<button class="bodytypebtn" name="baby_bodytype" value="통통">통통</button>
					<input type="hidden" name="selectedBodyType" value="">
				</div>
			</div>
			</c:forEach>
		<input type="submit" name="submit" class="submitbtn" value="작성완료">
		</div>
		
	</form>
</html>