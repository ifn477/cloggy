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
<c:forEach items="${list}" var="pdetail">
<table align="center" width="1000px"  style="margin-top: 130px;">
<tr> 
		<td rowspan="3" align="left" width="40%">
		<img alt="상품썸네일" src="/dog/image/${pdetail.p_thumbnail }" width="350px;" height="400px;"></td>
		<td align="left" style="font-size: 50px; padding-left: 10px;">${pdetail.p_name }</td> 
</tr> 
<tr> 
		<td></td> 
</tr> 
<tr> 
		<td align="left" style="font-size: 30px; padding-left: 10px;">${pdetail.p_price }원</td> 
</tr> 
<tr>
		<td colspan="2" style="padding-top: 150px;">
		${pdetail.p_info }<br>
		<img alt="상세페이지" src="/dog/image/${pdetail.p_image}" width="700px;">
		</td>
</tr> 
<tr> 
		<td colspan="2" style="text-align: right;"> 
			<input type="button" value="수정" onclick="location.href='product-modifyForm?product_id=${pdetail.product_id}'">
		</td>
</table>
</c:forEach>
</body>
</html>