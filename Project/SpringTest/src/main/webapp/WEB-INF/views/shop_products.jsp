<%@page import="com.zerock.test.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/shop_products.css" rel="stylesheet" type="text/css">
<body>
	<div class="products-banner">
		<div style="display: flex;">
			상품 <span class="products-cnt">${cnt }</span>
		</div>
		<div class="select-boxcontainer" style="width: 150px;">
			<select class="form-select" aria-label="Default select example">
				<option selected data-status="all">전체</option>
				<option data-status="for-sale">판매중</option>
				<option data-status="in-progress">거래중</option>
				<option data-status="completed">거래완료</option>
			</select>
		</div>
	</div>
	<%
	String CurrentSort = (String) request.getAttribute("sort");
	Integer shopNum = (Integer) request.getAttribute("shopId");
	Integer cnt = (Integer) request.getAttribute("cnt");
	String sortType = (String) request.getAttribute("sort");
	String status = (String) request.getAttribute("status");

	if (cnt == 0 || cnt == null) {
	%>
	<div class="noneproducts-container">등록된 상품이 없습니다.</div>
	<%
	} else {
	%>
	<div class="product-container">
		<div class="product-sort-container" style="margin-bottom: 25px;">
			<div class="product-all">
				<div>전체</div>
				<div class="cnt">${cnt }개</div>
			</div>
			<div class="product-sort-link-container">
				<a class="sort-link" data-sort="price-asc">저가순</a> <a
					class="sort-link" data-sort="price-desc">고가순</a> <a
					class="sort-link" data-sort="newest">최신순</a> <a class="sort-link"
					data-sort="popularity">인기순</a>
			</div>
		</div>
		<div class="products-list">
			<%
			List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
			if (products != null && !products.isEmpty()) {
				for (ProductDTO product : products) {
			%>
			<div class="products-content">
				<a href="www.naver.com" style="text-decoration: none;"> <img
					class="product_img"
					src="https://m.bunjang.co.kr/products/280245231?ref=%ED%99%88"
					style="width: 194px; height: 194px;">
					<div class="product-info">
						<div class="product-title">
							<%=product.getProducts_name()%>
						</div>
						<div class="price-location">
							<div class="product-price">
								<%=product.getProducts_price()%>원
							</div>
							<div class="product-location">
								<span><%=product.getProducts_location()%></span>
							</div>
						</div>
					</div>
				</a>
			</div>
			<%
			}
			}
			%>
		</div>

	</div>
	<%
	}
	%>
<script type="text/javascript">
$(document).ready(function () {
    var size = 30;
    var cnt = '<%=cnt%>'; // 서버에서 전달된 총 항목 수
    var shopNum = <%=shopNum%>; // 서버에서 전달된 상점 번호
    var sortType = '<%=sortType%>'; // 서버에서 전달된 정렬 타입

    // 정렬 링크 클릭 시 처리
    $('.sort-link').on('click', function () {
    	event.preventDefault();
        size = 30; // 페이지 크기 초기화
        var status = $(this).data('status'); // 상태 가져오기
        sortType = $(this).data('sort'); // 정렬 타입 가져오기

        getsortList(sortType, size, status);
		
        // 이전 스크롤 이벤트 핸들러 제거
        $(window).off("scroll");
        
        // 스크롤 이벤트 핸들러 등록
        $(window).on("scroll", function(){
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();
            var isBottom = scrollTop + windowHeight + 10 >= documentHeight;

            if (isBottom && size <= cnt && sortType) {
                size += 10;
                setTimeout(() => getsortList(), 300); // 0.3초 딜레이 후 데이터 요청
            }
        });
    });

    // 정렬 리스트를 가져오는 함수
    function getsortList() {
        $.ajax({
            url: '/shop/' + shopNum + '/products',
            method: 'GET',
            data: {
                sort: sortType,
                size: size,
                status: status
            },
            success: function (response) {
                $('#shopContent').html(response);
                console.log(status);
                setActiveselect(status, sortType);
            },
            error: function () {
                alert('데이터를 가져오는 데 실패했습니다.');
            }
        });
    }
    
   

    


    // 활성화된 탭을 설정하는 함수
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

    $('.form-select').on('change', function () {
        // 선택된 필터 값 가져오기
        sortType = $(this).data('sort'); // 정렬 타입 가져오기
        status = $(this).find('option:selected').data('status'); // 상태 가져오기

        console.log('정렬 타입 : ' + sortType);
        console.log('상태 : ' + status);

        size = 30; // 페이지 크기 초기화
        getsortList(sortType, size, status); // 데이터 요청
        
      

        // 새로운 스크롤 이벤트 핸들러 등록
        $(window).on("scroll", function() {
            var scrollTop = $(window).scrollTop();
            var windowHeight = $(window).height();
            var documentHeight = $(document).height();
            var isBottom = scrollTop + windowHeight + 10 >= documentHeight;

            console.log('Scroll Top:', scrollTop);
            console.log('Window Height:', windowHeight);
            console.log('Document Height:', documentHeight);
            console.log('Is Bottom:', isBottom);

            if (isBottom && size <= cnt && status) {
                size += 10;
                setTimeout(() => getsortList(sortType, size, status), 300); // 0.3초 딜레이 후 데이터 요청
            }
        });
    });
	
    
    
    
    function setActiveselect(status, sortType) {
        $(".form-select").each(function() {
        	event.preventDefault();
            $(this).find('option').each(function() {
                var optionStatus = $(this).data("status"); // 현재 옵션의 상태 가져오기

                // 상태가 일치하면 해당 옵션을 선택
                if (optionStatus === status) {
                    $(this).prop('selected', true); // 해당 옵션 선택
                } else {
                    $(this).prop('selected', false); // 다른 옵션은 선택 해제
                }
            });

            // 선택된 상태가 있는 경우 select 요소를 갱신
            $(this).val($(this).find('option:selected').val());
        });
        
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