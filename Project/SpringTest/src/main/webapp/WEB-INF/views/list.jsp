<%@page import="com.zerock.test.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<% 
	List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
	if (products != null && !products.isEmpty()) {
		for (ProductDTO product : products) {
	%>
		<div class="row" style="margin: 0 auto; padding-bottom: 20px;">
		<div class="col product_container">
			<a class="product_link" href="/product?p_idx=<%=product.getIdx() %>" style="text-decoration: none; width: 300px; height: 300px;">
			<input type="hidden" name="p_idx" id="idxInput" value="<%=product.getIdx() %>">
				<img class="product_img" src="<%=product.getProducts_img1()%>">
				<div class="product-info">
				<div class="product-title">
					<%=product.getProducts_name() %>
				</div>
				<div class="price-location">
				<div class="product-price">
					<%=product.getProducts_price() %>원
				</div>
				</div>
				<div class="product-location">
					<span><%=product.getProducts_location() %></span>
				</div>
			</div>
			</a>	
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			
				
				$('.product_link').on('click', function(){
					var idx = $(this).find('#idxInput').val();
					console.log(idx);
					
					
						 $.ajax({
					            url: '/product-add',
					            method: 'GET',
					            data: {
					                idx: idx,
					            },
					            success: function (response) {
					               
					            },
					            error: function () {
					                alert('데이터를 가져오는 데 실패했습니다.');
					            }
					        });
					
				});
				
			
			
		});
		</script>
	</div>
	<%} 
	}%>
