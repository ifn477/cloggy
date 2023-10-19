<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>  

<style type="text/css">
.content{
    max-width: 1300px;    
    margin: 0 auto;
    margin-top: 50px;
}
.container_box{
    display: flex;
    flex-wrap: wrap;
    gap: 50px 20px;
    padding-left:10px;
    padding-right:10px;
}
.product_item {
    min-height: 200px;
    flex-basis: 150px;
    flex-grow: 0;
    position: relative;
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
    margin-bottom: 10px;
    font-size: 15px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h2><strong>'${p_name}'</strong>에 대한 검색결과입니다.</h2>
<br>
<section class="content">
<div class="container_box">
    <c:choose>
        <c:when test="${not empty listall}">
            <p class="listcomment"> 전체 : 총 <strong>${fn:length(listall)}</strong> 건의 상품이 검색되었습니다. </p>
            <c:forEach items="${listall}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 20px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                        ${pout.p_price}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list1}">
       	<p class="listcomment"> 사료 : 총 <strong>${fn:length(list1)}</strong> 건의 상품이 검색되었습니다. </p>
            <c:forEach items="${list1}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 20px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                        ${pout.p_price}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list2}">
            <p class="listcomment"> 간식 : 총 <strong>${fn:length(list2)}</strong> 건의 상품이 검색되었습니다. </p>
            <c:forEach items="${list2}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 20px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                        ${pout.p_price}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
<div class="container_box">
    <c:choose>
        <c:when test="${not empty list3}">
            <p class="listcomment"> 용품 : 총 <strong>${fn:length(list3)}</strong> 건의 상품이 검색되었습니다. </p>
            <c:forEach items="${list3}" var="pout">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}">
                            <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="200px;" height="250px;">
                        </a>
                    </div>
                    <div class="product_name">
                        <a href="product-detail?product_id=${pout.product_id}" style="font-size: 20px; text-decoration: none;">
                            ${pout.p_name}
                        </a>
                    </div>
                    <div class="product_price">
                        ${pout.p_price}
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>
</div>
</section>
</body>
</html>