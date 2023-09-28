<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
function readImageURL(input, imageID) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById(imageID).src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById(imageID).src = "";
  }
}

function readThumbnailURL(input, thumbnailID) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById(thumbnailID).src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById(thumbnailID).src = "";
  }
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:forEach items="${list}" var="pmodi">
<form action="product-modifyView?product_id=${pmodi.product_id }" method="post" enctype="multipart/form-data">
<table border="1" align="center" >
<caption>상품수정</caption>
<tr> <th>카테고리</th> 
	<td>
		<select name="category_id">
			<option value="1001">사료		
			<option value="1002">간식		
			<option value="1003">용품		
		</select>
	</td>
</tr>
<tr> <th>상품명</th> <td><input type="text" name="p_name" value="${pmodi.p_name}"></td> </tr>
<tr> <th>상품가격</th> <td><input type="text" name="p_price" value="${pmodi.p_price}"></td> </tr>
<tr> <th>상품설명</th> <td><textarea rows="5px" cols="50%" name="p_info">${pmodi.p_info}</textarea></td> </tr>
<tr> <th>상품이미지</th> 
		<td align="center">
			<input type="file" multiple name="p_image" value="${pmodi.p_image}" onchange="readImageURL(this, 'previewImage');">
			<img id="previewImage" style="max-width: 200px; max-height: 200px;" />
		</td> 
</tr>
<tr> <th>상품썸네일</th> 
		<td align="center">
			<input type="file" name="p_thumbnail"  value="${pmodi.p_thumbnail}" onchange="readThumbnailURL(this, 'previewThumbnail');">
			<img id="previewThumbnail" style="max-width: 200px; max-height: 100px;"/>
		</td> 
</tr>
<tr> <th>재고수량</th> <td><input type="text" name="p_stock" value="${pmodi.p_stock}"></td> </tr>
<tr> <th>상품등록일</th> <td><input type="date" name="p_enroll" value="${pmodi.p_enroll}"></td> </tr>
<tr> <td colspan="2">
		<input type="submit" value="수정">
		<input type="button" value="삭제" onclick="location.href='product-delete?product_id=${pmodi.product_id }'"> 
	 </td>
</tr>
</table>
</form>
</c:forEach>
</body>

</html>