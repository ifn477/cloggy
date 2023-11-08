<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@charset "UTF-8";
table {
	font-family: 'Noto Sans KR', sans-serif;
	width: 30rem;
	text-align: center;
	margin-top: 2rem;
	margin-bottom: 13rem;
	border-top: 1px solid #f6eddf;
    border-collapse: collapse;
}
th{
	width: 20%;
	font-weight: 400;
	background-color: #f6eddf;
	writing-mode: horizontal-tb;
	white-space: nowrap;
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
	padding-left: 10px;
	height: 40px;
	border-style: none;
    outline: none;
}
caption {
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 500;
	caption-side: top;
}
.login-bnt{
	margin-top: 15px;
}
</style>
</head>
<body>
<p style="text-align: center; font-family: 'Noto Sans KR', sans-serif; size: 20px; margin-top:50px;">
회원가입 시 등록한 아이디와 이메일을 입력하세요!</p>
<br>
<form action="pw-searchView">
<table align="center">
<caption>비밀번호 찾기</caption>
<tr><th>아이디</th><td><input type="text" name="userId"></td></tr>
<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
<tr>
<td colspan="2" style="text-align: center; border-bottom: none;">
<input class="login-bnt" type="submit" value="제출" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 150px;"> &nbsp;
<input class="login-bnt" type="reset" value="취소" style="font-weight: 500; width: 150px;">
</td>
</tr>
</table>
</form>
<script type="text/javascript">
if (${loginFailed}) {
    alert('회원정보가 일치하지 않습니다.');
}
</script>
</body>
</html>