<%@page import="com.zerock.test.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String username = (String) request.getAttribute("username");
List<ProductDTO> recentlyViewed = (List<ProductDTO>) session.getAttribute("paged");
List<ProductDTO> recentcnt = (List<ProductDTO>) session.getAttribute("recentlyViewed");
Integer cnt = (Integer) request.getAttribute("cnt");
Integer currentPage = (Integer) session.getAttribute("currentPage");
Integer totalPages = (Integer) session.getAttribute("totalPages");
currentPage = 1;

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

	<div class="sc-box">
		<div class="recently-viewed">
			최근본상품
		</div>
		
		<div class="recently-count">
		<%if(recentcnt != null){ %>
			<%=recentcnt.size() %>
			<%} else{%>
			0
			<%} %>
		</div>
		<div class="recently-itemcontainer">
		<% 
	
        if (recentlyViewed != null && !recentlyViewed.isEmpty()) {
            for (ProductDTO recentProduct : recentlyViewed) {
        %>
            <div class="recently-item">
                <a class="recently-link" href="/product?p_idx=<%=recentProduct.getIdx() %>">
                    <img class="recently-img" src="<%=recentProduct.getProducts_img1() %>">
                </a>
            </div>
        <% 
            } 
        } else { 
        %>
            <div class="none-product">최근 본 상품이<br>&nbsp;&nbsp;&nbsp;&nbsp;없습니다.</div>
        <% 
        } 
        %>
		</div>
 

	</div>
	<div class="sc-box">
		<button class="top-btn" id="top-btn">TOP</button>
	</div>
	<!-- 페이징 네비게이션 -->
    <div class="pagination">
        <% if (totalPages != null && totalPages > 1) { %>
            <% for (int i = 1; i <= totalPages; i++) { %>
                <% if (i == currentPage) { %>
                   <a class="page-link" data-page="<%= i %>"><%= i %></a>
                <% } else { %>
                    <a class="page-link" data-page="<%= i %>"><%= i %></a>
                <% } %>
            <% } %>
        <% } %>
    </div>
	</div>
	<div class="container">

		<div class="row" style="margin-top: 50px;">
			<h2 style="padding: 0;font-size: 25px;font-family: sans-serif;">상품 목록 </h2>
		</div>
	</div>
	
            
            <div class="row">
                <div class="col-3" style="padding-bottom: 50px; display: flex;justify-content: flex-end">
                    <form id="productForm" action="product" method="get">
                    <input type="hidden" name="p_idx" id="idxInput">
                        <button type="submit" class="btn btn-success" style="width: 300px; height: 50px; font-size: 20px; font-weight: bold;">
                            판매자와 채팅하기
                        </button>
                    </form>
                </div>
            </div>
	
<div class="container list-container" style="padding: 0px; margin: 0 auto;">
	
</div>
<jsp:include page="../Common/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		var size = 40;
		var cnt = '<%=cnt%>';
		var totalPages = '<%=totalPages%>';
		console.log("total : " + totalPages);
		$('#top-btn').click(function(){
			$('html, body').scrollTop(0);
		});
		
		function getProducts(){
			 $.ajax({
		            url: '/getProducts',
		            method: 'GET',
		            data: {
		                size: size,
		            },
		            success: function (response) {
		               $('.list-container').html(response);
		               console.log(cnt);
		            },
		            error: function () {
		                alert('데이터를 가져오는 데 실패했습니다.');
		            }
		        });
		}
		getProducts();
		 // 스크롤 이벤트 핸들러 등록
        $(window).on("scroll", function(){
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();
            var isBottom = scrollTop + windowHeight + 10 >= documentHeight;

            if (isBottom && size <= cnt ) {
            	console.log(size);
                size += 8;
                setTimeout(() => getProducts(), 300); // 0.3초 딜레이 후 데이터 요청
            }
        });
		 
 
        
        $(document).on('click', '.page-link', function(event) {
           

            var page = $(this).data('page'); // 페이지 번호 추출
            console.log("Page: " + page); // 페이지 번호 콘솔에 출력
            $.ajax({
	            url: '/paging',
	            method: 'GET',
	            data: {
	                page : page
	            },
	            success: function (response) {
	            	$('.recently-itemcontainer').load(location.href+' .recently-itemcontainer');
	            },
	            error: function () {
	                alert('데이터를 가져오는 데 실패했습니다.');
	            }
	        });
           
        });
        
		
	});
	


    var p_idx = 63; 
    document.getElementById('idxInput').value = p_idx;

</script>
</body>
</html>
