<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
  	  .login-form{
  	  margin : 120px 0px 130px 0px;
  	  }
      .form-floating input:focus {
          border: 2px solid #ffffff;
          box-shadow: 0 0 5px #ffffff;
      }
      .id-pw-find {
          text-align: center;
          margin: 40px 10px;
          font-size: small;
      }
      .btn.btn-primary.w-100.py-2 {
          border: 0;
          border-radius: 0;
      }
      .container_bottom {
          width: 500px;
          padding: 30px;
          margin: 40px auto;
		  font-family: 'Noto Sans KR', sans-serif;
      }
  </style>
  <link href="sign-in.css" rel="stylesheet">
</head>

<body>
<c:if test="${not empty rememberCookie.getValue()}">
<c:set value="checked" var="checked" />
</c:if>
      <form action="login" method="post" name="logincheck" class="login-form">
            <div class="container_bottom">
		 <p style="font-size: 23px;"><strong>로그인</strong></p>
          <div class="form-floating">
              <input class="form-control" type="text" name="userId" id="inputId" value="${rememberedUserId}">
              <input type="password" class="form-control" id="inputPw" name="password" value="${rememberedUserPw}">
          </div>
          
<div style="font-size: small; margin-top: 10px; margin-bottom: 10px;">
    <input type="checkbox" class="custom-control-nput" id="customCheck" name="customCheck" ${checked} />&nbsp; 로그인 정보 기억하기
    <a href="pw-searchForm" style="float: right;">비밀번호 찾기 &nbsp;</a><a href="id-searchForm" style="float: right;">아이디 찾기 /&nbsp;</a>
</div>
          
          <div class="login_bottom" style="margin-top:10px;">
          <button class="btn btn-primary w-100 py-2" type="submit" style="background-color: #e28b3a;" id="loginBtn">로그인</button>
		  <button class="btn btn-primary w-100 py-2" onclick="redirectToKakaoLogin()"
           style="background-color: #f6eddf; color: #463528;">카카오로 시작하기</button>
          </div>

      <div class="id-pw-find">
          <hr><br>
        <span style="font-size: small;">사용중이신 SNS로 간편하게 로그인하세요!</span> &nbsp; &nbsp; &nbsp;
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoLogin&response_type=code">
        <img alt="카카오 로그인" src="/dog/image/kakao.png" style="margin-bottom: 5px;" height="30"> &nbsp;
   	 	</a>
   	 	<a href="https://nid.naver.com/oauth2.0/authorize?client_id=ubDhsR6U_ZDLZ2KMrD59&redirect_uri=http://localhost:8333/dog/naverlogin&response_type=code">
        <img alt="네이버 로그인" src="/dog/image/naver.png" height="30">
   	    </a>    
      </div>
      </div>              
      </form>

<c:if test="${loginFailed==true}">
alert('회원정보가 일치하지 않습니다.');
</c:if>
<c:if test="${mailSent==true}">
alert('회원님의 비밀번호를 메일로 발송하였습니다.');
</c:if>

<script type="text/javascript">
function redirectToKakaoLogin() {
    window.location.href = "https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoMember&response_type=code";
}

$(document).ready(function () {
	//저장된 userId 가져오기
    var rememberedUserId = getCookie("rememberedUserId");
    
    //이미 저장된 아이디(쿠키)가 있는 경우
    //로딩될 때 아이디정보 기억하기에 체크된 채로~
    if (rememberedUserId) {
        $("input[name='customCheck']").prop('checked', true);
    }
    
    
    //로그인버튼 클릭 시 id와 pw 전송
	
	$('#loginBtn').click(function() {
		var id = $('#inputId').val();
		var pw = $('#inputPw').val();
		var customCheck = $('#customCheck').is(':checked');
		
        console.log(userId);
        console.log(userPw);
		
		
	    // 'customCheck'가 체크되어 있을 때만 쿠키에 저장
	    if ($('#customCheck').is(':checked')) {
	        // 아이디와 패스워드 쿠키에 저장
	        document.cookie = "rememberedUserId=" + id + "; expires=" + new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000).toUTCString();
	        document.cookie = "rememberedUserPw=" + pw + "; expires=" + new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000).toUTCString();
	    } else {
	        // If unchecked, remove the cookie
	        document.cookie = "rememberedUserId=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
	        document.cookie = "rememberedUserPw=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
	    }
			$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/',
			data : {
				user_id : id,
				user_pw : pw,
				remember_userId : customCheck
				remember_userPw : customCheck
				},
				success : function(data) {
					console.log(data);
				}
			});
		});
    
// 	// "아이디 기억하기" ㅊㅔ크박크에 변화 있을 때 
// 	$('#customCheck').change(function () {
// 	    if (this.checked) {
// 	        var userId = $('#inputId').val();
// 	        var userPw = $('#inputPw').val();
// 	        console.log(userId);
// 	        console.log(userPw);
	        // Set a cookie with the user's ID that expires in 30 days
// 	        document.cookie = "rememberedUserId=" + userId + "; expires=" + new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000).toUTCString();
// 	        document.cookie = "rememberedUserPw=" + userPw + "; expires=" + new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000).toUTCString();
// 	    } else {
// 	        // If unchecked, remove the cookie
// 	        document.cookie = "rememberedUserId=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
// 	        document.cookie = "rememberedUserPw=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
// 	    }
// 	});
});


function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) {
        return parts.pop().split(";").shift();
    }
}
</script>
</body>
</html>