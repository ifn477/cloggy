<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="product-recommend" method="post">
<table border="1" align="center">
<tr> <th>선택</th> <th>상품이미지</th> <th>상품명</th> <th>가격</th> </tr>
<c:forEach items="${list}" var="recommendproduct">
<tr> <td><input type="checkbox" value="${recommendproduct.product_id }" name="recommend_select_product"></td> 
	 <td><img alt="추천상품썸네일" src="/dog/image/${recommendproduct.p_thumbnail }" style="height: 30px;"></td> 
	 <td>${recommendproduct.p_name}</td> <td>${recommendproduct.p_price}</td> </tr>
<tr>
     <input type="hidden" value="${product_id }" name="product_id">
</tr>
</c:forEach>
<tr>
   	 <td colspan="4"><input type="submit" value="전송"></td>
</tr>
</table>
</form>
</body>
</html>