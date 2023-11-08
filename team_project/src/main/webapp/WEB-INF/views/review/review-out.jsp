<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.wrap {
	min-height: calc(100vh - 266px); /* footer 높이를 빼준다. */
}

.review-container { 
	display : flex; 
    width: 800px; 
    background-color: rgb(255, 246, 233); 
} 

/* .each_review{ */
/* 	list-style-type: none; */
/* } */
/* .userInfo { */
/*     width: 300px; */
/*     height: 420px; */
/*     background : yellow; */
/*     position: absolute; */
/*     top: 40px; */
/*     left: 40px;  */
/*     border-right: 1px solid #d8dde5; */
/* } */
/* .photo{ */
/*     left: 20px;  */
/*     top : 20px; */
/*     position : absolute; */
/* } */
/* .id{ */
/*     left: 200px;  */
/*     top : 20px; */
/*     position : absolute; */
/* } */
/* .type{ */
/*     left: 20px;  */
/*     top : 180px; */
/*     position : absolute; */

/* } */
/* .review-part { */
/*     width: 810px; */
/*     background: aquamarine; */
/*     position: absolute; */
/*     top: 40px; */
/*     left: 350px; */
/*     padding: 20px; /* 내부 여백 추가 */
* /
	/* } */
	/* .rating, .date, .option, .content{ */
	/*     position: absolute; */
	/* } */
	/* .rating { */
	/*     top : 20px; */
	/*     left : 10px; */
	/* } */
	/* .date{ */
	/*     top : 20px; */
	/*     left : 110px; */
	/* } */
	/* .option{ */
	/*     top : 60px; */
	/*     left : 10px; */
	/* } */
	/* .content { */
	/*     position: absolute; */
	/*     top: 100px; */
	/*     left: 10px; */
	/*     bottom: 10px; /* 밑에 여백을 자동으로 추가 */ * /
	/*     right: 10px; /* 오른쪽에 여백을 자동으로 추가 */ * /
	/*     overflow: auto; /* 내용이 넘칠 때 스크롤바 표시 */ * /
	/* } */
	/* .reviewphoto{ */
	/*     background-color: grey; */
	/*     left : 10px;  */
	/*     position: absolute; */
	/*     top : 350px; */
	/* } */
	/* 리뷰 */  
.review-container {
	overflow: hidden;
	width: 729px;
	height: auto;
	align: center;
	/* 	margin-top: 130px; /* 상단 여백 추가 */ */
	border-radius: 10px;
	border: 1px solid #f6eddf;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	text-align: center;
	/* 	margin: 0 auto; */
	padding: 20px;
}

.review-contents {
	margin-left: 50px;
}

.review {
	display: flex;
}

#r_userid {
	margin-bottom: 20px;
}

.review-box {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
}

.comment {
	color: #e28b3a;
	margin-bottom: 10px;
}

.photo>img {
	border-radius: 10px;
}
<%
int product_id=Integer.parseInt(request.getParameter("product_id"));
%>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
	<div></div>
		<c:choose>
			<c:when test="${loginstate == true}">
				<div class="btnToSave">
					<input type="button" value="리뷰 등록" onclick="openTermsPopup1()">
				</div>
				
				<div class="review-container">
					<ul class="review-table">
						<input type="hidden" value="${pdto.product_id}" id="pid">
						<input type="hidden" value="${rv.product_id}" id="product_id">

						<!-- 리뷰 -->
						<div class="review-box">
							<c:forEach items="${list}" var="rdto">
								<div class="review-container" style="border-radius: 10px;">
									<div class="review">
										<div class="photo">
											<img src="/dog/image/${rdto.r_photo}" width="100px"
												height="100px">
										</div>

										<div class="review-contents">
											<div class="date">${fn:substring(rv.r_date,0,10)}</div>
											<div id="r_userid">${rdto.userId}</div>
											<div>${rdto.r_content}</div>
											<div class="reviewphoto">
												<img src="/dog/review-img/${rv.r_photo}" width="150px"
													height="150px">
											</div>

										</div>
									</div>
								</div>
						</div>
						</c:forEach>
					</ul>
				</div>

			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="rdto">
				
					<!-- 리뷰 -->
					<div class="review-box">
						<div class="comment">
							<a href="review-list?product_id=${pdetail.product_id}"
								align="right">리뷰 전체보기</a>
						</div>

						<div class="review-container" style="border-radius: 10px;">
							<div class="review">
								<div class="photo">
									<img src="/dog/image/${rdto.r_photo}" width="100px"
										height="100px">
								</div>

								<div class="review-contents">
									<div id="r_userid">${rdto.userId}</div>
									<div>${rdto.r_content}</div>
								</div>
							</div>
						</div>
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