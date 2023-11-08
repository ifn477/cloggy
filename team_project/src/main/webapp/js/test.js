$(document)
.ready(
		function() {
			
			//초기 로딩 시 전체박스, 개별체크박스 선택
			$("input[name='chk-all']").prop('checked', true);
			$("input[name='check-one']").prop('checked', $("input[name='chk-all']").prop('checked'));
			
			//전체 선택 버튼 클릭 이벤트
			 $("#chk-all").click(function() {
		           $("input[name='check-one']").prop('checked', $(this).prop('checked'));
		           updateTotalPrice();
		     });
			
			// 체크박스가 변경될 때 totalprice 업데이트
			 $("input[name='check-one']").change(function() {
			      updateTotalPrice();
			 });
			 
			 $("#deletethis").click(function() {
				    var selectedProducts = [];
				    // 체크된 상품의 product_id를 수집
				    $("input[name='check-one']:checked").each(function() {
				        var product_id = $(this).closest("tr").find("input[name='product_id']").val();
				        selectedProducts.push(product_id);
				    });
					
					 console.log("Selected product_ids: " + selectedProducts);

				    // AJAX 요청으로 선택된 상품을 컨트롤러로 전송
				    
			$.ajax({
			    type: "POST",
			    url: "/dog/deletefromcart",
			    data: { productIds: selectedProducts },
			    success: function(response) {
			        if (response === "success") {
			            alert("상품이 삭제되었습니다.");
			        } else {
			            alert("알 수 없는 응답: " + response);
			        }
			    },
			});

			
			$(".increase, .decrease").click(
				function() {
						var index = $(this).data("id");
						var quantityElement = $("#quantity-"
								+ index);
						var quantity = parseInt(quantityElement
								.text(), 10);

						if ($(this).hasClass("increase")) {
							quantity++;
						} else if (quantity > 1) {
							quantity--;
						}

						quantityElement.text(quantity);

						// Recalculate subtotal, total price, and shipping
						updateSubtotal(index);
						updateTotalPrice();
						updateShipping();
			});

			// Function to update the subtotal for a specific item
			function updateSubtotal(index) {
				var quantityElement = $("#quantity-" + index);
				var quantityValue = parseInt(quantityElement
						.text(), 10);
				var priceValue = parseFloat($("#price-" + index)
						.text().replace(/[^0-9.-]+/g, ""));
				var subtotal = quantityValue * priceValue;
				$("#subtotal-" + index).text(
						formatNumberWithCommas(subtotal));
			}

			 function updateTotalPrice() {
		        var totalprice = 0;
		        $("input[name='check-one']:checked").each(function() {
		            var index = $(this).closest("tr").find(".decrease").data("id");
		            var subtotal = parseFloat($("#subtotal-" + index).text().replace(/[^0-9.-]+/g, ""));
		            totalprice += subtotal;
		        });
		
		        $(".totalprice").text(formatNumberWithCommas(totalprice)); // Update the total price element
		        updateShipping();
		    }

			// Function to update the shipping cost
			function updateShipping() {
			    var totalprice = parseFloat($(".totalprice")
			        .text().replace(/[^0-9.-]+/g, ""));
			    var shipping = totalprice < 30000 ? 2500 : 0;
			    var formattedShipping = formatNumberWithCommas(shipping);
			    $(".shipping").text(formattedShipping); // Update the shipping element

			    var finalprice = totalprice + shipping;
			    var formattedFinalPrice = formatNumberWithCommas(finalprice);
			    $(".finalprice").text(formattedFinalPrice); // Update the final price element

			    // Update the hidden input field for finalprice
			    $("#finalprice").val(finalprice);
			}


			function formatNumberWithCommas(number) {
				return number.toString().replace(
						/\B(?=(\d{3})+(?!\d))/g, ",")
						+ '원';
			}

			// Initial calculation of total price and shipping
			updateTotalPrice();
			updateShipping();
		});
});