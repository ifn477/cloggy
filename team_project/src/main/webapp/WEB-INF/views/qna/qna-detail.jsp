<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<style type="text/css">
th{
	width: 15%;
}
textarea {
	padding-left: 10px;
	width: 100%;
	max-height:200px;
	min-height:200px;
	border-style: none;
}
.btn{
	width: 90px;
	height: 30px;
	line-height: 15px;
	font-size: 13px;
	background-color: #e28b3a; 
	margin-top: 10px;
}
.btn:hover {
    background-color: #e28b3a; /* 원래 색상으로 설정 */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="qna-reply" method="post">
<c:forEach items="${list}" var="qna">
<table align="center" style="width: 700px;">
<caption>문의내용</caption>
<tr><th>제목</th><td>${qna.q_title }</td></tr>
<tr><th>작성자</th><td>${qna.userId }</td></tr>
<tr>
	<th>내용</th>
	<td>
  		<textarea rows="10" cols="60" name="q_content">${qna.q_content}</textarea>
  		<input type="hidden" name="q_number" value="${qna.q_number }">
  		<input type="hidden" name="userId" value="${qna.userId }">
  </td>
</tr>
<tr>
	<c:choose>
		<c:when test="${loginstate==true && member.auth_id == 9}">
			<td colspan="2" style="text-align: center;"><input type="submit" value="답글달기"></td>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</tr>
<tr>
<td colspan="2" style="border-bottom: none; text-align: right;">	
	<button class="btn btn-primary py-2" type="button" onclick="location.href='qna-out'">취소</button>
	<button class="btn btn-primary py-2" type="button" onclick="location.href='qna-modifyForm?q_number=${qna.q_number}'">수정</button>
	<button class="btn btn-primary py-2" type="button" onclick="location.href='qna-delete?q_number=${qna.q_number}'">삭제</button>
</td>
</tr>
</table>
</c:forEach>
</form>
</body>
</html>

