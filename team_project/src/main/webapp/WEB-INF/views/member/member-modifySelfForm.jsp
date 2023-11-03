<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.btns{
    border-radius: 0;
    width: 100px;
	border: 0;
	padding: 10px;
}	
table {
	font-family: 'Noto Sans KR', sans-serif;
	width: 45rem;
	text-align: center;
	margin-top: 5rem;
	margin-bottom: 16rem;
	border-top: 1px solid #f6eddf;
    border-collapse: collapse;
    border-left: none;
    border-right: none;
	border-bottom: none;
}
th{
 	width: 15%;
	font-weight: 400;
	background-color: #f6eddf;
}
th,td {
    border-bottom: 1px solid #f6eddf;
    padding: 10px;
	font-size: 13px;
	color: #463528; 
}
td{
	text-align: left;
}
input {
 	padding-left: 100px;
	width: 400px;
	height: 40px;
	border-style: none;
    outline: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"  src="./js/member.js"></script>
</head>
<body>
<form action="member-modifySelfView" name="memberincheckself">
<table border="1" align="center" width="500px">

<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td><input type="text" value="${dto.userId}" name="userId" readonly="readonly"></td></tr>
<tr>
<th>비밀번호</th><td><input type="password" name="password" id="password" value="${dto.password}"></td>
<tr><th>비밀번호 확인</th>
<td>
<input type="password" name="passwordcheck" id="passwordcheck">
<button type="button" id="button6" onclick="checkPassword()" class="btns">pw 중복 검사</button>
</td>
</tr>
<tr><th>이름</th><td><input type="text" value="${dto.userName}" name="userName"></td></tr>
<tr><th>이메일</th><td><input type="text" value="${dto.email}" name="email"></td></tr>
<tr><th>전화번호</th><td><input type="text" value="${dto.phone}" name="phone"></td></tr>
<tr>
<th>주소</th>
<td><input type="text" id="roadFullAddr"  name="roadFullAddr" value="${dto.address}"/> &nbsp;
<input class="btns" type="button" onClick="goPopupself();" value="검색"/></td>
</tr>
<tr>
<td colspan="2" style="border-bottom: none;">
<div style="margin-top: 15px;">
<input type="submit" value="확인" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 150px; text-align: center; padding: 10px 0; margin: 0 auto; display: block;">
</div>
</td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>