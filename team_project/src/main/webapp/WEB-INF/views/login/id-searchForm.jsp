<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
회원가입 시 등록한 이름과 이메일을 입력하세요.<br>
<form action="id-searchView">
<table border="1" align="center">
<tr><th>이름</th><td><input type="text" name="userName"></td></tr>
<tr><th>이메일</th><td><input type="text" name="email"></td></tr>
<tr>
<td colspan="2">
<input type="submit" value="제출">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
<script type="text/javascript">
<c:if test="${loginFailed==true}">
      alert('회원정보가 일치하지 않습니다.');
</c:if>
</script>
</body>
</html>