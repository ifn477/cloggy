<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

.rate {
	display: inline-block;
	border: 0;
	margin-right: 15px;
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
.container-fluid {
	display: grid;
	grid-template-columns: 1fr 2fr;
	grid-auto-rows: minmax(50px, auto);
	grid-gap: 10px;
	background-color: orange;
	place-items: center;
}

.row-title {
	grid-column: 1/3;
	background-color: white;
}

.thumb {
	grid-row: 2/5;
	background-color: white;
}

.img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	justify-self: center;
}

.item-name {
	background-color: white;
}

.item-description {
	background-color: white;
}

.rating {
	grid-column: 1/3;
	background-color: white;
}

.rating-comment {
	grid-column: 1/3;
	background-color: white;
}

.comment {
	grid-column: 1/3;
	background-color: white;
}

.content {
	grid-column: 1/3;
	grid-row: 8/12;
	background-color: white;
}

.photo {
	grid-column: 1/3;
	background-color: white;
}

.button {
	grid-column: 1/3;
	background-color: white;
}
</style>
</head>
<body>

	<form action="review-save" method="post" enctype="multipart/form-data"
		id="form1">
		<div class="container-fluid">
			<div class="row-title">
				<h3>리뷰 작성하기</h3>
			</div>
			<c:forEach items="${plist}" var="plist">
				<div class="thumb">
					<img src="/dog/image/${plist.p_thumbnail}" class="img">
				</div>
				<div class="item-name">${plist.p_name}</div>
			</c:forEach>
			<div class="item-quantity"></div>
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
			</div>
			<div class="rating-comment" id="selected-rating-description"></div>
			<div class="comment">
				<h3>어떤 점이 좋았나요?</h3>
			</div>
			<div class="content">
				<textarea rows="10" cols="30" name="r_content"
					value="만족도에 대한 후기를 남겨주세요(최소 10자 이상)"></textarea>
			</div>
			<div class="photo">
				<input type="file" name="r_photo">
			</div>
			<div class="button">
				<button type="button" id="send" onclick="submitAndClosePopup()">입력</button>
				<button type="button" onclick="location.href='main'">취소</button>
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
		});

		$("#send").click(function() {
			$('#form1').submit();
			setTimeout(function() {
				window.close();
			}, 100);

		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>