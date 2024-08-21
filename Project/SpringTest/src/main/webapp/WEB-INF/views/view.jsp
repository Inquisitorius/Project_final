<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String username = (String) request.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.carousel-inner img {
    width: 100%;
    height: auto; 
  }
</style>
</head>
<body>
<link href="/css/main.css" rel="stylesheet" type="text/css">
<link href="/css/stickySidebar.css" rel="stylesheet" type="text/css">		
<jsp:include page="../Common/header.jsp"></jsp:include>


<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="
    position: relative;
    padding-top: 20px;
    margin: 0 auto;
    max-width: 1320px;
">

	
  <div class="carousel-inner" style="max-height: 80%">
    <div class="carousel-item active" data-bs-interval="5000">
      <img src="/img/1236022401_w1197.webp" class="d-block w-100" alt="">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
      <img src="/img/1211616841_w1197.webp" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
      <img src="/img/1238906716_w1197.webp" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div class="sticky-sidebar" >
	<div class="sc-box" style="border-color: rgb(102,102,102);">
		<div class="Saved-item" style="text-align: center;">
			찜한 상품
		</div>
		<div class="saved-link" style="text-align: center;">
		<%if(username != null){ %>
			<a href="">찜한상품</a>
			<%} else { %>
			<a href="/login">찜한상품</a>
			<%} %>
		</div>
	</div>
	<div class="sc-box">
		<div class="recently-viewed">
			최근본상품
		</div>
		<div class="recently-count">
			23
		</div>
		<div class="recently-itemcontainer">
		<%for(int i = 0; i < 3; i ++){ %>
			<div class="recently-item">
				<a class="recently-link" href="">
					<img class="recently-img" src="/img/2.jpg">
				</a>
			</div>
		<%} %>
		</div>
	</div>
	<div class="sc-box">
		<button class="top-btn" id="top-btn">TOP</button>
	</div>
	</div>
	<div class="container">

		<div class="row" style="margin-top: 50px;">
			<h2 style="padding: 0;font-size: 25px;font-family: sans-serif;">상품 목록</h2>
		</div>
	</div>
	
            
            <div class="row">
                <div class="col-3" style="padding-bottom: 50px; display: flex;justify-content: flex-end">
                    <form id="productForm" action="product" method="get">
                    <input type="hidden" name="idx" id="idxInput">
                    
                        <button type="submit" class="btn btn-success" style="width: 300px; height: 50px; font-size: 20px; font-weight: bold;">
                            판매자와 채팅하기
                        </button>
                    </form>
                </div>
            </div>
	
<div class="container list-container" style="padding: 0px; margin: 0 auto;">
	<% for (int i = 0; i < 60; i ++){ %>
	
		<div class="row" style="margin: 0 auto;">
		<div class="col product_container">
			<a href="www.naver.com" style="text-decoration: none;">
				<img class="product_img" src="https://m.bunjang.co.kr/products/280245231?ref=%ED%99%88">
				<div class="product-info">
				<div class="product-title">
					상품
				</div>
				<div class="price-location">
				<div class="product-price">
					100000원
				</div>
				<div class="product-location">
					<span>경기도 의정부시 의정부동</span>
				</div>
				</div>
			</div>
			</a>	
		</div>
	</div>
	<%} %>
</div>
<jsp:include page="../Common/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		$('#top-btn').click(function(){
			$('html, body').scrollTop(0);
		});
	});
	


    var idx = 4	; 
    document.getElementById('idxInput').value = idx;

</script>
</body>
</html>
