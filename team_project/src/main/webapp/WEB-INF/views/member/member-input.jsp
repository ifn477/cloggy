<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="/dog/js/check.js"></script>
<meta charset="UTF-8">
<script type="text/javascript" src="./js/member.js"></script>
</head>

<body>
<form action="member-save" method="post" name="memberincheck">
<table border="1" align="center">
<tr>
<th>아이디</th>
<td><input type="text" name="userId" id="userId"></td>
<td><button type="button" id="button1">id 중복검사</button></td>
</tr>
<tr><th>비밀번호</th><td colspan="2"><input type="text" name="password"></td></tr>
<tr><th>이름</th><td colspan="2"><input type="text" name="userName"></td></tr>
<tr><th>나이</th><td colspan="2"><input type="text" name="age"></td></tr>
<tr><th>성별</th><td colspan="2">
<input type="radio" name="gender" value="남">남 &nbsp;
<input type="radio" name="gender" value="여">여
</td></tr>
<tr>
<th>이메일</th>
<td><input type="text" name="email" id="email"></td>
<td><button type="button" id="button3">메일 전송</button></td>
</tr>
<tr>
<th>인증 코드</th>
<td><input type="text" name="userInputKey" id="userInputKey"></td>
<td><button type="button" id="button4">인증 확인</button></td>
</tr>
<tr><th>핸드폰 번호</th><td colspan="2"><input type="text" name="phone"></td></tr>
<tr>
<td>주소</td>
<td><input type="text" id="roadFullAddr"  name="roadFullAddr" /></td>
<td><input type="button" onClick="goPopup();" value="검색"/></td>
</tr>
<tr>
<td colspan="3">
<input type="button" value="확인" onclick="memcheck()">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
<br>
     <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoMember&response_type=code">
        <img alt="카카오 로그인" src="/dog/image/kakao_login_medium_narrow.png" style="margin-bottom: 5px;">
   	 </a>
</body>
</html>