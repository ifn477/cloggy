<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body>
<table border="1" align="center" width="600px" style="text-align: left;">

<tr><th>글번호</th> <th>제목</th><th>작성자</th><th>작성일자</th></tr>
<c:forEach items="${list }" var="qna">
<tr>
<td>${qna.q_number}</td>
<td>
<c:choose>
	<c:when test="${ qna.q_secret eq false || member.auth_id == 9}"> <!-- 작성자이거나 관리자일 때 -->
		<c:forEach var="i" begin="1" end="${qna.q_indent }" step="1"> ↳re:</c:forEach>
		<a href="qna-detail?q_number=${qna.q_number}">${qna.q_title}</a>
	</c:when>
	<c:otherwise>🕶작성자와 관리자만 볼 수 있습니다4.</c:otherwise>
</c:choose>
</td>

<td>${qna.userId}</td>
<td>${fn:substring(qna.q_date,0,10)}</td>
</tr>
</c:forEach>
</table>
<div class="btn-container">
    <a href="qna-inputtest" class="btn btn-primary table-right" >글쓰기</a>
</div>
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
</body>
</html>