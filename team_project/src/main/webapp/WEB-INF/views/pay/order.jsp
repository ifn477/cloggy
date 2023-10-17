 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 진행상태바 -->
   <ul class="order-status">
      <li>장바구니</li>
      <li>주문/결제</li>
      <li>완료</li>
   </ul>
   
<!--      <form action="order-save" method="post"> -->
         
            <table border="1" align="center">
                    <colgroup>
                        <col style="width: 170px">
                        <col style="width: *">
                    </colgroup>
            <!-- 배송지정보 -->
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="ordername"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="phone"></td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                        <input class="address1_input" name="address1" readonly="readonly">
                            <a class="address_search_btn" onclick="execution_daum_address()">우편번호검색</a><br>
                            <input class="address2_input" name="address2" readonly="readonly"><br>
                            <input class="address3_input" name="address3" readonly="readonly"></td>
                    
                </table>
      
            <!-- 상품 정보 -->
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
                  <td>${order.p_name}<input type="hidden" name="product_id"
                  value="${cart.product_id}"></td>
                  <td><fmt:formatNumber pattern="#,##0원">${order.p_price}</fmt:formatNumber>
               <span id="price-${loop.index}"
                  style="display: none;">${order.p_price}</span>
               <td> ${order.cart_quantity}</td>
               <td> ${(order.cart_quantity*order.p_price)}</td>
               
               </tr>   
               </c:forEach>
               
            </table>
            <!-- 포인트 정보 -->
            <!-- 주문 종합 정보 -->
      
      <div>
<!--          <input type="submit" value="결제하기"> -->
      </div>
   </form>


</body>
</html>