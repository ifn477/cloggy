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
#noticebnt{
	vertical-align: top; 
	margin-top: 0; 
	margin-bottom: 0; 
	background-color: #A8A8A8;
	width: 70px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="600px" style="border-top: none;">
<tr>
	<td colspan="4" style="text-align: center; border-bottom: none;">
	    <form action="notice-searchview" method="post">
	        <select name="noticeitem" style="width: 70px; height: 30px; margin-bottom: 50px;" class="search-select">
			 		<option value="n_title">제목</option>
			 		<option value="n_content">내용</option>
			 	</select>
	        <input type="text" name="noticevalue"  style="height: 30px; width: 200px; border: 1px solid #DBDBDB; margin-bottom: 50px;">
	        <button class="btn btn-primary py-2" id="noticebnt" type="submit" style="margin-bottom: 50px;">검색</button>
	    </form>
	</td>
</tr>
<tr>
	<th style="width: 10%;">글번호</th> 
	<th style="width: 45%;">제목</th>
	<th style="width: 15%;">작성자</th>
	<th style="width: 15%;">작성일자</th>
</tr>
<c:forEach items="${list }" var="notice">
<tr>
<td>${notice.n_number}</td>
<td><a href="notice-detail?n_number=${notice.n_number}">${notice.n_title}</a></td>
<td>${notice.userId}</td>
<td>${fn:substring(notice.n_date,0,10)}</td>
</tr>
</c:forEach>

</table>
</body>
</html>
