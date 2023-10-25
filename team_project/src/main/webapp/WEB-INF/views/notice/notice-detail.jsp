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
<c:forEach items="${list }" var="notice">
<table border="1" align="center" width="500px">
<caption>문의내용</caption>
<tr><td><input type="hidden" name="n_number" value="${notice.n_number }">
		<input type="hidden" name="userId" value="${notice.userId }"></td></tr>
<tr><th>제목</th><td>${notice.n_title }</td></tr>
<tr><th>작성자</th><td>${notice.userId }</td></tr>
<tr><th>내용</th><td>
  <textarea rows="10" cols="60" name="n_content">${notice.n_content}</textarea></td></tr>
<tr>
	<c:choose>
		<c:when test="${loginstate == true && member.auth_id == 0}">
			<td colspan="2" style="text-align: center;">
				<button type="button" onclick="location.href='notice-modifyForm?n_number=${notice.n_number}'">수정</button>	
				<button type="button" onclick="location.href='notice-delete?n_number=${notice.n_number}'">삭제</button>
		</c:when>
			<c:otherwise></c:otherwise>
	</c:choose>
				<button type="button" onclick="location.href='notice-out'">목록</button>	
			</td>
</tr>
</table>
</c:forEach>
</body>
</html>