<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(function(){
	$("#button1").click(function(){
		var userId = $("#userId").val();
		$.ajax({
			type:"post",
			async:true,
			url:"idcheck",
			data:{"userId":userId},
			success:function(result){
				if(result=="ok"){
					alert("사용가능 ID");
				}
				else{
					alert("사용중인 ID");
				}
			},	
			error:function(){
				alert("에러")
			}
		});
	});
});
</script>
</head>
<body>

<form action="member-save" method="post">
<table border="1" align="center">
<tr>
<th>아이디</th><td><input type="text" name="userId" id="userId"></td>
<td><button type="button" id="button1">id 중복검사</button></td>
</tr>
<tr><th>비밀번호</th><td colspan="2"><input type="text" name="password"></td></tr>
<tr><th>이름</th><td colspan="2"><input type="text" name="userName"></td></tr>
<tr><th>나이</th><td colspan="2"><input type="text" name="age"></td></tr>
<tr><th>성별</th><td colspan="2">
<input type="radio" name="gender" value="남">남 &nbsp;
<input type="radio" name="gender" value="여">여
</td></tr>
<tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
<tr><th>핸드폰 번호</th><td colspan="2"><input type="text" name="phone"></td></tr>
<tr><th>집주소</th><td colspan="2"><input type="text" name="address"></td></tr>
<tr>
<td colspan="3">
<input type="submit" value="제출">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
</body>
</html>