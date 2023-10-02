<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login">
<table border="1" align="center">
<tr><th>아이디</th><td><input type="text" name="userId"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="password"></td></tr>
<tr>
<td colspan="2">
<input type="submit" value="제출">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>

<br><br>
<h2>간편로그인</h2>
     <!-- REST_API키 및 REDIRECT_URI 본인이 설정한 값 넣기 -->
	 <!-- 여기서 uri설정한 곳으로 code 넘어감 -->
     <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoLogin&response_type=code">
        <img alt="카카오 로그인" src="/dog/image/kakao_login_medium_narrow.png" style="margin-bottom: 5px;">
   	 </a>
   	 <br>
   	 <a href="https://nid.naver.com/oauth2.0/authorize?client_id=ubDhsR6U_ZDLZ2KMrD59&redirect_uri=http://localhost:8333/dog/naverlogin&response_type=code">
        <img alt="네이버 로그인" src="/dog/image/btnG_완성형.png" height="48px">
   	 </a>

</body>
</html>