<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<style type="text/css">
.wrap{
	min-height: calc(100vh - 266px); /* footer 높이를 빼준다. */
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
caption {
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 500;
	caption-side: top; /* 표 제목을 표의 상단에 배치 */
}
.mody-bnt{
	margin-top: 15px;
	border: none;
	padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript"  src="./js/member.js"></script> -->
</head>
<body>
<div class="wrap"><table border="1" align="center" width="500px">
<caption>내정보</caption>
<c:forEach items="${list}" var="dto">
<tr><th>아이디</th><td>${dto.userId}</td></tr>
<tr><th>패스워드</th><td>${dto.password}</td></tr>
<tr><th>이름</th><td>${dto.userName}</td></tr>
<tr><th>이메일</th><td>${dto.email}</td></tr>
<tr><th>전화번호</th><td>${dto.phone}</td></tr>
<tr><th>주소</th><td>${dto.address}</td></tr>
<tr><th>가입일</th><td>${dto.enroll_date}</td></tr>
<tr>
<td colspan="2" style="border-bottom: none;">
<button class="mody-bnt" type="button" id="button5" data-userid="${dto.userId}" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 150px;">정보 수정하기</button> &nbsp; &nbsp;
<button class="mody-bnt" type="button" id="button2" data-userid="${dto.userId}" style="font-weight: 500; width: 150px;">회원 탈퇴</button>
</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>