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
<c:forEach items="${list }" var="notice">
<table align="center" width="700px">
<caption>공지내용</caption>
	<tr>
		<th>제목</th>
		<td><input type="hidden" name="n_number" value="${notice.n_number }">
			<input type="hidden" name="userId" value="${notice.userId }">
			${notice.n_title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${notice.userId }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
  			<textarea name="n_content">${notice.n_content}</textarea></td></tr>
	<tr>
		<c:choose>
			<c:when test="${loginstate == true && member.auth_id == 0}">
		<td  colspan="2" style="border-bottom: none; text-align: right;">
				<button class="btn btn-primary py-2" type="button" onclick="location.href='notice-modifyForm?n_number=${notice.n_number}'">수정</button>	
				<button class="btn btn-primary py-2" type="button" onclick="location.href='notice-delete?n_number=${notice.n_number}'">삭제</button>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
				<button class="btn btn-primary py-2" type="button" onclick="location.href='notice-out'">목록</button>	
		</td>
	</tr>
</table>
</c:forEach>
</body>
</html>
