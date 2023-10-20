<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="coupon-save" method="post">
<table border="1" align="center">
<tr> <th>쿠폰명</th> <td><input type="text" name="c_name"></td> </tr>
<tr> <th>수량(인당)</th> <td><input type="text" name="c_stock"></td> </tr>
<tr> <th>할인율(%)</th> <td><input type="text" name="c_discount">%</td> </tr>
<tr> <th>혜택시작일</th> <td><input type="date" name="c_startdate" id="coupon_startdate_limit"></td> </tr>
<tr> <th>혜택종료일</th> <td><input type="date" name="c_enddate" id="coupon_enddate_limit"></td> </tr>
<tr> <td colspan="2" style="text-align: center;">
	 <input type="submit" value="등록"></td>
</tr>
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
    document.getElementById("coupon_startdate_limit").setAttribute("min", todaydate);
    document.getElementById("coupon_enddate_limit").setAttribute("min", todaydate);
</script>
</body>
</html>