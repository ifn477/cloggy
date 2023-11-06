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
.mody-bnt{
	margin-top: 15px;
}
</style>
<script type="text/javascript" src="./js/member.js"></script>
</head>
<body>
<form action="member-modifyView">
<table border="1" align="center">
<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td colspan="3"><input type="text" name="userId" value="${dto.userId}" readonly="readonly"></td></tr>
<tr><th>비밀번호</th><td colspan="3"><input type="text" name="password" value="${dto.password}"></td></tr>
<tr><th>이름</th><td colspan="3"><input type="text" name="userName" value="${dto.userName}"></td></tr>
<tr><th>이메일</th><td colspan="2"><input type="text" name="email" value="${dto.email}"></td></tr>
<tr><th>핸드폰 번호</th><td colspan="2"><input type="text" name="phone" value="${dto.phone}"></td></tr>
<tr><th>주소</th><td colspan="2"><input type="text" name="roadFullAddr" value="${dto.address}"></td></tr>
<tr>
<td colspan="2" style="text-align: center; border-bottom: none;">
<input class="mody-bnt" type="submit" value="수정하기" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 150px;"> &nbsp;
<input class="mody-bnt" type="reset" value="취소" style="font-weight: 500; width: 150px;">
</td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>