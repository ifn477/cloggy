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
<div>
<div class="boardnavi">
    <a href="info" class="navi00 on"><span>ABOUT</span></a>
    <a href="notice-out" class="navi01"><span>공지사항</span></a>
    <a href="qna-out" class="navi02"><span>문의게시판</span></a>
    <a href="/article/delay/2/555036/" class="navi03"><span>입고지연</span></a>
    <a href="/board/review/4/" class="navi04"><span>사용후기</span></a>
    <a href="/board/index.html" class="navi05"><span>자주묻는질문</span></a>
</div>

<table border="1" align="center" width="600px" style="text-align: left;">
    <tr><th>글번호</th> <th>제목</th><th>작성자</th><th>작성일자</th></tr>
    <c:forEach items="${list }" var="notice">
    <tr>
        <td>${notice.n_number}</td>
        <td>
            <a href="notice-detail?n_number=${notice.n_number}">${notice.n_title}</a>
        </td>
        <td>${notice.userId}</td>
        <td>${fn:substring(notice.n_date,0,10)}</td>
    </tr>
    </c:forEach>
</table>
<div class="button-container" style="text-align: center; margin-top: 20px;">
    <c:choose>
        <c:when test="${member.auth_id == 0}">
            <a href="notice-inputtest" class="btn btn-primary1">글쓰기</a>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
</div>

<div align="center" style="margin-top: 20px;">
    <form action="notice-searchview" method="post">
        <select name="noticeitem">
            <option value="n_title">제목</option>
            <option value="n_content">내용</option>
        </select>
        <input type="text" name="noticevalue">
        <input type="submit" value="검색">
    </form>
</div>

</div>


</body>
</html>
