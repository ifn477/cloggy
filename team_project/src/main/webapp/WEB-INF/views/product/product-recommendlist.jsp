<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" a href="/dog/css/widthtable.css">
<style type="text/css">
table {
	width: 600px;
	margin-top: 3rem;
	margin-bottom: 3rem;	
}
.box{
	width: 15px;
}
caption {
	font-size: 17px;
	margin-bottom: 15px;
	margin-left: 3px;
	font-weight: 400;
	text-align: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="product-recommend" method="post">
<table align="center">
<caption>추천상품등록</caption>
<tr> 
	<th style="width: 10%;">선택</th> 
	<th style="width: 20%;">상품이미지</th> 
	<th style="width: 50%;">상품명</th> 
	<th>가격</th> 
</tr>
<c:forEach items="${list}" var="recommendproduct">
<tr> <td><input type="checkbox" class="box" value="${recommendproduct.product_id }" name="recommend_select_product"></td> 
	 <td><img alt="추천상품썸네일" src="/dog/image/${recommendproduct.p_thumbnail }" style="height: 50px;"></td> 
	 <td>${recommendproduct.p_name}</td> <td>${recommendproduct.p_price}</td> </tr>
<tr>
     <input type="hidden" value="${product_id }" name="product_id">
</tr>
</c:forEach>
<tr>
   	 <td colspan="4" style="border-bottom: none;">
   	 	<input type="submit" value="등록" style="background-color: #e28b3a; width:150px; height:35px; color: white; margin-top: 10px;"> 
   	 </td>
</tr>
</table>
</form>
</body>
</html>