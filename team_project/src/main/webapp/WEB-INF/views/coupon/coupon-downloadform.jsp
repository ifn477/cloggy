<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" align="center">
<tr> <th>쿠폰명</th> <th>할인율(%)</th> <th>다운로드</th> </tr>
<c:forEach items="${list }" var="coupondown">
<tr> <td>${coupondown.c_name }</td> <td>${coupondown.c_discount }%</td> 
	 <td><a href="coupon-download?c_code=${coupondown.c_code}&c_enddate=${coupondown.c_enddate}
	 							  &c_stock=${coupondown.c_stock}&userId=${member.userId}">다운로드</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>