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

<table border="1" align="center" width="900px">
<tr>
<th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th>
<th>성별</th><th>이메일</th><th>전화번호</th><th>주소</th>
<th>가입일</th><th>마지막 수정일</th><th>비고</th>
</tr>
<c:forEach items="${list}" var="dto">
<tr>
<td>${dto.userId}</td>
<td>${dto.password}</td>
<td>${dto.userName}</td>
<td>${dto.age}</td>
<td>${dto.gender}</td>
<td>${dto.email}</td>
<td>${dto.phone}</td>
<td>${dto.address}</td>
<td>${dto.enroll_date}</td>
<td>${dto.last_update}</td>
<td>
<a href="member-modifyForm?userId=${dto.userId}">수정</a>&nbsp;
<a href="member-delete?userId=${dto.userId}">삭제</a>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>