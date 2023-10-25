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
<div id="odercoml">
<h1>
주문이 완료되었습니다
</h1>

<c:forEach items="${list }" var="ocompl">
	<table align="center">
	<caption>결제정보</caption>
		<tr><th>총삼품금액</th><td>${ocompl.totlaprice}</td></tr>
		<tr><th>할인금액</th><td>0원</td></tr>
		<tr><th>배송비</th><td>${ocompl.shipping}</td></tr>
	</table>
	
	<table align="center">
		<caption>배송정보</caption>
		<tr><th>받는분</th><td>${ocompl.addressee}</td></tr>
		<tr><th>연락처</th><td>${ocompl.phone}</td></tr>
		<tr><th>주소</th><td>${ocompl.address}</td></tr>
	</table>
	</c:forEach>
</div>
</body>
</html>