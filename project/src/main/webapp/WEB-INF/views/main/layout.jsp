<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
@font-face {
font-family: 'UhBeeJJIBBABBA';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_five@.2.0/UhBeeJJIBBABBA.woff') format('woff');
font-weight: normal;
font-style: normal;
}
#maintext{
	font-family: 'UhBeeJJIBBABBA';
}
#title{
	font-size: 43px;
	font-family: 'UhBeeJJIBBABBA';
	color: #8C4164;
	height: 130px;
	line-height: 160px;
	margin-top: 0px;
	margin-bottom: 0px;
}
#container {
	border: 0px solid #bcbcbc;
}
#header {
	text-align: center;
	width: 100%;
}
#nav {
	width: 100%;
}
#body {
	text-align: center;
	width: 100%;
}
#footer {
position:fixed;
bottom:0px;
	width: 100%;
	text-align: center;
	font-size: 20px;
	line-height: 30px;
	height: 30px;
	background-color: #000000;
	color:white;
}
img{
margin-top: 100px;
}
th{
	background-color: #FFB8E0;
	color: #ffffff;
	padding-left: 5px;
}
</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="top">
			<t:insertAttribute name="top"/>
		</div>
		<div id="body">
			<t:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<t:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>