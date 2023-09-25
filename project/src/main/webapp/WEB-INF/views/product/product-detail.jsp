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
	<table width="500px" height="500px" border="1" align="center">
		<caption>제품 상세페이지</caption>
			<tr>
				<td><img src="/dog/image/${dto.p_thumbnail}" width="500px"
					height="500px"></td>
			</tr>
			<tr>
				<td>${dto.p_name}</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
	</table>
</body>
</html>