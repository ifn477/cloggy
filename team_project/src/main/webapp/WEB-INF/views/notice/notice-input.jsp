<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th{
	width: 15%;
}
.btn{
 	width: 150px;
}
</style>
</head>
<body>	
<form action="notice-save" method="post">
<table align="center" style="width:700px">
<tr><th style="text-align: center;">공지사항 작성</th></tr>
<tr>
	<td>	
		<input type="text"  placeholder="공지사항 제목을 입력해주세요" name="n_title">
		<input type="hidden" name="userId" value="${member.userId}">
	</td>
</tr>
<tr><td><textarea rows="10" cols="30" placeholder="공지사항 내용을 입력해주세요" name="n_content"></textarea></td></tr>
<tr>
	<td style="border-bottom: none; text-align: center;">
		<button class="btn btn-primary py-2" type="submit" style="background-color: #e28b3a; margin-top: 30px;">등록</button>
 		<button class="btn btn-primary py-2" style="background-color: #e28b3a; margin-top: 30px;" onclick="location.href='notice-out'">취소</button>
 	</td>
</tr>
</table>
</form>
</body>
</html>