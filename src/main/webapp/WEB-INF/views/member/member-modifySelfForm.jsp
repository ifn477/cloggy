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
<form action="member-modifySelfView" name="memberincheckself">
<table border="1" align="center" width="500px">

<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td><input type="text" value="${dto.userId}" name="userId" readonly="readonly"></td></tr>
<tr>
<th>비밀번호</th><td colspan="2"><input type="password" name="password" id="password" value="${dto.password}"></td>
<tr><th>비밀번호 확인</th>
<td colspan="2"><input type="password" name="passwordcheck" id="passwordcheck">
<button type="button" id="button6" onclick="checkPassword()">pw 중복 검사</button>
</td>
</tr>
<tr><th>이름</th><td><input type="text" value="${dto.userName}" name="userName"></td></tr>
<tr><th>이메일</th><td><input type="text" value="${dto.email}" name="email"></td></tr>
<tr><th>전화번호</th><td><input type="text" value="${dto.phone}" name="phone"></td></tr>
<tr>
<th>주소</th>
<td><input type="text" id="roadFullAddr"  name="roadFullAddr" value="${dto.address}"/>
<input type="button" onClick="goPopupself();" value="검색"/></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="확인">
</td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>