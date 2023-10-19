<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 입력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 포함 -->
</head>
<body>
<div id="notice_wrap" >
    <img src="/dog/image/2708925.jpg" alt="공지사항">
    <p class="closeWrap">
        <input type='checkbox' name='expiresChk' id='expiresChk'>
        <label for="expiresChk">하루동안 이 창 열지않기</label>
        <button class="closeBtn">닫기</button>
    </p>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(function(){
	    if($.cookie("popup") == "none"){
	    	$("#notice_wrap *").css("display", "none"); // "popup" 쿠키 값이 "none"인 경우, 창을 숨김
	    }

        var $expChk = $("#expiresChk");
        $(".closeBtn").on("click", closePop); 
        
        function closePop(){
            if($expChk.is(":checked")){
                $.cookie("popup", "none", { expires: 1, path: "/" });
            }
            $("#notice_wrap").fadeOut("fast", function() {
                window.close(); // 팝업 창 닫기
            });
        }
    });
</script>
</body>
</html>