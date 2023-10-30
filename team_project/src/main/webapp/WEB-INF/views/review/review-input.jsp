<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script type="text/javascript">
	$(document).ready(function() {

		const realUpload = $('.real-upload');
		const upload = $('#upload');

		// 	    upload.addEventListener('click', () => realUpload.click());
		upload[0].addEventListener('click', function() {
			realUpload.click();
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
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" -->
<!-- 	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" -->
<!-- 	crossorigin="anonymous"></script> -->
<style type="text/css">
/* 별점 */
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

@font-face {
    font-family: 'ChosunSg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


.rate {
	display: inline-block;
	border: 0;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: black;
}

.rate>label:before {
	display: inline-block;
	font-size: 2rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: orange !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: orange !important;
}

/* 별점 끝 */
body {
	background-color: rgb(255, 251, 244);
	padding: 0;
	margin : 0;
	width: auto;
}

.container-fluid {
	display: flex;
	flex-direction: column;
	flex-flow: column wrap;
	align-items: center;
	margin-bottom: 5rem;
	width: 100%;
	margin-top: 0px;
}

/* 타이틀 */
.row-title {
	background-color: rgb(255, 251, 244);
 	position: sticky; 
	top: 0;
	z-index: 1; /* 다른 내용 위에 표시하기 위한 z-index 설정 */
	align-items: center;
	display: flex;
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	width:100%;
	height: 50px;
    justify-self: right;
	border-bottom : 2px solid #ffefd8;
	font-size: large;
	font-weight: bold;
}

.itemInfo {
	background-color: rgb(255, 251, 244);
	display: flex;
	flex-direction: row;
	flex-flow: row wrap;
	margin-top: 50px;
	justify-content: center;
	width:100vw;
	margin-bottom: 2px;
	margin-top: 2px;
	height: 120px;
    align-items: center;
	border-bottom: 5px solid #ffefd8;
}

.itemInfo2 {
	background-color: rgb(255, 251, 244);
	display: flex;
	flex-direction: column;
	flex-flow: column wrap;
    
}

.thumb {
	background-color: rgb(255, 251, 244);
	position: absolute;
	left: 20px;
}

img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	justify-self: center;
	border : rgb(255, 251, 244);
	margin : 8px;
}

.item-name {
	background-color:rgb(255, 251, 244);
	position: absolute;
	left: 120px;
	top : 80px;
	font-weight: bold;
}

.item-option {
	background-color: rgb(255, 251, 244);
	position: absolute;
	left: 120px;
	top : 110px;
	color: gray;
}

.rating {
	background-color: rgb(255, 251, 244);
	flex-shrink: 0;
    width:100vw;    
    text-align: center;
	
}

.rating-comment {
	background-color: white;
	width: 100vw;
	color: lightgray;
	margin-bottom: 10px;
}

.editor{
    display: flex;
    flex-direction: column;
    background-color: rgb(255, 251, 244);
    width:100vw;
    justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	border-top: 2px solid rgb(255, 246, 233);
}


.question {
	background-color: rgb(255, 251, 244);
	width: 100vw;
	text-align: center;
	height: 30px;
	margin-top : 20px;
	font-size: large;
	margin-bottom: 0px;
	font-weight: bold;
}

.rating-comment {
	background-color: rgb(255, 251, 244);
    width:100vw;
}

.comment {
	margin-top: 0;
	margin-bottom: -10px;
	background-color: rgb(255, 251, 244);
}

.content {
	background-color: rgb(255, 251, 244);
}

.btn_photo {
	background-color: rgb(255, 251, 244);
	border-color: orange;
	border-style: dashed ;
	width: 95vw;
	height: 50px;
	margin-bottom: 20px;
	border-width: 1px;
	font-weight: bold;
	text-align: center;
}
.btn-upload {
  background-color: rgb(255, 251, 244);
  width: 95vw;
  height: 50px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top : 20px;
  margin-bottom : 20px;
  &:hover {
    background: orange;
    color: rgb(255, 251, 244);
  }
}

#file {
  display: none;
}



.button {
	background-color: rgb(255, 251, 244);
}
.closebtn1{
	position : absolute;
	background-color: rgb(255, 251, 244);
	border: 0;
	margin: 0;
	padding: 0;
	font-size: 2rem;
	color : gray;
    right : 20px;
    font-family: 'ChosunSg';
}
textarea {
  width: 95vw;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 1px solid rgb(255, 186, 89);
  border-radius: 3px;
  background-color:  white;
  font-size: 14px;
  resize: none;
  margin-bottom: 10px;
}

#previewDiv > img{
  
}

.cancelImage{
position: absolute; 
top: 10px; 
right: 10px; 
background: none; 
border: none; 
color: gray; 
font-size: 20px; 
cursor: pointer;
}

</style>
</head>
<body>

	<form action="review-save" method="post" enctype="multipart/form-data"
		id="form1">
		<div class="container-fluid">
			<div class="row-title">
				리뷰 작성하기
<!-- 				 <i class="bi bi-x-lg">></i> -->
				<button type="button" class="closebtn1" onclick="window.close()">X</button>
			</div>
			<c:forEach items="${olist}" var="olist">
				<div class="itemInfo">
					<div class="thumb">
						<img src="/dog/image/${olist.p_thumbnail}" class="img">
					</div>
					<div class="itemInfo2">
						<div class="item-name">${olist.p_name}</div>
<!-- 						<div class="item-option"> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${olist.p_option == 0}"> 선택 : 없음 </c:when> --%>
<%-- 								<c:otherwise>${olist.p_option}</c:otherwise> --%>
<%-- 							</c:choose> --%>
<!-- 						</div> -->
					</div>
				</div>
			</c:forEach>
			<div class="question">
				상품을 사용해보셨나요?
			</div>
			<div class="rating">
				<fieldset class="rate">
					<input type="radio" id="rating10" name="rating" value="5"
						data-description="5점(최고예요)"><label for="rating10"
						title="5점"></label> <input type="radio" id="rating8" name="rating"
						value="4" data-description="4점(좋아요)"><label for="rating8"
						title="4점"></label> <input type="radio" id="rating6" name="rating"
						value="3" data-description="3점(괜찮아요)"><label for="rating6"
						title="3점"></label> <input type="radio" id="rating4" name="rating"
						value="2" data-description="2점(그저그래요)"><label
						for="rating4" title="2점"></label> <input type="radio" id="rating2"
						name="rating" value="1" data-description="1점(별로예요)"><label
						for="rating2" title="1점"></label>
				</fieldset>
				<div class="rating-comment" id="selected-rating-description">선택하세요</div>
			</div>
            <div class="editor">
                <div class="question">
                    어떤 점이 좋았나요?
                </div>
                <div class="content" >
                    <textarea rows="10" cols="30" name="r_content" id="content" placeholder="만족도에 대한 후기를 남겨주세요(최소 10자 이상)" maxlength="1000"></textarea>
                </div>
                <span style="color:#aaa;" id="counter">(0 / 1000자)</span>
                <div class="photo">
<!-- 						<button type="button" class="btn_photo">사진 첨부하기</button> -->
<!--                         <input type="file" class="real-upload" name="r_photo" -->
<!--                             style="display: none;" accept=".jpg, .png"> -->
                            
			<label for="file">
 			 <div class="btn-upload">파일 업로드하기</div>
			</label>
				<input type="file" name="file" id="file" id="imageFile" onchange="readURL(this)">
            </div>
          	<div class="img-cont"><div id="previewDiv"></div></div>


           	
           	
            
			<div class="button">
				<button type="button" class="btn btn-warning" id="send" onclick="submitAndClosePopup()">입력</button>
				<button type="button" class="btn btn-light" onclick="window.close()">취소</button>
			</div>
			
			
			</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// 모든 평점 입력 요소를 선택합니다
		const ratingInputs = $('input[type="radio"][name="rating"]');

		// 설명 업데이트를 위한 요소를 선택합니다
		const descriptionElement = $('#selected-rating-description');

		// 각 평점 입력 요소에 변경 이벤트 리스너를 추가합니다
		ratingInputs.on("click", function() {
			// 선택된 평점과 설명을 가져옵니다
			const selectedRating = $(this).val();
			console.log(selectedRating);

			const selectedDescription = $(this).data("description");

			// 선택된 설명으로 설명 엘리먼트를 업데이트합니다
			descriptionElement.text(selectedDescription);
			descriptionElement.css("color", "orange");
			descriptionElement.css("width", "bold");
		});

		$("#send").click(function() {
			$('#form1').submit();
			setTimeout(function() {
				window.close();
			}, 100);
	
		});
		$('#content').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+"/1000자)");    //글자수 실시간 카운팅

		    if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('#counter').html("(1000 /1000자)");
		    }
		});
		
		   function readURL(obj) {

	            let reader = new FileReader();
	            if(!obj.files.length) {
	                return;
	            }
	            reader.readAsDataURL(obj.files[0]);
	            reader.onload = function (e) {
	                let img = $('<img />');
	                $(img).attr('src', e.target.result);
	                $('#previewDiv').append(img);
	            }
	        }		
			
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
		
		
</body>
</html>