<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<script type="text/javascript">
if (${loginFailed}) {
    alert('회원정보가 일치하지 않습니다.');
}
</script>
</head>
<body>
<form action="login-input">
<c:if test="${not empty list}">
<p style="text-align: center; font-family: 'Noto Sans KR', sans-serif; size: 48px; margin-top: 10rem; margin-bottom: 4rem;">
회원님의 아이디는 <strong style="color: blue;">'${list.userId}'</strong> 입니다.</p>
</c:if>
<br>
<input type="submit" value="로그인하러 가기" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; 
width: 200px; height:35px; margin: 0 auto; display: block; border: none; font-size: 12px; margin-bottom: 15rem;
font-family: 'Noto Sans KR', sans-serif;">
</form>
</body>
</html>