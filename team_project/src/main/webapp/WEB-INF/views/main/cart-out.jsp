<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.title{
width: 300px;
font-weight: bolder;
}
.tbox1{
width: 50px;
}
.tbox2{
width: 250px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <table align="center" style="margin-top: 70px;width: 300px;" > -->
<%-- <caption ><h3>장바구니</h3></caption> --%>
<!-- <tr><td class="title" colspan="2">주문자 정보</td></tr> -->
<%-- <tr><td class="tbox1">${mdto.userName}</td><td class="tbox2">${mdto.phone}</td> --%>
<!-- <tr><td class="title" >배송지 정보</td></tr>  -->
<%-- <tr><td colspan="2">${mdto.address}</td></tr> --%>
<%--   <c:forEach items="${list}" var="cout"> --%>
<!--     <td> -->
<!--       <table style="margin-right: 30px; margin-bottom: 50px;"> -->
<!--         <tr> -->
        
<!-- <!-- 제품 체크박스  --> -->
<!--           <td><input type="checkbox" name="optionckhd"> -->
<%--           <a href="product-detail?product_id=${cout.product_id }" style="font-size: 20px; text-decoration: none;">${cout.product_id}</a> --%>
<%-- <%--           <img alt="상품썸네일" src="/dog/image/${cout.p_thumbnail}" width="250px;" height="300px;"></td> --%> --%>
<%--           <td>${cout.cart_quantity}개</td> --%>
<!--         </tr> -->

<!-- <!-- 개당가격, 배송비, 총 결제 금액 --> -->
		
<!--         <tr> -->
<!--         	<td><input type="submit" value="결제하기"></td> -->
<!--         </tr> -->
<!--       </table> -->
<!--     </td> -->
<%--   </c:forEach> --%>
<!-- </table> -->

<form name="orderform" id="orderform" method="post" class="orderform" action="/Order">

    <div class="basket" id="basket">

        <!-- "장바구니 헤더" -->

        <div class="row head">

            <div class="check">선택</div>

            <div class="img">이미지</div>

            <div class="pname">상품명</div>

            <div class="basketprice">가격</div>

            <div class="num">수량</div>

            <div class="sum">합계</div>

            <div class="basketcmd">삭제</div>
            
        </div>

        <!-- "장바구니 상품 목록" -->

        <div class="row data">

            <div class="check"><input type="checkbox" name="buy" value="260" checked="">&nbsp;</div>

            <div class="img"><img src="./img/basket1.jpg" width="60"></div>

            <div class="pname">

                <span>찜마마(XJ-92214/3)</span>

            </div>

            <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>

            <div class="num">

                <!-- "장바구니 수량 변경" -->

                <div class="updown">

                    <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2">

                    <span><i class="fas fa-arrow-alt-circle-up up"></i></span>

                    <span><i class="fas fa-arrow-alt-circle-down down"></i></span>

                </div>

            </div>

            <!-- "장바구니 상품 합계" -->

            <div class="sum">40,000원</div>

            <div class="basketcmd"><a href="#" class="abutton">삭제</a></div>

        </div>

    </div>

    <!-- "장바구니 기능 버튼" -->

    <div class="right-align basketrowcmd">

        <a href="#" class="abutton">선택상품삭제</a>

        <a href="#" class="abutton">장바구니비우기</a>

    </div>

    <!-- "장바구니 전체 합계 정보" -->

    <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>

    <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>



    <div id="goorder" class="">

        <div class="clear"></div>

        <div class="buttongroup center-align cmd">

            <a href="#">선택한 상품 주문</a>

        </div>

    </div>

</form>
</body>
</html>