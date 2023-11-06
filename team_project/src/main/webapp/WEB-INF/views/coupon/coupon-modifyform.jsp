<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="coupon-modify" method="post">
<table align="center">
<caption>쿠폰수정</caption>
<c:forEach items="${list}" var="couponmodify">
<tr> <th>쿠폰명</th> 
	 <td>
	 	<input type="text" name="c_name" value="${couponmodify.c_name}">
	 	<input type="hidden" name="c_code" value="${couponmodify.c_code}">
	 </td> 
</tr>
<tr> <th>수량</th> <td><input type="text" name="c_stock" value="${couponmodify.c_stock }"></td> </tr>
<tr> <th>할인율(%)</th> <td><input type="text" name="c_discount" value="${couponmodify.c_discount }">%</td> </tr>
<tr> <th>혜택시작일</th> <td><input type="date" name="c_startdate" id="couponmodify_startdate_limit"></td> </tr>
<tr> <th>혜택종료일</th> <td><input type="date" name="c_enddate" id="couponmodify_enddate_limit"></td> </tr>
<tr> <td colspan="2" style="text-align: center; border-bottom: none;">
	 <button class="btn btn-primary py-2" type="submit" style="background-color: #e28b3a; margin-top: 30px;">수정</button></td>
</tr>
</c:forEach>
</table>
</form>
<script>
    // 현재 날짜를 생성
    var today = new Date();
    
    // 날짜를 YYYY-MM-DD 형식의 문자열로 변환
    var yyyy = today.getFullYear();
    var mm = String(today.getMonth() + 1).padStart(2, "0");
    var dd = String(today.getDate()).padStart(2, "0");
    var todaydate = yyyy + "-" + mm + "-" + dd;
    
    // input 요소의 min 속성을 동적으로 설정
    document.getElementById("couponmodify_startdate_limit").setAttribute("min", todaydate);
    document.getElementById("couponmodify_enddate_limit").setAttribute("min", todaydate);
</script>
</body>
</html>
