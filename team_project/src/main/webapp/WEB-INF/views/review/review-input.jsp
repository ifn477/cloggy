<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String product_id = request.getParameter("product_id");
%>
<form action="review-save" method="post" enctype="multipart/form-data">
<table border="1" align="center">
<caption><h3>리뷰 작성</h3></caption>
<tr><td><input type="hidden" name="product_id" value="${list.product_id}"></td></tr>
<tr><td><input type="hidden" name="userId" value="${list.userId}"></td></tr>
<tr><th>리뷰 내용</th><td><textarea rows="10" cols="30" name="r_content"></textarea></td></tr>
<tr><th>사진 첨부</th><td><input type="file" name="r_photo"></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="입력">
<button type="button" onclick="location.href='main'">취소</button></td></tr>
</table>
</form>
</body>
</html>