		$(document)
				.ready(
						function() {
							var quantity = 1; // 초기 수량은 1으로 설정

							function formatNumberWithCommas(number) {
								return number.toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ",")
										+ '원';
							}

							// total_price 업데이트 함수
							function updateTotalPrice() {
								var quantityValue = parseInt($("#quantity")
										.text(), 10);
								var priceValue = parseFloat($("#price").text()
										.replace(/[^0-9.-]+/g, ""));

								var totalPrice = quantityValue * priceValue;
								var formattedTotalPrice = formatNumberWithCommas(totalPrice);
								$("#totalPrice").text(formattedTotalPrice);
							}

							// + 버튼을 클릭할 때 수량을 증가시키는 이벤트 핸들러
							$("#increase").click(function() {
								quantity++;
								$("#quantity").text(quantity);
								updateTotalPrice();
							});

							// - 버튼을 클릭할 때 수량을 감소시키는 이벤트 핸들러
							$("#decrease").click(function() {
								if (quantity > 1) {
									quantity--;
									$("#quantity").text(quantity);
									updateTotalPrice();
								}
							});

							$("#addToCart").click(function() {
								var product_id = $("#product_id").val();
								console.log("product id: " + product_id);
								console.log("quantity: " + quantity);

								//ajax로 실어 보내기.
								// JSON으로 데이터 구성
								const data = {
									product_id : product_id,
									quantity : quantity
								// 동적으로 변경된 수량 사용
								};

								// 서버로 JSON 데이터 전송
								$.ajax({
									type : "POST", // 또는 "GET" - 요청 유형 선택
									url : "/dog/addtocart", // 컨트롤러의 URL에 대한 경로를 지정
									data : {
										product_id : product_id,
										quantity : quantity
									},
									success : function(response) {
										// 성공적으로 처리된 경우 실행되는 코드
										alert("장바구니에 상품이 저장되었습니다");
										// 여기에서 추가 작업을 수행할 수 있습니다.
									},
									error : function(xhr, status, error) {
										// 오류가 발생한 경우 실행되는 코드
										console.error("Ajax 요청 오류: " + error);
									}
								});
							});
						});