<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/dog/js/check.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<style type="text/css">
td{
align : left;
}
</style>

</head>
<body>
<form action="member-save" method="post" name="memberincheck">
<table border="1" align="center">
<tr>
<th>아이디</th>
<td><input type="text" name="userId" id="userId"></td>
<td><button type="button" id="button1">id 중복 검사</button></td>
</tr>
<tr>
<th>비밀번호</th><td colspan="2"><input type="password" name="password" id="password"></td>
<tr><th>비밀번호 확인</th>
<td colspan="2"><input type="password" name="passwordcheck" id="passwordcheck">
<button type="button" id="button6" onclick="checkPassword()">pw 중복 검사</button>
</td>
</tr>

<tr><th>이름</th><td colspan="2"><input type="text" name="userName"></td></tr>
<tr>
<th>이메일</th>
<td>
	<input type="text" name="user_emailid" id="user_emailid"><span>@</span>
	<input type="text" name="email_address" id="email_address" list="email_address_list" placeholder="선택하세요">
		<datalist id="email_address_list">
			<option value="naver.com"></option>
			<option value="daum.com"></option>
			<option value="gmail.com"></option>
			<option value="직접입력"></option>
		</datalist>
	<input type="hidden" name="email" id="email">	
</td>
<td><button type="button" id="button3">메일 전송</button></td>
</tr>
<tr>
<th>인증 코드</th>
<td><input type="text" name="userInputKey" id="userInputKey"></td>
<td><button type="button" id="button4">인증 확인</button></td>
</tr>
<tr><th>핸드폰 번호</th><td colspan="2">
<select name="phone1">
	<option value="010">010</option>
	<option value="031">031</option>
	<option value="017">017</option>
</select>
<span>-</span><input type="text" name="phone2">
<span>-</span><input type="text" name="phone3">
</td></tr>
<tr>
<td>주소</td>
<td><input type="text" id="roadFullAddr"  name="roadFullAddr" /></td>
<td><input type="button" onClick="goPopup();" value="검색"/></td>
</tr>
<tr>
<td colspan="4" style="text-align: left;">
&nbsp; <input type="checkbox" value="약관전체동의" id="checktermsall" onclick="checkAllTerms()"> &nbsp; 약관 전체 동의<br>
&nbsp; <input type="checkbox" value="서비스약관동의" id="checkterms1" > &nbsp; (필수) 서비스 약관 동의<a href="javascript:void(0);" onclick="openTermsPopup1();" style="color: #999999; font-weight: bold;"> &nbsp; &nbsp; 보기</a><br>
&nbsp; <input type="checkbox" value="광고성정보수신동의" id="checkterms2"> &nbsp; (선택) 광고성 정보 수신 동의<a href="javascript:void(0);" onclick="openTermsPopup2();" style="color: #999999; font-weight: bold;"> &nbsp; &nbsp; 보기</a>
</td>
</tr>
<tr>
<td colspan="3">
<input type="button" value="확인" onclick="memcheck(); checkTerms();">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
<br>
     <a href="https://kauth.kakao.com/oauth/authorize?client_id=4b174c23998fabfa7c3c09869f3e67a7&redirect_uri=http://localhost:8333/dog/kakaoMember&response_type=code">
        <img alt="카카오 로그인" src="/dog/image/kakao_login_medium_narrow.png" style="margin-bottom: 5px;">
   	 </a>

<script type="text/javascript" src="./js/check.js"></script>
<!-- 이메일 값들 합쳐서 인증메일 보내기 위한 js -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // 이 코드를 이메일 전송 버튼 클릭 시 실행하도록 이동
});

document.getElementById("button3").addEventListener("click", function() {
    var user_emailid = document.getElementById("user_emailid").value;
    var email_address = document.getElementById("email_address").value;

    // email 주소 입력란에서 직접 선택한 값을 사용
    var selected_email = email_address;

    var email = user_emailid + "@" + selected_email;
    document.getElementById("email").value = email;
});
</script>	
</body>
</html>