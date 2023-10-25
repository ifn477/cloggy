<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	width: 150px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<form action="qna-save" method="post">
<table align="center" style="width: 700px;">
<caption>문의글 작성</caption>
<tr><th>제목</th>
	<td style="text-align: center;">
		<input type="text" placeholder="문의 제목을 입력해주세요" name="q_title" style="text-align: center;">
		<input type="hidden" name="userId" value="${member.userId}">
	</td>
</tr>
<tr><th>내용</th>
	<td>
		<textarea rows="10" cols="30" placeholder="문의 내용을 입력해주세요" name="q_content" style="text-align: center;"></textarea>
	</td>
</tr>
<tr>
	<th>비밀글</th>
	<td>
	    <input type="checkbox" name="q_secret" value="Y" style="width: 15px;"/><span class="ml_10">비밀글 설정</span>
   </td>
</tr>
<tr>
	<td colspan="2" style="border-bottom: none; text-align: center;">
		<button class="btn btn-primary py-2" type="submit" style="background-color: #e28b3a; margin-top: 30px;">등록</button>
		<button class="btn btn-primary py-2" style="background-color: #e28b3a; margin-top: 30px;" onclick="location.href='main'">취소</button>
	</td>
</tr>	
</table>
</form>
</body>
</html>
