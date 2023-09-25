<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table{
 margin-bottom: 150px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" border="1" width="600px">
	<caption>제품 리스트</caption>
		<c:forEach items="${list}" var="pd">
			<tr>
				<td><a href="product-detail?product_id=${pd.product_id}">${pd.p_name}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>