<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="qna-reply" method="post">
<c:forEach items="${list }" var="qna">
<table border="1" align="center" width="500px">
<caption>문의내용</caption>
<tr><td><input type="hidden" name="q_number" value="${qna.q_number }">
		<input type="hidden" name="userId" value="${qna.userId }"></td></tr>
<tr><th>제목</th><td>${qna.q_title }</td></tr>
<tr><th>작성자</th><td>${qna.userId }</td></tr>
<tr><th>내용</th><td>
  <textarea rows="10" cols="60" name="q_content">${qna.q_content}</textarea></td></tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="답글달기">
		<button type="button" onclick="location.href='qna-out'">취소</button>
	<button type="button" onclick="location.href='qna-modifyForm?q_number=${qna.q_number}'">수정</button>
	
	<button type="button" onclick="location.href='qna-delete?q_number=${qna.q_number}'">삭제</button>
		</td>
	</tr>
</table>
</c:forEach>
</form>
</body>
</html>

