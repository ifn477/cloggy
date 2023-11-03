<%@page import="com.ezen.dog.likecheck.LikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>	
<style>
* {
    font-family: 'Noto Sans KR', sans-serif;
}

.content {
    max-width: 70%;
    margin: 0 auto;
    margin-top: 50px;
    margin-bottom: 15rem;
}

.container_box {
    display: block;
    clear: both;
    width: 100%;
    margin-left: 80px;
}
.product_item {
    display: block;
    float: left;
    width: calc(33.33% - 20px);
    margin-right: 10px;
    margin-bottom: 15px;
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 0px; 
}

.product_thumbnail {
    position: relative;
}

.image-container {
    max-width: 300px;
    max-height: 350px;
    overflow: hidden;
    text-align: center;
}

.image-container img {
    width: auto;
    height: auto;
    max-width: 100%;
    max-height: 100%;
}
.product_name_price {
    font-size: 13px;
    text-decoration: none;
    margin-top: 5px;
    padding: 30px;
    width: 220px;
}
.product_price{
	margin-top: 5px;
}
p {
    caption-side: top;
    font-size: 17px;
    font-weight: 500;
    top: 0;
    margin-bottom: 40px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="content">
    <div class="container_box">
            <p>찜목록</p>
        <c:if test="${not empty list}">
            <c:forEach items="${list}" var="pout" varStatus="loop">
                <div class="product_item">
                    <div class="product_thumbnail">
                        <a href="product-detail?product_id=${pout.product_id}&userId=${member.userId}">
                            <img alt="상품썸네일" src="${pout.p_thumbnail}" width="80px;" height="90px;">
                        </a>
                    </div>
                    <div class="product_name_price">
                        <a href="product-detail?product_id=${pout.product_id }">
                            <strong>${pout.p_name}</strong>
                        </a><br>
                    <div class="product_price">
                            <fmt:formatNumber value="${pout.p_price}" pattern="#,##0"/>원
                    </div>
                    </div>
                </div>
                <c:if test="${loop.index % 3 == 2}">
                    <div style="clear: both;"></div>
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <p style="text-align: center; margin-top: 7rem; margin-bottom: 25rem; color: gray;">찜한 상품이 없습니다.</p>
        </c:if>
    </div>
</section>

</body>
</html>