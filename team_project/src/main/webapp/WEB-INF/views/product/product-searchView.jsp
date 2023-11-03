<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>  
<style type="text/css">
*{
	 	font-family: 'Noto Sans KR', sans-serif;
}
.content{
    max-width: 1300px;    
    margin: 0 auto;
    margin-top: 50px;
}
.container_box{
    display: flex;
    flex-wrap: wrap;
    gap: 50px 20px;
    margin-top: 3rem;
    margin-bottom: 10rem;
}
.product_item {
    min-height: 200px;
    flex-basis: 150px;
    flex-grow: 0;
    position: relative;
    margin-left:35px;
	justify-content: space-between;
}
.product_name{
	font-weight: 500;
}
.product_price{
	margin-top: 5px;
}
.product_thumbnail {
    position: relative;
}

.like-check{
    position: absolute;
    bottom: 65px;
    left: 15px;
    background-position: -180px -10px;
}
.listcomment{
    margin: 10px 0px 10px 0px;
    font-size: 15px;
    background-color: #f6eddf;
    padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<c:choose>
	<c:when test="${empty listall}">
	<h3 style="text-align: center; margin-top: 5rem; margin-bottom: 25rem;"><strong>'${p_name}'</strong>에 대한 검색결과가 없습니다.</h3>
	</c:when>
	<c:otherwise>
	<h3 style="text-align: center; margin-top: 5rem; margin-bottom: 3rem;"><strong>'${p_name}'</strong>에 대한 검색결과입니다.</h3>
<br>
<section class="content">
<p class="listcomment"> 전체 : 총 <strong>${fn:length(listall)}</strong> 건의 상품이 검색되었습니다. </p>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty listall}">
            <c:forEach items="${listall}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                    <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<p class="listcomment"> 사료 : 총 <strong>${fn:length(list1)}</strong> 건의 상품이 검색되었습니다. </p>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list1}">

            <c:forEach items="${list1}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 15px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                    <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<p class="listcomment"> 간식 : 총 <strong>${fn:length(list2)}</strong> 건의 상품이 검색되었습니다. </p>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list2}">
            <c:forEach items="${list2}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 15px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                    <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<p class="listcomment"> 용품 : 총 <strong>${fn:length(list3)}</strong> 건의 상품이 검색되었습니다. </p>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list3}">
            <c:forEach items="${list3}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 15px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                    <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
</section>
	</c:otherwise>
</c:choose>
</body>
</html>