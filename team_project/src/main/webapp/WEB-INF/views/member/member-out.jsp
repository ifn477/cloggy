<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@charset "UTF-8";

.btn {
    border-radius: 0;
    width: 200px;
	border: 0;
}
#recommendbnt{
	width: 200px;
}
table {
	font-family: 'Noto Sans KR', sans-serif;
	width: 70rem;
	text-align: center;
	margin-top: 5rem;
	margin-bottom: 16rem;
	border-top: 1px solid #f6eddf;
    border-collapse: collapse;
    border-left: none;
    border-right: none;
}
th{
/* 	width: 15%; */
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
	text-align: center;
}
input {
	padding-left: 10px;
	width: 500px;
	height: 40px;
	border-style: none;
    outline: none;
}
textarea {
	padding-left: 10px;
	width: 800px;
	max-height:200px;
	min-height:200px;
	border-style: none;
}
caption {
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 500;
	caption-side: top; /* 표 제목을 표의 상단에 배치 */
}
</style>
<title>Insert title here</title>
</head>
<body>

<table border="1" align="center" width="900px">
<tr>
<th>아이디</th><th>패스워드</th><th>이름</th>
<th>이메일</th><th>전화번호</th><th>주소</th>
<th>가입일</th>
<th>마지막 수정일</th>
<th>비고</th>
</tr>
<c:forEach items="${list}" var="dto">
<tr>
<td>${dto.userId}</td>
<td>${dto.password}</td>
<td>${dto.userName}</td>
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