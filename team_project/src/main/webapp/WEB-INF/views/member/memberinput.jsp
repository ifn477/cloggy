<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="membersave" method="post" align="center">
<table>
<tr><th>아이디</th><td><input type="text" name="userId"></td></tr>
<tr><th>비밀번호</th><td><input type="text" name="password"></td></tr>
<tr><th>이름</th><td><input type="text" name="userName"></td></tr>
<tr><th>나이</th><td><input type="text" name="age"></td></tr>
<tr><th>성별</th><td><input type="radio" name="gender" value="남자">남자
					<input type="radio" name="gender" value="여자">여자</td></tr>
<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
<tr><th>번호</th><td><input type="text" name="phone"></td></tr>
<tr><th>주소</th><td><input type="text" name="address"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="가입"></td></tr>
</table>
</form>
</body>
</html>