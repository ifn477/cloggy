<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="./js/member.js"></script>
</head>
<body>

<table border="1" align="center" width="500px">

<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td>${dto.userId}</td></tr>
<tr><th>패스워드</th><td>${dto.password}</td></tr>
<tr><th>이름</th><td>${dto.userName}</td></tr>
<tr><th>나이</th><td>${dto.age}</td></tr>
<tr><th>성별</th><td>${dto.gender}</td></tr>
<tr><th>이메일</th><td>${dto.email}</td></tr>
<tr><th>전화번호</th><td>${dto.phone}</td></tr>
<tr><th>주소</th><td>${dto.address}</td></tr>
<tr><th>가입일</th><td>${dto.enroll_date}</td></tr>
<tr>
<td colspan="2"><button type="button" id="button2" data-userid="${dto.userId}">회원 탈퇴</button></td>
</tr>
</c:forEach>
</table>

</body>
</html>