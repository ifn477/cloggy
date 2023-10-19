<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.form-floating input:focus {
	border: 2px solid #ffffff;
	box-shadow: 0 0 5px #ffffff;
}

.id-pw-find {
	text-align: center;
	margin: 10px;
	font-size: small;
}

.btn.btn-primary.w-100.py-2 {
	border: 0;
	border-radius: 0;
}

p {
	font-size: 20px;
	
}
.container_bottom{
	margin-top: 50px;
	margin-bottom: 100px;
}
table{
   font-family: 'Noto Sans KR', sans-serif;
}
main{
	margin-top: 8rem;
	margin-bottom: 8rem;
}
a {
    text-decoration: none;
    color: inherit;
}
</style>
</head>
  <body>
    <main>
    <div style="display: flex; justify-content: center;">
      <form action="login" method="post" name="logincheck" class="login-form" style="width:600px;">
          <p><strong>로그인</strong></p>
          <div class="form-floating">
              <input type="text" class="form-control" id="floatingInput" name="userId">
              <label for="floatingInput">Id</label>
          </div>
          <div class="form-floating">
              <input type="password" class="form-control" id="floatingPassword" type="text" name="password">
              <label for="floatingPassword" type="password" name="password">Passord</label>
          </div>
          <button class="btn btn-primary w-100 py-2" type="submit" style="background-color: #e28b3a; margin-top:10px;">로그인</button>
	  	  <!-- js 코드 작성 필요 -->
          <button class="btn btn-primary w-100 py-2" type="submit" onclick=""
              style="background-color: #f6eddf; color: #463528;">카카오로 시작하기</button>
      <div class="id-pw-find">
          <a href="id-searchForm">아이디찾기</a> /<a href="pw-searchForm">비밀번호 찾기</a>
      </div>
      <div class="container_bottom" style="text-align:center;">
        <hr>
        <span style="font-size: small;">사용중이신 SNS로 간편하게 로그인하세요!</span> &nbsp; &nbsp; &nbsp;
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoLogin&response_type=code">
       		<img src="./image/kakao.png" height="30"></a> &nbsp;
            <a href="https://nid.naver.com/oauth2.0/authorize?client_id=ubDhsR6U_ZDLZ2KMrD59&redirect_uri=http://localhost:8333/dog/naverlogin&response_type=code">
      		<img src="./image/naver.png" height="30"></a>
     </div>
      </form>
     </div>
  </main>
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