<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.wrap{
	min-height: calc(100vh - 266px); /* footer 높이를 빼준다. */
}


.review-container {
	display : flex;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    width: 1200px;
    height: 500px;
    background-color: antiquewhite;
}

.each_review{
	list-style-type: none;
}
.userInfo {
    width: 300px;
    height: 420px;
    background : yellow;
    position: absolute;
    top: 40px;
    left: 40px; 
    border-right: 1px solid #d8dde5;
}
.photo{
    left: 20px; 
    top : 20px;
    position : absolute;
}
.id{
    left: 200px; 
    top : 20px;
    position : absolute;
}
.type{
    left: 20px; 
    top : 180px;
    position : absolute;

}
.review-part {
    width: 810px;
    background: aquamarine;
    position: absolute;
    top: 40px;
    left: 350px;
    padding: 20px; /* 내부 여백 추가 */
}
.rating, .date, .option, .content{
    position: absolute;
}
.rating {
    top : 20px;
    left : 10px;
}
.date{
    top : 20px;
    left : 110px;

}
.option{
    top : 60px;
    left : 10px;
}
.content {
    position: absolute;
    top: 100px;
    left: 10px;
    bottom: 10px; /* 밑에 여백을 자동으로 추가 */
    right: 10px; /* 오른쪽에 여백을 자동으로 추가 */
    overflow: auto; /* 내용이 넘칠 때 스크롤바 표시 */
}
.reviewphoto{
    background-color: grey;
    left : 10px; 
    position: absolute;
    top : 350px;
}

<%
int product_id = Integer.parseInt(request.getParameter("product_id"));
%>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
	<c:choose>
		<c:when test="${loginstate == true}">
			<div class="btnToSave">
				<input type="button" value="리뷰 등록" onclick="openTermsPopup1()">
			</div>
			<div class="review-container">
				<ul class="review-table">
<%-- 					<c:forEach items="${pdto}" var="pid"> --%>
					<input type="hidden" value="${pdto.product_id}" id="pid">
<%-- 					</c:forEach> --%>
					
					<c:forEach items="${list}" var="rv">
						<input type="hidden" value="${rv.product_id}" id="product_id">
						<li class="each_review">
							<div class="userInfo">
								<div class="photo">
<!-- 								동물 프로필 사진 -->
									<img src="/dog/image/${rv.r_photo}">
								</div>
								<div class="id">${rv.userId}</div>
							</div>
							<div class="review-part">
								<div class="rating">별점부분</div>
								<div class="date">${fn:substring(rv.r_date,0,10)}</div>
								<div class="option">옵션부분</div>
								<div class="content">${rv.r_content}</div>
								<div class="reviewphoto">
									<img src="/dog/review-img/${rv.r_photo}" width="150px"
										height="150px">
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="rv">
				<div class="review-container">
					<div class="userid">${rv.userId}</div>
					<div class="reviewdate">${fn:substring(rv.r_date,0,10)}</div>
					<div class="reviewimg">
						<img src="/dog/review-img/${rv.r_photo}" width="150px"
							height="150px">
					</div>
					<div class="review-content">${rv.r_content}</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function openTermsPopup1() {
			var productId = $("#pid").val();
			window.open('review-input?product_id=' + productId, '',
					'width=500,height=800');
		}
	</script>
</div>
</body>
</html>