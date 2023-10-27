 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="please">

	<!-- 진행상태바 -->
	<ul class="order-status">
		<li>장바구니</li>
		<li>주문/결제</li>
		<li>완료</li>
	</ul>
	

         
            <h1 class="page-header">배송지정보</h1>
            <table border="1" align="center">
                    <colgroup>
                        <col style="width: 170px">
                        <col style="width: *">
                    </colgroup>
				<!-- 배송지정보 -->
                    <tr>
                        <th>이름</th>
                        <td><input class="addname_input" type="text" name="addressee" id="addressee"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input class="phone_in" type="text" name="phone" id="phone"></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                        <input class="address1_input" name="address1"  readonly="readonly">
                            <a class="address_search_btn" onclick="execution_daum_address()">우편번호검색</a><br>
                            <input class="address2_input" name="address2"  readonly="readonly"><br>
                            <input class="address3_input" name="address3" ></td>
                    </tr>
                     
                </table>
      				<input type="hidden" id="userId" value="${member.userId}" >
    		  <!-- 배송지요청사항 -->
    		   <h1 class="page-header">배송 요청사항</h1>
    		  <table align="center">
    		   <tr>
    		   <th>배송 메세지</th>
    		   <td>
				<select class="ordermemo" title="택배배송 메시지를 선택해주세요." name="ordermemo" style="width:350px" id="ordermemo">
				    <option value="MH">배송메시지를 선택해주세요.</option>
				    <option value="10">그냥 문 앞에 놓아 주시면 돼요.</option>
				    <option value="20">도착 후 전화주시면 직접 받으러 갈게요.</option>
				    <option value="30">벨을 누르지 말아주세요.</option>
				    <option value="40">직접 받을게요.(부재 시 문앞)</option>
				</select>
						</td>
    		   </tr>
    		  </table>
    		  
    	
				<!-- 상품 정보 -->
				 <h1 class="page-header">배송상품</h1>
				<table border="1" align="center">
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>상품구매금액</th>
						
					
					<c:forEach items="${ list}" var="order">
				
					<tr>
					    <td><img src="/dog/image/${order.p_thumbnail}" width="100px"></td>
					    <td>${order.p_name}</td>
					    <td><fmt:formatNumber pattern="#,##0원">${order.p_price}</fmt:formatNumber>
					        <span id="price-${loop.index}" style="display: none;">${order.p_price}</span></td>
					    <td>${order.cart_quantity}</td>
					    <td id="subtotal-${loop.index}">${order.cart_quantity * order.p_price}</td>
					    <input type="hidden" name="product_id" id="product_id" class="product_id" value="${order.product_id}">
						<td><input type="hidden" name="p_price" id="o_price" class="o_price" value="${order.p_price}"></td>
						<td><input type="hidden" name="cart_quantity" id="o_quantity" class="o_quantity" value="${order.cart_quantity}"></td>
					</tr>
					
					  <c:set var="subtotal" value="${order.cart_quantity * order.p_price}" />
    				<c:set var="totalPrice" value="${totalPrice + subtotal}" />

					</c:forEach>

    <c:choose>
        <c:when test="${totalPrice < 30000}">
            <c:set var="shipping" value="3000" /> <!-- 배송료를 3000원으로 설정 -->
          
        </c:when>
        <c:otherwise>
        	<c:set var="shipping" value="0" /> 
         
        </c:otherwise> 
    </c:choose>
			</table>


				<!-- 쿠폰 -->
				쿠폰선택(결제 시 적용)<br>
				<select name="selectcoupon" id="selectcoupon">
					<c:forEach items="${couponlist }" var="couponlist">
						<option value="${couponlist.c_discount}">${couponlist.c_name}/${couponlist.c_discount}% 할인</option>
					</c:forEach>
				</select>
		
				<!-- 결제금액 -->
				<h2 class="sub-title2">최종 결제정보</h2>
			<table align="center">
			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>총 결제금액</th>
			</tr>
			<tr>
				<td>${totalPrice}</td>
				<td>${shipping}</td>
				<td>${totalPrice+shipping}</td>
				<input name="totalprice" type="hidden" value="${totalPrice }" id="totalprice">
				<input name="shipping" type="hidden" value="${shipping }" id="shipping">
				
			</tr>
			
		</table>
			
	
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}
</script>	

<!-- jQuery -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	
	let productIds = [];
	$("input.product_id").each(function() {
	    productIds.push($(this).val());
	});
	
	let prices=[];
	$("input.o_price").each(function() {
		prices.push($(this).val());
	});
	
	let quantity=[];
	$("input.o_quantity").each(function() {
		quantity.push($(this).val());
	});



