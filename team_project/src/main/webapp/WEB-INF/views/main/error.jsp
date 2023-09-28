<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var cf = confirm("로그인 후 사용가능합니다");
if(cf==true){
	window.location='loginform';
}
else{
	window.location='main';
}
</script>
</body>
</html>