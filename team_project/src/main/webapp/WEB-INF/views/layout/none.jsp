<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
	<div id="popupcontainer">
		<div id="body">
			<t:insertAttribute name="body"/>
		</div>
	</div>
</body>
</html>