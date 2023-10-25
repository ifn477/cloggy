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
<form action="qna-replysave" method="post">
<table  align="center" style="width: 700px;">
<c:forEach items="${list}" var="qna">
<caption>답글작성</caption>
<tr>
    <th>작성자</th>
    <td>
    	<input type="text" name="userId" value="${member.userId}">
    	<input type="hidden" name="q_number" value="${qna.q_number}">
	    <input type="hidden" name="q_indent" value="${qna.q_indent }">
	    <input type="hidden" name="q_groups" value="${qna.q_groups}">
	    <input type="hidden" name="q_step" value="${qna.q_step }">
    </td>
</tr>
<tr>
    <th>제목</th>
    <td><input type="text" name="q_title"></td>
</tr>
<tr>
    <th>내용</th>
    <td>
    <textarea rows="10" cols="60" name="q_content"></textarea>
    </td>
</tr>
<tr>
    <td colspan="2" style="border-bottom: none; text-align: right;">
       <button class="btn btn-primary py-2" type="submit">등록</button>
       <button class="btn btn-primary py-2" onclick="location.href='qna-out'">취소</button>
    </td>
</tr>
</c:forEach>
</table>
</body>
</html>