<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>

<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "{#_mode}", // development or production
          "clientId": "{#_clientId}", // clientId
          "chainId": "{#_chainId}" // chainId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "{#_merchantUserKey}",
          "merchantPayKey": "{#_merchantPayKey}",
          "productName": "{#_productName}",
          "totalPayAmount": "{#_totalPayAmount}",
          "taxScopeAmount": "{#_taxScopeAmount}",
          "taxExScopeAmount": "{#_taxExScopeAmount}",
          "returnUrl": "{#_returnUrl}"
        });
    });

</script>

</body>
</html>