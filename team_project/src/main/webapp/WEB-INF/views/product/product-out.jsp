<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.product_item{
	min-height: 200px;
    flex-basis: 150px;
    flex-grow:0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
<div class="container_box">
  <c:forEach items="${list}" var="pout">
	<div class="product_item">
      	<div class="product_thumbnail">
          <a href="product-detail?product_id=${pout.product_id }">
          <img alt="상품썸네일" src="/dog/image/${pout.p_thumbnail}" width="300px;" height="350px;">
          </a>
      	</div>
      	<div class="product_name">
          <a href="product-detail?product_id=${pout.product_id }" style="font-size: 20px; text-decoration: none;">
          ${pout.p_name}
          </a>
        </div>
      	<div class="product_price">
          ${pout.p_price}
        </div>
       </div>
  </c:forEach>
</div>
</section>
</body>
</html>