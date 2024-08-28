<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%
        String username = (String) request.getAttribute("username");
		String userid = (String) request.getAttribute("userid");
%>

<meta charset="UTF-8">
<title>상품</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9f17632ae11c7da9b9b41cf75cdc6604&libraries=services"></script>
<body>
	<style type="text/css">
	
.fontgray {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	color: gray;
	margin-bottom: 10px
}

.fontCommon_Option {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	color: #333333;
	margin-bottom: 10px
}

.fontCommon_nomal {
	font-family: "Noto Sans KR", serif;
	font-optical-sizing: auto;
	font-style: normal;
	color: #333333;
	margin-bottom: 10px
}

hr {
	border: 1px solid gray;
}
img {
  width: 400px;
  height: 400px;
  object-fit: cover;
}
</style>

	<jsp:include page="../Common/header.jsp"></jsp:include>
	
	
	<div class="container" style="max-width: 1050px; min-wiodt:1050px; padding-left: 0px; padding-top: 20px;">
    <div class="row d-flex flex-nowrap" style="margin-bottom: 30px;">
    <!--이미지 슬라이드-->
        <div class="col-5" style="margin-right:30px"><c:forEach var="Product" items="${product}">
            <div id="imageCarousel" class="carousel slide" data-ride="carousel";>
                <div class="carousel-inner">
                    <div class="carousel-item active" style="transition: none;">
                        <img src="${Product.products_img1}" class="d-block w-100" style="border-radius: 2%; overflow: hidden;">
                    </div>
                    <div class="carousel-item" style="transition: none;">
                        <img src="${Product.products_img2}" class="d-block w-100" style="border-radius: 2%; overflow: hidden;">
                    </div>
                    <div class="carousel-item" style="transition: none;">
                        <img src="${Product.products_img3}" class="d-block w-100" style="border-radius: 2%; overflow: hidden;">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-7">
            <div class="row">
                <div class="col-md-12 fontCommon_Option" style="display: flex; font-size: 24px; font-weight: 600; color: #333; justify-content: flex-start; margin-bottom: 40px;">
               
				${Product.products_name} 
                </div>
            </div>
            <div class="row" style="display: flex;">
                <div class="col-md-12 fontCommon_nomal" style="display: flex; font-size: 22px; font-weight: 600; margin-bottom: 30px;">
                   ${Product.products_price}<strong>&nbsp원</strong>
                </div>
            </div>
            <hr style="height: 1px; border: none; background-color: gray;">
            <div class="row" style="margin-bottom: 15px;">
                <div class="col-md-4 fontCommon_nomal" style="font-size: 20px;">
                    ${Product.products_seller} 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 fontgray">상품상태</div>
                <div class="col-md-4 fontCommon_nomal">상태</div>
            </div>
            <div class="row">
                <div class="col-md-3 fontgray">상품크기</div>
                <div class="col-md-4 fontCommon_nomal">사이즈</div>
            </div>
            <div class="row" style="margin-bottom:24px;">
                <div class="col-md-3 fontgray">거래방법</div>
                <div class="col-md-4 fontCommon_nomal">거래</div>
            </div>
           
           <div class="row">
    <div class="col" style="padding-bottom: 50px; display: flex; justify-content: flex-end">
        <form id="chatForm" action="/chat/room1" method="post">
            <!-- Hidden input fields to store data -->
            <input type="hidden" name="room_name" value="${Product.products_seller}">
            <input type="hidden" name="product_idx" value="${Product.idx}">
            <input type="hidden" name="sender" value="<%= userid %>">
            <input type="hidden" name="product_seller" value="${Product.products_seller}">
            <button id="chatWithSellerButton" class="btn btn-success" 
                    style="width: 300px; height: 50px; font-size: 20px; font-weight: bold;">
                판매자와 채팅하기
            </button>
        </form>
    </div>
</div>

        </div>
    </div>
    
    <hr style="height: 1px; border: none; background-color: black;">
    
    <div class="row d-flex flex-nowrap" style="display: flex;">
    <div class="col-7">
                <div class="col-md-12 fontCommon_nomal" style="display: flex; font-size: 22px; font-weight: 600; margin-bottom: 30px;">
                    상품설명	
                </div>
            <div class="row" style="margin-bottom: 15px;">
                <div class="col-md-12 fontCommon_nomal" style="font-size: 20px;">${Product.products_details}</div>
            </div>
            <hr style="height: 1px; border: none; background-color: gray;">
            <div class="row">
                <div class="col-md-3 fontgray">카테고리</div>
                <div class="col-md-4 fontCommon_nomal">${Product.products_category}</div>
            </div>
            <div class="row"  style="margin-bottom:20px";>
                <div class="col-md-3 fontgray">거래희망지역</div>
                <div class="col-md-7 fontCommon_nomal">${Product.products_location}</div>
            </div>
            
         <div id="map" style="width:500px;height:400px;"></div>
 


		</div>
          
            
            
            <div class="col-5">
            <div class="row">
            <div class="col-md-4 fontCommon_nomal">상점정보</div>
            shop
            </div>
            </div>
            </div>
            
            </div>
        	


	

	<jsp:include page="../Common/footer.jsp"></jsp:include>
	
<script>

var productLocation = "<c:out value='${Product.products_location}'/>";

function initMap() {
    var geocoder = new kakao.maps.services.Geocoder();

    // 지역명을 바탕으로 좌표를 검색
    geocoder.addressSearch(productLocation, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 지도를 생성하고 중심 좌표를 설정
            var map = new kakao.maps.Map(document.getElementById('map'), {
                center: coords,
                level: 3
            });

            // 마커를 생성하고 지도에 표시
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
        } else {
            console.error("Geocode was not successful for the following reason: " + status);
        }
    });
}

// 페이지 로드 시 지도 초기화	
window.onload = initMap;
</c:forEach>

</script>

</body>
</html>