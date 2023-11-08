<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<style type="text/css">
table
{
border-top: none;
}
td{
text-align: center;
}
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
caption {
	margin-bottom: 5px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <div class="boardnavi"> -->
<!--     <a href="info" class="navi00 on"><span>ABOUT</span></a> -->
<!--     <a href="notice-out" class="navi01"><span>공지사항</span></a> -->
<!--     <a href="qna-out" class="navi02"><span>문의게시판</span></a> -->
<!--     <a href="/article/delay/2/555036/" class="navi03"><span>입고지연</span></a> -->
<!--     <a href="/board/review/4/" class="navi04"><span>사용후기</span></a> -->
<!--     <a href="/board/index.html" class="navi05"><span>자주묻는질문</span></a> -->
<!-- </div> -->

<table align="center" width="600px">
<caption>공지사항</caption>
	<tr> 	
	    <td colspan="4" style="text-align: right; border-bottom: none; border-top: none;">
		    <c:choose>
		        <c:when test="${member.auth_id == 0}">
		            <a href="notice-inputtest" class="btn btn-primary py-2"  style="background-color: #e28b3a;">글쓰기</a>
		        </c:when>
		        <c:otherwise></c:otherwise>
		    </c:choose>
		</td>
	</tr>   
	<tr>
	  <th style="width:10%">글번호</th> 
	  <th style="width:45%">제목</th>
	  <th style="width:15%">작성자</th>
	  <th style="width:15%">작성일자</th>
	</tr>
<c:forEach items="${list }" var="notice">
    <tr>
        <td>${notice.n_number}</td>
        <td style="text-align: left;">
            <a href="notice-detail?n_number=${notice.n_number}">${notice.n_title}</a>
        </td>
        <td>${notice.userId}</td>
        <td>${fn:substring(notice.n_date,0,10)}</td>
    </tr>
</c:forEach>

<!--페이징 처리-->
<tr style="border-left: none;border-right: none; border-bottom: none;">
   <td colspan="4" style="text-align: center; border-bottom: none;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="notice-out?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
      
   </c:if>   
   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: #d88402;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="notice-out?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
     
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="notice-out?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
   </c:if>
   
   </td>
</tr>
<!--페이징 처리-->
	<tr>
		<td colspan="4" style="text-align: center; border-bottom: none;">
		    <form action="notice-searchview" method="post">
		        <select name="noticeitem">
		            <option value="n_title">제목</option>
		            <option value="n_content">내용</option>
		        </select>
		         <input type="text" name="noticevalue" style="height: 30px; width: 200px; border: 1px solid #DBDBDB; margin-top: 30px;">
		        <button class="btn btn-primary py-2" id="noticebnt" type="submit" style="margin-top: 30px">검색</button>
		    </form>
		</td>
	</tr>
</table>
</body>
</html>
