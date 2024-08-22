<%@page import="com.zerock.test.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/shop_products.css" rel="stylesheet" type="text/css">	
<body>
<div class="products-banner">
	<div style="display: flex;">상품
	<span class="products-cnt">${cnt }</span>
	</div>
	<div class="select-boxcontainer" style="width: 150px;">
	<select class="form-select" aria-label="Default select example">
  <option selected>전체</option>
</select>
	</div>
</div>
<%	
	Integer size = (Integer) request.getAttribute("size");
	String CurrentSort = (String) request.getAttribute("sort");
	Integer shopNum = (Integer) request.getAttribute("shopId");
	Integer cnt = (Integer) request.getAttribute("cnt");
	
	if(cnt == 0 || cnt == null){
%>
<div class="noneproducts-container">등록된 상품이 없습니다.</div>
<%} else {%>
	<div class="product-container">
		<div class="product-sort-container" style="margin-bottom: 25px;">
		<div class="product-all">
			<div>전체</div>
			<div class="cnt">${cnt }개</div>
		</div>
		<div class="product-sort-link-container">
			<a class="sort-link" data-sort = "price-asc">저가순</a>
			<a class="sort-link" data-sort = "price-desc">고가순</a>
			<a class="sort-link" data-sort = "newest">최신순</a>
			<a class="sort-link" data-sort = "popularity">인기순</a>
		</div>
	</div>
		<div class="products-list">
		<% List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
		   if(products != null && !products.isEmpty()){
			   for(ProductDTO product : products){
		%>
			<div class="products-content">
				<a href="www.naver.com" style="text-decoration: none;">
				<img class="product_img" src="https://m.bunjang.co.kr/products/280245231?ref=%ED%99%88" style="width: 194px; height: 194px;">
				<div class="product-info">
				<div class="product-title">
					<%= product.getProducts_name() %>
				</div>
				<div class="price-location">
				<div class="product-price">
					<%= product.getProducts_price() %>원
				</div>
				<div class="product-location">
					<span><%= product.getProducts_location() %></span>
				</div>
				</div>
			</div>
			</a>	
			</div>
		<% }
		}%>
		</div>
		
	</div>
<%} %>
<script type="text/javascript">
	$('document').ready(function () {
		var size = parseInt('<%= request.getAttribute("size") %>');
		var cnt = '<%=cnt%>';
		 var shopNum = <%= shopNum %>; 
		 var sortType = $(this).data('sort');
		
		$('.sort-link').on('click', function () {
			event.preventDefault();
            var sortType = $(this).data('sort');
            size = '30';
			console.log('sort : ' + sortType);
			
			   $.ajax({
	                url: '/shop/' + shopNum + '/products',  
	                method: 'GET',
	                data: { sort: sortType,
	                	},
	                success: function (response) {
	                	$('#shopContent').html(response);
	                	setActiveTab(sortType);
	                },
	                error: function () {
	                    alert('정렬 데이터를 가져오는 데 실패했습니다.');
	                }
	            });
        });
		
		
		

		
		 
		
		
		
		function setActiveTab(sortType) {
		    $(".sort-link").each(function() {
		        var linkSort = $(this).data("sort");
		        if (linkSort === sortType) {
		            $(this).addClass("focus");
		        } else {
		            $(this).removeClass("focus");
		        }
		    });
		}
		
		
		

		

		
	});
</script>
</body>