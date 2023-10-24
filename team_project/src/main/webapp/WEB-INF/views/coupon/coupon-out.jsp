<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/widthtable.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center">
<caption>쿠폰조회</caption>
<tr> <th style="width: 30%;">쿠폰명</th> 
	 <th style="width: 10%;">수량</th> 
	 <th style="width: 10%;">할인율(%)</th> 
	 <th>혜택시작일</th> <th>혜택종료일</th> 
	 <th style="width: 30%;">수정/삭제</th> </tr>
<c:forEach items="${list }" var="coupon">
<tr> <td>${coupon.c_name }</td> <td>${coupon.c_stock }</td> <td>${coupon.c_discount }</td> 
	 <td>${coupon.c_startdate }</td> <td>${coupon.c_enddate }</td>
	 
	 
<td colspan="2" style="text-align: center; ">
	<input type="button" value="수정" style="background-color: #e28b3a; width:60px; height:30px; color: white;" onclick="location.href='coupon-modifyform?c_code=${coupon.c_code }'"> 
	<input type="button" value="삭제" style="background-color: #e28b3a; width:60px; height:30px; color: white;" onclick="location.href='coupon-delete?c_code=${coupon.c_code }'"> 
</td>
</tr>
</c:forEach>
</table>
</body>
</html>
