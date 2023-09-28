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
<c:forEach items="${list}" var="qna">
<form action="qna-replysave" method="post">
<table border="1" align="center">
<caption>답글작성</caption>
<!--  -->
<tr>
<!-- hidden 사용해서 사용자에게는 안보이고 replysave에서는 받아줄수있음 -->
    <td><input type="hidden" name="q_number" value="${qna.q_number}"></td>
    <td><input type="hidden" name="q_groups" value="${qna.q_groups}"></td>
    <td><input type="hidden" name="q_step" value="${qna.q_step }"></td>
    <td><input type="hidden" name="q_indent" value="${qna.q_indent }"></td>
</tr>

<!--  -->
<tr>
    <th>작성자</th>
    <td><input type="text" name="userId"></td>
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
   
    <td colspan="2">
       <input type="submit" value="등록">
       <button type="button" onclick="location.href='qna-out'">취소</button>
       
       </td>
</tr>
</table>
</c:forEach>
</body>
</html>