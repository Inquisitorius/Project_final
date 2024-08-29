<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String shopOwner = (String) request.getAttribute("shopOwner");
String userid = (String) request.getAttribute("userid");
String type = (String) request.getAttribute("type");
Integer shopNum = (Integer) request.getAttribute("shopId");
String currentUri = request.getRequestURI();
Integer cnt = (Integer) request.getAttribute("cnt");
String sortType = (String) request.getAttribute("sort");
Integer size = (Integer) request.getAttribute("size");
Double shopRating = (Double) request.getAttribute("rating");
if(shopRating == null){
	shopRating = 0.0;
}
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/js/shop.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap">
<link href="/css/shop.css" rel="stylesheet" type="text/css">
<link href="/css/shop_products.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
		<jsp:include page="../Common/header.jsp"></jsp:include>

		<div class="container Mypage-container">
			<div class="Mypage-banner do-hyeon-regular"></div>
			<div class="container user-info">
				<div class="user-profile">
					<div class="left-profile">
						<div class="left-content">
							<div class="back-container">
								<div class="background-img">
									<div class="background-content">
										<div class="shop-panel">
											<input type="file" id="file-input" style="display: none;">
											<img src="${shopImg} " class="shop-img" id="img-trigger"
												alt="내 상점 관리 이미지" width="100" height="100">
										</div>
										<div class="shop-name">${shopName}</div>
										<%
										// 별점 이미지를 저장할 StringBuilder
										StringBuilder starsHtml = new StringBuilder();

										for (int i = 0; i < 5; i++) {
											if (shopRating >= 1.0) {
												// 별점이 1.0 이상인 경우 채워진 별 이미지 추가
												starsHtml.append("<img src='/img/2scorestar.png' width='15' height='14' alt='Filled Star'>");
												shopRating -= 1.0; // 1.0 점 차감
											} else if (shopRating >= 0.5) {
												// 별점이 0.5 이상인 경우 반 별 이미지 추가
												starsHtml.append("<img src='/img/1scorestar.png' width='15' height='14' alt='Half Star'>");
												shopRating -= 0.5; // 0.5 점 차감
											} else {
												// 별점이 0.5 미만인 경우 빈 별 이미지 추가
												starsHtml.append("<img src='/img/emptystar.png' width='15' height='14' alt='Empty Star'>");
											}
										}
										%>
										<div class="star">
											<%=starsHtml.toString()%>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="right-profile">
						<div class="name-container">
							<div class="name" id="name">${shopName}</div>
							<div class="button-container" id="button-container"
								style="padding-left: 15px;">
								<%
								if (shopOwner.equals(userid)) {
								%>
								<button class="name-update" id="name-update">상점명 수정</button>
								<%
								}
								%>
							</div>
							<div hidden="update-shopname" class="update-shopname"
								id="update-shopname">
								<input type="text" class="input-shopname" id="input-shopname"
									name="input-shopname" value="${shopName }">
								<button class="shopname-submit" id="shopname-submit">확인</button>
							</div>

						</div>
						<div class="edit-info">
							<%
							if (shopOwner.equals(userid)) {
							%>
							<button class="edit-btn" id="edit-btn">내 정보 수정</button>
							<%
							}
							%>
						</div>
						<div class="shop-info" id="shop-info">${shopInfo}</div>
						<div hidden="text-container" class="text-container"
							id="text-container">
							<div>
								<textarea id="text-info">${shopInfo}</textarea>
							</div>
							<button type="button" id="input-btn">확인</button>
						</div>
						<div class="infobtn-container" id="infobtn-container">
							<%
							if (shopOwner.equals(userid)) {
							%>
							<button class="info-btn" id="info-btn">소개글 수정</button>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>

			<div class="container shop-container"
				style="margin-top: 30px; padding: 0px;">
				<div>
					<div class="shop-menu" style="display: flex; height: 50px;">
						<a class="shopmenu-link" href="/shop/<%=shopNum%>/products"
							data-sort="products">상품</a> <a class="shopmenu-link"
							href="/shop/<%=shopNum%>/reviews" data-sort="reviews">상점후기</a> 
					</div>
				</div>
				<div id="shopContent">
					<%
					if (type.equals("products")) {
					%>
					<jsp:include page="../views/shop_products.jsp"></jsp:include>
					<%
					} else if (type.equals("reviews")) {
					%>
					<jsp:include page="../views/shop_reviews.jsp"></jsp:include>
					<%
					} %>
				</div>


			</div>
		</div>



		<jsp:include page="../Common/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		var cnt = '<%=cnt%>';
		var userid = '<%=userid%>';
		var shopNum = '<%=shopNum%>';
		var type = $(this).data('type');
		var sortType = '<%=sortType%>';
		var userid = '<%=userid%>';
		var shopOwner = "<%=shopOwner%>";

		 
		
        var $fileInput = $('#file-input');
        var $imgTrigger = $('#img-trigger');

        if (userid === shopOwner) {
            // 클릭할 수 있는 상태로 변경
            $imgTrigger.css('cursor', 'pointer');
            
        } else {
            // 클릭할 수 없는 상태로 변경
            $imgTrigger.addClass('disabled');
            $imgTrigger.css('cursor', 'default');
            $imgTrigger.off('click'); 
        }
		
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
					$('#name').text(newShopName);
					$('.shop-name').text(newShopName);
				},
				error: function(xhr, status, error){
					alert('update failed : ' + error);
				}
			});
		});
		
		$("#input-btn").on('click', function () {
			var newInfo = $('#text-info').val();
			
			$.ajax({
				url: '/update-info',
				method: 'POST',
				data : {
					shop_id : shopNum,
					shop_info : newInfo
				},
				success: function (response) {
					$('#shop-info').removeAttr("hidden");
					$('#infobtn-container').removeAttr("hidden");
					$('#text-container').attr("hidden", true);
					$('#shop-info').text(newInfo);
				},
				error: function(xhr, status, error){
					console.log(shopNum);
					console.log(newInfo);
					alert('update failed : ' + error);
				}
			});
		});
		
		$('#edit-btn').on('click', function () {
			window.location.href = '/useredit';
		});
		
		// 파일 업로드 처리
	      $('#file-input').on('change', function() {
	          var fileInput = $(this)[0];
	          var file = fileInput.files[0];
	          if (file) {
	              var formData = new FormData();
	              formData.append('shop_id', shopNum);
	              formData.append('file', file);

	              $.ajax({
	                  url: '/file-spring',
	                  type: 'POST',
	                  data: formData,
	                  contentType: false,
	                  processData: false,
	                  success: function(response) {
	                	  
	                  },
	                  error: function(xhr, status, error) {
	                      alert('File upload failed: ' + error);
	                  }
	              });
	          }
	      });
		

	      function setActiveTab() {
	          var currentPath = window.location.pathname;
	          $(".shopmenu-link").each(function() {
	              var linkHref = $(this).attr("href");
	              if (linkHref === currentPath) {
	                  $(this).addClass("focus");
	              } else {
	                  $(this).removeClass("focus");
	              }
	          });
	      }
	      
	     
	      function loadContent(url) {
	    	  var data = {};
	    	  if (url === '/shop/' + shopNum + '/reviews') {
	              data = { status: 'all', size: 5 };  
	          }
	          $.ajax({
	              url: url,
	              method: "GET",
	              data:data,
	              success: function(response) {
	            	  console.log("초기화" + status);
	            	  console.log(url);
	            	  setActiveTab(); 
	            	  
	              },
	              error: function() {
	                  $("#shopContent").html('<p>데이터를 불러오는 데 실패했습니다.</p>');
	              }
	          });
	      }

	      
	     
	      
	      
	     
	      $(".shopmenu-link").on('click', function(event) {
	          
	          var targetUrl = $(this).attr("href");
	          if (targetUrl) {
	        	  
	              loadContent(targetUrl);
	              setActiveTab();
	          }
	      });

	      var initialUrl = window.location.pathname;
	      loadContent(initialUrl);
		  

	     
	      
	      window.onpopstate = function(event) {
	          if (event.state && event.state.url) {
	              loadContent(event.state.url); 
	              setActiveTab(); 
	          }
	      };
	      

	  	});
	
	
	

</script>
</body>
</html>