<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/shop_products.css" rel="stylesheet" type="text/css">	
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
	Integer cnt = (Integer) request.getAttribute("cnt");
	if(cnt == 0 || cnt == null){
%>
<div class="noneproducts-container">등록된 상품이 없습니다.</div>
<%} else {%>
	<div class="product-container">
		<div class="product-sort-container">
		<div class="product-all">
			<div>전체</div>
			<div class="cnt">${cnt }개</div>
		</div>
		<div class="product-sort-link-container">
			<a class="sort-link">최신순</a>
			<a class="sort-link">인기순</a>
			<a class="sort-link">저가순</a>
			<a class="sort-link">고가순</a>
		</div>
	</div>
	</div>
<%} %>
