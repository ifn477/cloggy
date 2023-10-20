<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 입력</title>
</head>
<body>
<form name="pop"> 
	<img alt="무료배송" src="/dog/image/2708925.jpg">
	<input type="checkbox" name="Notice" value="">다음부터 공지창 띄우지 않음 
	<input type="button" value="닫기" onclick="closeWin()">
</form> 

<script type="text/javascript"> 

	// 쿠키를 만듭니다. 아래 closeWin() 함수에서 호출됩니다

	function setCookie( name, value, expiredays ) 
	{ 
			var todayDate = new Date(); 
			todayDate.setDate( todayDate.getDate() + expiredays ); 
			document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
			} 

	// 체크후 닫기버튼을 눌렀을때 쿠키를 만들고 창을 닫습니다

	function closeWin() 
	{ 
			if ( document.pop.Notice.checked ) 
			setCookie( "Notice", "done" , 1);  // 오른쪽 숫자는 쿠키를 유지할 기간을 설정합니다
			self.close(); 
	} 

</script> 
</body>
</html>