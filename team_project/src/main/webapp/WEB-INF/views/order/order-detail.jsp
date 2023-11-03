<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/heighttable.css">
<style>
table {
   font-family: 'Noto Sans KR', sans-serif;
   margin-bottom: 2rem;
   border-top: 1px solid #f6eddf;
   border-collapse: collapse;
}
.pcontent td{
	text-align: center!important;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align="center">
<caption>주문상세내역</caption>

<c:if test="${!empty list }">
    <c:forEach items="${list }" var="odlist" varStatus="status">
        <c:if test="${status.index eq 0}">
            <div class="order">
                <td colspan="5">주문번호 : ${odlist.order_id}&nbsp;&nbsp;&nbsp;&nbsp;
                	주문일자 : ${odlist.orderdate }</td>
            </div>
        </c:if>
    </c:forEach>
</c:if>

<tr>
	<th style="width:45%">상품정보</th>
	<th style="width:15%">판매가</th>
	<th style="width:15%">수량</th>
	<th style="width:15%">구매가</th>
	<th style="width:15%">주문상태</th>
</tr>
<div class="pcontent">
<c:forEach items="${list }" var="odlist">
<tr>
	<td style="text-align: center;"><a href="product-detail?product_id=${odlist.product_id }&userId=${userId}">
	<img src="${odlist.p_thumbnail}" width="100px"></a>
	<a href="product-detail?product_id=${odlist.product_id}&userId=${userId}" style="text-decoration: none;">${odlist.p_name}</a></td>
	<td style="text-align: center;">${odlist.o_price}</td>
	<td style="text-align: center;">${odlist.o_quantity}</td>
	<td style="text-align: center;">${odlist.o_price}</td>  <!-- 	할인된금액  -->
	<td style="text-align: center;">${odlist.d_status}<br>
	</td>
</tr>
</c:forEach>
</div>
</table>

<table align="center">
<caption>배송지 정보</caption>
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
    <c:forEach items="${list}" var="odlist" varStatus="status">
        <c:if test="${status.index eq 0}">
            <c:set var="ordermemo" value="${odlist.ordermemo}" />
            <c:choose>
                <c:when test="${ordermemo eq '10'}">
                    <td>그냥 문 앞에 놓아 주시면 돼요.</td>
                </c:when>
                <c:when test="${ordermemo eq '20'}">
                    <td>도착 후 전화주시면 직접 받으러 갈게요.</td>
                </c:when>
                <c:when test="${ordermemo eq '30'}">
                    <td>벨을 누르지 말아주세요.</td>
                </c:when>
                <c:when test="${ordermemo eq '40'}">
                    <td>직접 받을게요.(부재 시 문앞)</td>
                </c:when>
                <c:otherwise>
                    <td>알 수 없는 배송메시지</td>
                </c:otherwise>
            </c:choose>
        </c:if>
    </c:forEach>
</tr>

</table>
</body>
</html>
