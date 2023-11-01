<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/widthtable.css">
<style type="text/css">
.btn{
	width: 90px;
	height: 30px;
	line-height: 15px;
	font-size: 13px;
	background-color: #e28b3a; 
}
.search-select{
	border-radius: 5px;
	border-color: #DBDBDB;
}
#qnabnt{
	vertical-align: top; 
	margin-top: 0; 
	margin-bottom: 0; 
	background-color: #A8A8A8;
	width: 70px;
}
caption {
	margin-bottom: 5px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="600px" style="border-top: none;">
<caption>Q&A게시판</caption>
<tr> 
	<td colspan="4" style="text-align: right; border-bottom: none; border-top: none;">
    	<button class="btn btn-primary py-2" style="background-color: #e28b3a;" onclick="location.href='qna-input'">글쓰기</button>
	</td>
</tr>
<tr>
	<th style="width: 10%;">글번호</th> 
	<th style="width: 45%;">제목</th>
	<th style="width: 15%;">작성자</th>
	<th>작성일자</th>
</tr>
<c:forEach items="${list}" var="qna">
<tr>
<td>${qna.q_number}</td>
<td style="text-align: left;">
<c:choose>
	<c:when test="${ qna.q_secret eq false|| qna.userId eq member.userId || member.auth_id == 0}"> <!-- 작성자이거나 관리자일 때 -->
		<c:forEach var="i" begin="1" end="${qna.q_indent }" step="1"> ↳re:</c:forEach>
		<a href="qna-detail?q_number=${qna.q_number}">${qna.q_title}</a>
	</c:when>
	<c:otherwise>🕶작성자와 관리자만 볼 수 있습니다</c:otherwise>
</c:choose>
</td>
<td>
<c:choose>
    <c:when test="${qna.q_secret eq false || qna.userId eq member.userId || member.auth_id == 1}">
        ${fn:substring(qna.userId, 0, 2)}${fn:substringAfter(qna.userId, fn:substring(qna.userId, 0, 2)).replaceAll('[^*]', '*')}
    </c:when>
    <c:otherwise>  ${fn:substring(qna.userId, 0, 2)}${fn:substringAfter(qna.userId, fn:substring(qna.userId, 0, 2)).replaceAll('[^*]', '*')}</c:otherwise>
</c:choose>
</td>
<td>${fn:substring(qna.q_date,0,10)}</td>
</tr>
</c:forEach>
<tr>
    <td colspan="4" style="text-align: center; border-bottom: none;">
        <form action="qna-searchview" method="post">
            <select name="qnaitem" style="width: 70px; height: 30px; margin-top: 30px;" class="search-select">
                <option value="q_title">제목</option>
                <option value="userId">작성자</option>
                <option value="q_content">내용</option>
            </select>
            <input type="text" name="qnavalue" style="height: 30px; width: 200px; border: 1px solid #DBDBDB; margin-top: 30px;">
            <button class="btn btn-primary py-2" id="qnabnt" type="submit" style="margin-top: 30px;">검색</button>
        </form>
    </td>
</tr>
</table>
</body>
</html>
