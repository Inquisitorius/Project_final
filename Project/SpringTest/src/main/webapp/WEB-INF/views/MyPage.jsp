<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String username = (String) request.getAttribute("username");
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
			마이페이지
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
								<div class="shop-name">상점11111호</div>
								<div class="star">
									<img src="/img/2scorestar.png" class="star-img">
									<img src="/img/2scorestar.png" class="star-img">
									<img src="/img/2scorestar.png" class="star-img">
									<img src="/img/2scorestar.png" class="star-img">
									<img src="/img/2scorestar.png" class="star-img">
								</div>
								<div class="shop-control">
									<a class="shop-link" href="#">내 상점 관리</a>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
				<div class="wqeqew">
				2
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../Common/footer.jsp"></jsp:include>

</body>
</html>