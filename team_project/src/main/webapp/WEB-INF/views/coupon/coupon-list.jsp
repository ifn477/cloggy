<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="coupondiscount" method="post">
쿠폰선택<br>
<select name="selectcoupon">
	<c:forEach items="${list }" var="couponlist">
		<option value="${couponlist.c_name }">${couponlist.c_name }</option>
	</c:forEach>
</select>
<input type="submit" value="적용하기">
</form>
</body>
</html>