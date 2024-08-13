<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userid = (String) request.getAttribute("shopOwner");
Integer shopNum = (Integer) request.getAttribute("shopId");

%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/MyPage.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap">
<link href="/css/MyPage.css" rel="stylesheet" type="text/css">	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../Common/header.jsp"></jsp:include>
	<div class="container Mypage-container">
		<div class="Mypage-banner do-hyeon-regular">
			
		</div>
		<div class="container user-info">
			<div class="user-profile">
				<div class="left-profile">
					<div class="left-content">
						<div class="back-container">
						<div class="background-img">
							<div class="background-content">
								<div class="shop-panel">
    								<input type="file" id="file-input" style="display: none;">
    								<img src="/img/shopimg.svg" class="shop-img" id="img-trigger" alt="내 상점 관리 이미지">
								</div>
								<div class="shop-name">${shopName}</div>
								<div class="star">
								<% Double shopStar = (Double) request.getAttribute("shopStar");
									if(shopStar == 0){
								%>
									<img src="/img/emptystar.png" class="star-img">
									<img src="/img/emptystar.png" class="star-img">
									<img src="/img/emptystar.png" class="star-img">
									<img src="/img/emptystar.png" class="star-img">
									<img src="/img/emptystar.png" class="star-img">
									<%} %>
								</div>
								<div class="shop-control">
									<a class="shop-link" href="#">내 상점 관리</a>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="right-profile">
					<div class="name-container">
						<div class="name" id="name">${shopName}</div>
						<div class="button-container" id="button-container"  style="padding-left: 15px;">
						<button class="name-update" id="name-update">상점명 수정</button>
						</div>
						<div hidden="update-shopname" class="update-shopname" id="update-shopname">
							<input type="text" class="input-shopname" id="input-shopname" name="input-shopname" value="${shopName }">
							<button class="shopname-submit" id="shopname-submit">확인</button>
						</div>
						
					</div>
					<div class="edit-info">
							<button class="edit-btn">내 정보 수정</button>
						</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../Common/footer.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		var userid = '<%=userid%>';
		var shopNum = '<%=shopNum%>';
		
		console.log(userid);
		console.log(shopNum)
		
		$("#shopname-submit").on('click', function(){
			var newShopName = $("#input-shopname").val();
			
	        if (newShopName.length < 2 || newShopName.length > 10) {
	        	Swal.fire({
					icon: 'error',
					title: '상점명 확인',
					text: '상점명은 최소 2자, 최대 10자까지 입력 가능합니다.',
				});
	            
	            return;
	        }
	        
	        var namePattern = /^[a-zA-Z0-9가-힣]+$/;
	        if (!namePattern.test(newShopName)) {
	        	Swal.fire({
					icon: 'error',
					title: '상점명 확인',
					text: '상점명은 한글, 영문, 숫자만 포함할 수 있으며, 띄어쓰기를 사용할 수 없습니다.',
				});
	            return;
	        }
	        
			$.ajax({
				url: '/update-name',
				method: 'POST',
				data : {
					shop_name : newShopName,
					shop_id : shopNum,
					shop_owner : userid
				},
				success: function(response){
					$("#name").removeAttr("hidden");
					$("#button-container").removeAttr("hidden");
					$("#update-shopname").attr("hidden", true);
					window.location.reload();
				},
				error: function(xhr, status, error){
					alert('update failed : ' + error);
				}
			});
		});
	});

</script>
</body>
</html>