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
<tr> <th>쿠폰명</th> <th>수량</th> <th>할인율(%)</th> <th>혜택시작일</th> <th>혜택종료일</th> <th>수정/삭제</th> </tr>
<c:forEach items="${list }" var="coupon">
<tr> <td>${coupon.c_name }</td> <td>${coupon.c_stock }</td> <td>${coupon.c_discount }</td> 
	 <td>${coupon.c_startdate }</td> <td>${coupon.c_enddate }</td>
	 <td>
	 <input type="button" value="수정" onclick="location.href='coupon-modifyform?c_code=${coupon.c_code }'">
	 <input type="button" value="삭제" onclick="location.href='coupon-delete?c_code=${coupon.c_code }'">
	 </td>
</c:forEach>
</table>
</body>
</html>