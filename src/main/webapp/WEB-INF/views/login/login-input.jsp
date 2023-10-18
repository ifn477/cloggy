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
<form action="login" method="post" name="logincheck">
<table border="1" align="center">
<tr><th>아이디</th><td><input type="text" name="userId"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="password"></td></tr>
<tr>
<td colspan="2">
<!-- 
<input type="button" value="확인" onclick="check()">
 -->
<input type="submit" value="확인">
<input type="reset" value="취소">
</td>
</tr>
</table>
<br>
<a href="id-searchForm">아이디 찾기</a> &nbsp;
<a href="pw-searchForm">비밀번호 찾기</a>
</form>

<br><br>
<h2>간편로그인 </h2>
     <!-- REST_API키 및 REDIRECT_URI 본인이 설정한 값 넣기 -->
	 <!-- 여기서 uri설정한 곳으로 code 넘어감 -->
     <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoLogin&response_type=code">
        <img alt="카카오 로그인" src="/dog/image/kakao_login_medium_narrow.png" style="margin-bottom: 5px;">
   	 </a>
   	 <br>
   	 <a href="https://nid.naver.com/oauth2.0/authorize?client_id=ubDhsR6U_ZDLZ2KMrD59&redirect_uri=http://localhost:8333/dog/naverlogin&response_type=code">
        <img alt="네이버 로그인" src="/dog/image/btnG_완성형.png" height="48px">
   	 </a>
<script type="text/javascript">
<c:if test="${loginFailed==true}">
      alert('회원정보가 일치하지 않습니다.');
</c:if>
<c:if test="${mailSent==true}">
alert('회원님의 비밀번호를 메일로 발송하였습니다.');
</c:if>
</script>
</body>
</html>