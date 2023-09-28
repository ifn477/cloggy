<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" align="center" width="600px" style="text-align: left;">

<tr><th>글번호</th> <th>제목</th><th>작성자</th><th>작성일자</th></tr>
<c:forEach items="${list }" var="qna">
<tr>
<td>${qna.q_number}</td>
<td><c:forEach var="i" begin="1" end="${qna.q_indent }" step="1"> ↳re:</c:forEach>
<a href="qna-detail?userId=${qna.userId}">${qna.q_title}</a></td>
<td>${qna.userId}</td>
<td>${fn:substring(qna.q_date,0,10)}</td>
</tr>
</c:forEach>
<div align="center" style="margin-top: 20px;">
    <form action="qna-searchview" method="post">
        <select name="qnaitem">
		 		<option value="q_title">제목</option>
		 		<option value="userId">작성자</option>
		 		<option value="q_content">내용</option>
		 	</select>
        <input type="text" name="qnavalue">
        <input type="submit" value="검색">
    </form>
</div>
</table>
</body>
</html>