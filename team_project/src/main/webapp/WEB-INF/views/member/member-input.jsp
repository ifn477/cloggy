<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<style type="text/css">		

.btn {
    border-radius: 0;
    width: 90px;
    height: 50;
	border: 0;
	font-weight: 500;
}
table {
	font-family: 'Noto Sans KR', sans-serif;
	width: 45rem;
	text-align: center;
	margin-top: 5rem;
	margin-bottom: 13rem;
	border: 1px solid #f6eddf;
    border-collapse: collapse;
    position: relative;
}
th{
	width: 15%;
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
	width: 500px;
	height: 40px;
	border-style: none;
    outline: none;
}
caption {
	caption-side : top;
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 500;
	top: 0;
}
input[type="checkbox"] {
    width: 20px;
    height: 20px;
	vertical-align: middle;
}
td{
	align : left;
}
.wrap{
	min-height: calc(100vh - 266px); /* footer 높이를 빼준다. */

}
/**/
</style>
</head>
<body>
<div class="wrap">
<form action="member-save" method="post" name="memberincheck">
<table border="1" align="center">
<caption>cloggy 회원 가입</caption>
<tr>
<th>아이디</th>
<td><input type="text" name="userId" id="userId"></td>
<td><button type="button" id="button1" class="btns">id 중복 검사</button></td>
</tr>
<tr>
<th>비밀번호</th><td colspan="2"><input type="password" name="password" id="password"></td>
<tr><th>비밀번호 확인</th>
<td><input type="password" name="passwordcheck" id="passwordcheck"></td>
<td><button type="button" id="button6" onclick="checkPassword()">pw 중복 검사</button>
</td>
</tr>

<tr><th>이름</th><td colspan="2"><input type="text" name="userName"></td></tr>
<tr>
<th>이메일</th>
<td>
	<input type="text" name="user_emailid" id="user_emailid" placeholder="메일 아이디를 입력하세요"><span>@</span>
	<input type="text" name="email_address" id="email_address" list="email_address_list" placeholder="도메인 주소를 선택하세요">
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
<tr><th>핸드폰 번호</th><td colspan="2"><input type="text" name="phone"></td></tr>
<tr>
<th>주소</th>
<td><input type="text" id="roadFullAddr"  name="roadFullAddr" /></td>
<td><input type="button" onClick="goPopup();" value="검색"/></td>
</tr>
<tr>
<td colspan="4" style="text-align: left;" class="checkbox-style">
&nbsp; <input type="checkbox" value="약관전체동의" id="checktermsall" onclick="checkAllTerms()"> &nbsp; 약관 전체 동의<br>
&nbsp; <input type="checkbox" value="서비스약관동의" id="checkterms1" > &nbsp; (필수) 서비스 약관 동의<a href="javascript:void(0);" onclick="openTermsPopup1();" style="color: #999999; font-weight: bold;"> &nbsp; &nbsp; 보기</a><br>
&nbsp; <input type="checkbox" value="광고성정보수신동의" id="checkterms2"> &nbsp; (선택) 광고성 정보 수신 동의<a href="javascript:void(0);" onclick="openTermsPopup2();" style="color: #999999; font-weight: bold;"> &nbsp; &nbsp; 보기</a>
</td>
</tr>
<tr class="submit_button">
	<td colspan="3" style="border:none;"><input type="submit" value="확인" onclick="memcheck();" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 250;"> &nbsp;
	<input type="reset" value="취소" style="font-weight: 500; width: 250;"></td>
</tr>
</table>
</form>
<br>
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