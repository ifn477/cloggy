<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.reviewcontainer {
	margin-top: 50px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${loginstate == true}">
			<input type="button" value="리뷰 등록"
				onclick="location.href='review-input?product_id=${pdto.product_id}'">
			<c:forEach items="${list}" var="rv">
				<div class="reviewcontainer">
					<span class="userid">${rv.userId}</span>
					<span class="reviewdate">${fn:substring(rv.r_date,0,10)}</span>
					<div class="reviewimg">
						<img src="/dog/review-img/${rv.r_photo}" width="150px"
							height="150px">
					</div>
					<div class="reviewcontent">${rv.r_content}</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="rv">
				<div class="reviewcontainer">
					<span class="userid">${rv.userId}</span>
					<span class="reviewdate">${fn:substring(rv.r_date,0,10)}</span>
					<div class="reviewimg">
						<img src="/dog/review-img/${rv.r_photo}" width="150px"
							height="150px">
					</div>
					<div class="reviewcontent">${rv.r_content}</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>