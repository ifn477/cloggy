<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>주문상세내역</h2>
<c:if test="${!empty list }">
    <c:forEach items="${list }" var="odlist" varStatus="status">
        <c:if test="${status.index eq 0}">
            <dl class="order">
                <dt>주문번호</dt>
                <dd>${odlist.order_id}</dd>
                <dt>주문일자</dt>
                <dd>${odlist.orderdate }</dd>
            </dl>
        </c:if>
    </c:forEach>
</c:if>

<table align="center" border="1">
<tr>
<th>상품정보</th><th>판매가</th><th>수량</th><th>구매가</th><th>주문상태</th>
</tr>
<c:forEach items="${list }" var="odlist">
<tr>
	<td><a href="product-detail?product_id=${odlist.product_id }">
	<img src="/dog/image/${odlist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${odlist.product_id }"  text-decoration: none;">${odlist.p_name}</a></td>
	<td>${odlist.o_price}</td>
	 <td>${odlist.o_quantity}</td>
	<td>${odlist.o_price}</td>  <!-- 	할인된금액  -->
	<td>${odlist.d_status}<br>
	</td>
</tr>
</c:forEach>
</table>
<h2>배송지 정보</h2>
<table border="1" align="center">
    <tr>
        <th>이름</th>
        <c:forEach items="${list }" var="odlist" varStatus="status">
            <c:if test="${status.index eq 0}">
                <td>${odlist.addressee }</td>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <th>연락처</th>
        <c:forEach items="${list }" var="odlist" varStatus="status">
            <c:if test="${status.index eq 0}">
                <td>${odlist.phone }</td>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <th>배송지 주소</th>
        <c:forEach items="${list }" var="odlist" varStatus="status">
            <c:if test="${status.index eq 0}">
                <td>${odlist.address }</td>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <th>배송메시지</th>
        <c:forEach items="${list }" var="odlist" varStatus="status">
            <c:if test="${status.index eq 0}">
                <td>${odlist.ordermemo }</td>
            </c:if>
        </c:forEach>
    </tr>
</table>
</body>
</html>