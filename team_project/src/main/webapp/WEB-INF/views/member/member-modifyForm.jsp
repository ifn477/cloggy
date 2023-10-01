<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="member-modifyView">
<table border="1" align="center">
<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td><input type="text" name="userId" value="${dto.userId}" readonly="readonly"></td></tr>
<tr><th>비밀번호</th><td><input type="text" name="password" value="${dto.password}"></td></tr>
<tr><th>이름</th><td><input type="text" name="userName" value="${dto.userName}"></td></tr>
<tr><th>나이</th><td><input type="text" name="age" value="${dto.age}"></td></tr>
<tr><th>성별</th><td>
<input type="radio" name="gender" value="남">남 &nbsp;
<input type="radio" name="gender" value="여">여
</td></tr>
<tr><th>이메일</th><td><input type="text" name="email" value="${dto.email}"></td></tr>
<tr><th>핸드폰 번호</th><td><input type="text" name="phone" value="${dto.phone}"></td></tr>
<tr><th>주소</th><td><input type="text" name="address" value="${dto.address}"></td></tr>
<tr>
<td colspan="2">
<input type="submit" value="제출">
<input type="reset" value="취소">
</td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>