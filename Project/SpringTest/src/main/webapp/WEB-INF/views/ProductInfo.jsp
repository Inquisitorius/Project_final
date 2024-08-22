<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
</head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
                <div class="col" style="padding-bottom: 50px; display: flex;justify-content: flex-end">
                    <form id="chatForm" action="chat/rooms" method="get">
                    <input type="hidden">
                        <button id="chatWithSellerButton" data-seller-id="${Product.products_seller}"
                         class="btn btn-success" style="width: 300px; height: 50px; font-size: 20px; font-weight: bold;">
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
                <div class="col-md-4 fontCommon_nomal" style="font-size: 20px;">
                   ${Product.products_details}
                </div>
            </div>
            <hr style="height: 1px; border: none; background-color: gray;">
            <div class="row">
                <div class="col-md-3 fontgray">거래희망지역</div>
                <div class="col-md-4 fontCommon_nomal">${Product.products_location}</div>
            </div>
            <div class="row">
                <div class="col-md-3 fontgray">카테고리</div>
                <div class="col-md-4 fontCommon_nomal">${Product.products_category}</div>
            </div>
            </div>
            
            <div class="col-5">
            <div class="row">
            <div class="col-md-4 fontCommon_nomal">판매자 shop</div>
            shop
            </div>
            </div>
            
            </div>
        </c:forEach>
</div>
	

	<jsp:include page="../Common/footer.jsp"></jsp:include>
	
<script>
	
document.querySelector("#chatWithSellerButton").addEventListener("click", function() {

    let Product_seller = this.getAttribute("Product.products_seller");
    let room_name = this.getAttribute("Product.products_seller");
    let product_idx = this.getAttribute("Product.idx");
    let sender = this.getAttribute("Product.")
    
    console.log("Product_seller :" + Product_seller);
    console.log("room_name :" + room_name);
    console.log("product_idx :" + product_idx);
    console.log("sender :" + sender);

    axios.post('/chat/room1', {
        userId: loggedInUserId, // 로그인한 사용자의 ID
        sellerId: sellerId
        // 판매자의 ID
    })
    .then(function(response) {
        let chatRoomId = response.data.roomId;
         // 채팅방으로 이동
    })
    .catch(function(error) {
        console.error("Error creating chat room", error);
    });
});

</script>
</body>
</html>