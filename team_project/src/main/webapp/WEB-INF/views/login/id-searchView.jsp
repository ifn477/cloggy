<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
<c:if test="${loginFailed==true}">
      alert('회원정보가 일치하지 않습니다.');
</c:if>
</script>
</head>
<body>

<c:if test="${not empty list}">
    회원님의 아이디는 ${list.userId} 입니다.
</c:if>
<br>
<form action="login-input">
<table border="1" align="center">
<tr>
<td colspan="2">
<input type="submit" value="로그인하러 가기">
</td>
</tr>
</table>
</form>

</body>
</html>