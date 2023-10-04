<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/dog/js/check.js"></script>
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
<form action="product-save" method="post" enctype="multipart/form-data" name="productform">
<table align="center" border="1">
<caption>신상품등록</caption>
<tr> <th>카테고리</th> 
	<td>
		<select name="category_id">
			<option value="1001">사료		
			<option value="1002">간식		
			<option value="1003">용품		
		</select>
	</td>
</tr>
<tr> <th>상품명</th> <td><input type="text" name="p_name"></td> </tr>
<tr> <th>상품가격</th> <td><input type="text" name="p_price"></td> </tr>
<tr> <th>상품설명</th> <td><textarea rows="5px" cols="50%" name="p_info"></textarea></td> </tr>
<tr> <th>상품이미지</th> 
		<td align="center">
			<input type="file" name="p_image" onchange="readImageURL(this, 'previewImage');">
			<img id="previewImage" style="max-width: 200px; max-height: 200px;" />
		</td> 
</tr>
<tr> <th>상품썸네일</th> 
		<td align="center">
			<input type="file" name="p_thumbnail" onchange="readThumbnailURL(this, 'previewThumbnail');">
			<img id="previewThumbnail" style="max-width: 200px; max-height: 100px;"/>
		</td> 
</tr>
<tr> <th>재고수량</th> <td><input type="text" name="p_stock"></td> </tr>
<tr> <td colspan="2"><input type="button" value="등록" onclick="productcheck()"></td> </tr>
</table>
</form>
</body>
</html>