function kakakoPayorder() {

		
		var totalprice = document.getElementById("totalprice").value;
		var selectcoupon = $("#selectcoupon").val();
		var shipping = document.getElementById("shipping").value;
		var userId = $("#userId").val();
		var ordermemo = $("#ordermemo").val();
	   	var addressee = $("#addressee").val();
	   	var phone = $("#phone").val();
	   	var add1 = $(".address1_input").val();
	   	var add2 = $(".address2_input").val();
	   	var add3 = $(".address3_input").val();
		
		var finaltotalprice = totalprice - (totalprice * selectcoupon/100.0);
	   	
	   	
	   var today = new Date();
	   var hours = today.getHours(); // 시
	   var minutes = today.getMinutes();  // 분
	   var seconds = today.getSeconds();  // 초
	   var milliseconds = today.getMilliseconds();
	   var orderId = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;
	   

	   
	   console.log("받는사람 : " +addressee);
	   console.log("주소1 : " +add1);
	   console.log("주소2 : " +add2);
	   console.log("주소3 : " +add3);
	   console.log("전번 : " +phone);
	   console.log("제품아이디 : " +productIds);
	   console.log("가격 : " +prices);
	   console.log("수량 : " +quantity);
	   
	      
	
    var IMP = window.IMP;
    IMP.init("imp55581632");
    
    IMP.request_pay(
        {
            pg: "kakaopay",       // KG이니시스 pg 파라미터 값
            pay_method: "card",   // 결제 방법
            merchant_uid: orderId, // 주문번호
            name: "(주)Cloggy",     // 상품 명
            amount: finaltotalprice,            // 금액
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
        },
        function (rsp) {
            // rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            if (rsp.success) {
                // 결제가 성공하면 서버로 요청 보냅니다.
                $.ajax({
                    type: "POST",
                    url: "ordersave",
                    data: {
                    	productIds : productIds.join(","),
                    	prices : prices.join(","),
                    	quantity : quantity.join(","),
                    	"add1": add1,
                    	"add2": add2,
                    	"add3": add3,
                    	"totalprice": totalprice,
                    	"selectcoupon": selectcoupon,
                    	"userId": userId,
                    	"shipping": shipping,
                    	"ordermemo": ordermemo,
                    	"phone": phone,
                    	"addressee": addressee
             
                    	
                    },
                    
                    
                    
                    success: function (response) {
                        if (response.success) {
                            alert("결제가 완료되었습니다!");
                            window.location.href = "order-completed.jsp";
                        } else {
                            alert("주문이 완료되었습니다");
                           $("#odercoml").html(data);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("서버 오류: " + error);
                    }
                });
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        }
    );
}

function inicisPay() {

	
	var totalprice = document.getElementById("totalprice").value;
	var selectcoupon = $("#selectcoupon").val();
	var shipping = document.getElementById("shipping").value;
	var userId = $("#userId").val();
	var ordermemo = $("#ordermemo").val();
   	var addressee = $("#addressee").val();
   	var phone = $("#phone").val();
   	var add1 = $(".address1_input").val();
   	var add2 = $(".address2_input").val();
   	var add3 = $(".address3_input").val();

   	var finaltotalprice = totalprice - (totalprice * selectcoupon/100.0);
   	
   var today = new Date();
   var hours = today.getHours(); // 시
   var minutes = today.getMinutes();  // 분
   var seconds = today.getSeconds();  // 초
   var milliseconds = today.getMilliseconds();
   var orderId = `${hours}` + `${minutes}` + `${seconds}` + `${milliseconds}`;
   

   console.log("##쿠폰할인율##:"+selectcoupon); // 콘솔에 값 출력
   console.log("##쿠폰적용가격##:"+totalprice); // 콘솔에 값 출력   
   console.log("받는사람 : " +addressee);
   console.log("주소1 : " +add1);
   console.log("주소2 : " +add2);
   console.log("주소3 : " +add3);
   console.log("전번 : " +phone);
   console.log("제품아이디 : " +productIds);
   console.log("가격 : " +prices);
   console.log("수량 : " +quantity);
   
      

var IMP = window.IMP;
IMP.init("imp55581632");

IMP.request_pay(
    {
        pg: "html5_inicis",       // KG이니시스 pg 파라미터 값
        pay_method: "card",   // 결제 방법
        merchant_uid: orderId, // 주문번호
        name: "(주)Cloggy",     // 상품 명
        amount: finaltotalprice,            // 금액
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    },
    function (rsp) {
        // rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        if (rsp.success) {
            // 결제가 성공하면 서버로 요청 보냅니다.
            $.ajax({
                type: "POST",
                url: "ordersave",
                data: {
                	productIds : productIds.join(","),
                	prices : prices.join(","),
                	quantity : quantity.join(","),
                	"add1": add1,
                	"add2": add2,
                	"add3": add3,
                	"totalprice": totalprice,
                	"selectcoupon": selectcoupon,
                	"userId": userId,
                	"shipping": shipping,
                	"ordermemo": ordermemo,
                	"phone": phone,
                	"addressee": addressee
         
                	
                },
                
                
                
                success: function (response) {
                    if (response.success) {
                        alert("결제가 완료되었습니다!");
                        window.location.href = "order-completed.jsp";
                    } else {
                        alert("주문이 완료되었습니다");
                       $("#odercoml").html(data);
                    }
                },
                error: function (xhr, status, error) {
                    alert("서버 오류: " + error);
                }
            });
        } else {
            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
        }
    }
);
}
</script>
<a onclick="inicisPay()">
<img alt="일반결제" src="/dog/resources/image/ini.jpg" height="48px">
</a>

<a onclick="kakakoPayorder()">
<img alt="카카오페이" src="/dog/image/payment_icon_yellow_medium.png" height="48px">
</a>

</div>
</body>
</html>
