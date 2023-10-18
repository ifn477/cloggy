<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<form action="product-save" method="post" enctype="multipart/form-data" name="productform">
<table align="center" border="1">
<caption>신상품등록</caption>
<tr> <th>카테고리</th> 
	<td>
		<select name="category1_id" id="category1">
		    <option value="">카테고리 선택</option>
			<option value="1">사료		
			<option value="2">간식		
			<option value="3">용품		
		</select>
		<select name="category2_id" id="category2">
		    <option value="">카테고리 선택</option>
		</select>
	</td>
</tr>
<tr> <th>상품번호</th> <td><input type="text" name="product_id" value="${input_product_id }" readonly></td> </tr>
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
<tr> <td colspan="2"><input type="button" value="추천상품 넣기" onclick="recommendpopup()"></a></td> </tr>
<tr> <td colspan="2"><input type="button" value="등록" onclick="productcheck()"></td> </tr>
</table>
</form>
<script type="text/javascript">

//추천상품
function recommendpopup() {
	var productID = "${input_product_id}"; // product_id 가져옴
	var url = "/dog/product-recommendlist?product_id=" + productID;
	window.open(url, "추천상품팝업창", "width=700,height=1000");
}

// 카테고리
const category1Select = document.getElementById('category1');
const category2Select = document.getElementById('category2');

// category1_id 값이 변경될 때 이벤트 리스너 추가
category1Select.addEventListener('change', function() {
    // 선택한 category1_id 값 가져옴
    const selectedCategory1 = category1Select.value;

    // category2_id select 요소를 초기화 (이전 옵션 제거)
    category2Select.innerHTML = '';

    // 기본 옵션 추가
    const defaultOption = document.createElement('option');
    defaultOption.value = ''; // 선택 안 함
    defaultOption.text = '카테고리 선택';
    category2Select.appendChild(defaultOption);

    // category1_id 값에 따라 옵션을 추가
    if (selectedCategory1 === '1') { 
        const options = [
            { value: '11', text: '퍼피(1세미만)-건식사료' },
            { value: '12', text: '퍼피(1세미만)-습식사료' },
            { value: '13', text: '퍼피(1세미만)-자연식' },
            { value: '14', text: '어덜트(1-7세)-건식사료' },
            { value: '15', text: '어덜트(1-7세)-습식사료 ' },
            { value: '16', text: '어덜트(1-7세)-자연식' },
            { value: '17', text: '시니어(7세이상)-건식사료' },
            { value: '18', text: '시니어(7세이상)-습식사료' },
            { value: '19', text: '시니어(7세이상)-자연식' },
        ];

        // 옵션 추가
        options.forEach(option => {
            const optionElement = document.createElement('option');
            optionElement.value = option.value;
            optionElement.text = option.text;
            category2Select.appendChild(optionElement);
        });
    } else if (selectedCategory1 === '2') { 
        const options = [
            { value: '21', text: '수제간식' },
            { value: '22', text: '빵/케이크' },
            { value: '23', text: '덴탈껌' },
            { value: '24', text: '뼈간식' },
            { value: '25', text: '껌' },
        ];

        options.forEach(option => {
            const optionElement = document.createElement('option');
            optionElement.value = option.value;
            optionElement.text = option.text;
            category2Select.appendChild(optionElement);
        });
        
    } else if (selectedCategory1 === '3') { // 2일때
        const options = [
            { value: '31', text: '위생용품' },
            { value: '32', text: '칫솔/치약' },
            { value: '33', text: '미용/관리' },
            { value: '34', text: '목욕용품' },
            { value: '35', text: '장난감' }
        ];

        options.forEach(option => {
            const optionElement = document.createElement('option');
            optionElement.value = option.value;
            optionElement.text = option.text;
            category2Select.appendChild(optionElement);
        });
    }
    
    // 다른 category1_id 값에 대한 필터링 로직 추가
});

</script>
<script type="text/javascript" src="/dog/js/check.js"></script>
</body>
</html>
