<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.title{
width: 300px;
font-weight: bolder;
}
.tbox1{
width: 50px;
}
.tbox2{
width: 250px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" style="margin-top: 70px;width: 300px;" >
<caption ><h3>장바구니</h3></caption>
<tr><td class="title" colspan="2">주문자 정보</td></tr>
<tr><td class="tbox1">${mdto.userName}</td><td class="tbox2">${mdto.phone}</td>
<tr><td class="title" >배송지 정보</td></tr> 
<tr><td colspan="2">${mdto.address}</td></tr>
  <c:forEach items="${list}" var="cout">
    <td>
      <table style="margin-right: 30px; margin-bottom: 50px;">
        <tr>
        
<!-- 제품 체크박스  -->
          <td><input type="checkbox" name="optionckhd">
          <a href="product-detail?product_id=${cout.product_id }" style="font-size: 20px; text-decoration: none;">${cout.product_id}</a>
<%--           <img alt="상품썸네일" src="/dog/image/${cout.p_thumbnail}" width="250px;" height="300px;"></td> --%>
          <td>${cout.cart_quantity}개</td>
        </tr>


<!-- 가격정보추가 -->
<!-- 개당가격, 배송비, 총 결제 금액 -->

        <tr>
        	<td><input type="submit" value="결제하기"></td>
        </tr>
      </table>
    </td>
  </c:forEach>
</table>
</body>
</html>