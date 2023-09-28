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
<table align="center" style="margin-top: 70px;">
<!-- var 이름 pout -> pd로 변경함 -->
  <c:forEach items="${list}" var="pd" varStatus="loop">
    <c:if test="${loop.index % 4 == 0}">
      <tr> <!-- 4개의 테이블을 나란히 출력한 후 다음 행으로 넘어감 -->
    </c:if>
    <td>
      <table style="margin-right: 30px; margin-bottom: 50px;">
        <tr>
          <td>
          <a href="product-detail?product_id=${pd.product_id }">
          <img alt="상품썸네일" src="/dog/image/${pd.p_thumbnail}" width="250px;" height="300px;"></td>
          </a>
        </tr>
        <tr>
          <td>
          <a href="product-detail?product_id=${pd.product_id}" style="font-size: 20px; text-decoration: none;">${pd.p_name}</a>
          </td>
        </tr>
        <tr>
          <td>${pd.p_price}</td>
        </tr>
      </table>
    </td>
    <c:if test="${loop.index % 4 == 3 or loop.last}">
      </tr> <!-- 한 행에 4개의 테이블 출력 후 닫음 -->
    </c:if>
  </c:forEach>
</table>
</body>
</html>