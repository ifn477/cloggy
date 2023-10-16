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
<c:forEach items="${list }" var="qna">
<form action="qna-modifysave" method="post">
<table border="1" align="center" width="500px">
<caption>문의내용수정</caption>
<tr><td><input type="hidden" name="q_number" value="${qna.q_number }">
		<input type="hidden" name="userId" value="${qna.userId }"></td></tr>
<tr><th>제목</th><td><input type="text" name="q_title" value="${qna.q_title }"></td></tr>
<tr><th>작성자</th><td>${qna.userId }</td></tr>
<tr><th>내용</th><td>
  <textarea rows="10" cols="60" name="q_content" value="${qna.q_content}"></textarea></td></tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="submit" value="수정">
		<button type="button" onclick="location.href='qna-out'">취소</button>
		</td>
	</tr>
</table>
</c:forEach>
</form>
</body>
</html>