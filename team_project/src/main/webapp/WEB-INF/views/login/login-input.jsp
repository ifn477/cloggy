<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
<c:if test="${loginFailed}">
alert("회원정보가 일치하지 않습니다.");
</c:if>
</script>
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

</body>
</html>