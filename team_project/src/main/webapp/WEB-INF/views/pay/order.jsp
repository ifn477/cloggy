<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <!-- jQuery -->
    <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    <script>
        var IMP = window.IMP;
        IMP.init("imp55581632");

        function kakakoPay() {
            IMP.request_pay(
                {
                    pg: "kakaopay",		//KG이니시스 pg파라미터 값
                    pay_method: "card",		//결제 방법
                    merchant_uid: "1234578",//주문번호
                    name: "당근 10kg",		//상품 명
                    amount: 200,			//금액
      				buyer_email: "gildong@gmail.com",
      				buyer_name: "홍길동",
      				buyer_tel: "010-4242-4242",
      				buyer_addr: "서울특별시 강남구 신사동",
      				buyer_postcode: "01181"
     	
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        //서버 검증 요청 부분
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                    }
                }
            );
        }
       
        function inicisPay() {
            IMP.request_pay(
                {
                    pg: "html5_inicis",		//KG이니시스 pg파라미터 값
                    pay_method: "card",		//결제 방법
                    merchant_uid: "1234578",//주문번호
                    name: "당근 10kg",		//상품 명
                    amount: 200,			//금액
      				buyer_email: "gildong@gmail.com",
      				buyer_name: "홍길동",
      				buyer_tel: "010-4242-4242",
      				buyer_addr: "서울특별시 강남구 신사동",
      				buyer_postcode: "01181"
     	
                },
                function (rsp) {
      				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
                    if (rsp.success) {
                        //서버 검증 요청 부분
                    } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                    }
                }
            );
        }
    </script>
    <meta charset="UTF-8"/>
    <title>Sample Payment</title>
</head>
<body>



<a onclick="kakakoPay()">
<img alt="카카오페이" src="/dog/image/payment_icon_yellow_medium.png" height="48px">
</a>
<a onclick="inicisPay()">
<img alt="일반결제" src="/dog/image/ini.jpg" height="48px">
</a>
<!-- <button onclick="inicisPay()">일반결제</button> -->
<!-- 결제하기 버튼 생성 -->
</body>
</html>