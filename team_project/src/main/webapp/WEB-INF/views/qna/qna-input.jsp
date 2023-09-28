<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="qna-save" method="post">
<table border="1" align="center">
<tr><th>회원아이디</th><td><input type="text" name="userId"></td></tr>
<tr><th>문의 제목</th><td><input type="text" name="q_title"></td></tr>
<tr><th>문의 내용</th><td><textarea rows="10" cols="30" name="q_content"></textarea></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="입력">
<button type="button" onclick="location.href='main'">취소</button></td></tr>
</table>
</form>
</body>
</html>