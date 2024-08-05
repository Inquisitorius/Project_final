<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="/css/main.css" rel="stylesheet" type="text/css">
<link href="/css/LoginPage.css" rel="stylesheet" type="text/css">		
<jsp:include page="../Common/header.jsp"></jsp:include>
<div class="container login-container">
	<div class="login-banner do-hyeon-regular">
		로그인
	</div>
	<div class="form-container">
		<form action="POST" class="login-form">
			 <div class="form-floating">
            <input type="text" class="form-control" id="id" placeholder="아이디 입력...">
            <label for="id">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="pwd" style="margin-top: 15px;" placeholder="Password">
            <label for="pwd">비밀번호</label>
         </div>
         <div class="search-id">
         	<a class="id-link" style="text-decoration: none; color:black;">아이디 찾기</a>
         	<span class="pipe"></span>
         	<a class="pw-link" style="text-decoration: none; color:black;">비밀번호 찾기</a>
         </div>
         <button type="submit" class="login-btn" style="width:-webkit-fill-available; margin-top: 20px;">로그인</button>
		</form>
		<button type="button" class="join-btn" style="width:-webkit-fill-available; margin-top: 5px;">회원가입</button>
	</div>
</div>

<jsp:include page="../Common/footer.jsp"></jsp:include>



<script type="text/javascript">
	$(document).ready(function(){
		var id = $('#id');
		var pwd = $('#pwd');
		
		$('.login-btn').on('click', function(){
			event.preventDefault();
			if (id.val().trim() === '' || pwd.val().trim() === ''){
				Swal.fire({
					  icon: "error",
					  html: '<span style="font-family: Gothic A1, sans-serif; font-size: 20px; font-weight: 700;">아이디와 비밀번호를 확인해주세요</span>'
					 					});
			}
		});

		$('.join-btn').on('click', function(){
			window.location.href = '/join';
		});
		
	});

</script>
</body>
</html>