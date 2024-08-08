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
		<form method="POST" class="login-form" action="#">
			 <div class="form-floating">
            <input type="text" class="form-control" id="username" name="username" placeholder="아이디 입력...">
            <label for="id">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password" style="margin-top: 15px;" placeholder="Password">
            <label for="pwd">비밀번호</label>
         </div>
         <div class="search-id">
         	<a class="id-link" href="#" style="text-decoration: none; color:black;">아이디 찾기</a>
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
		var id = $('#username');
		var pwd = $('#password');
		
		$('.login-btn').on('click', function(){
			event.preventDefault();
			if (id.val().trim() === '' || pwd.val().trim() === ''){
				Swal.fire({
					  icon: "error",
					  html: '<span style="font-family: Gothic A1, sans-serif; font-size: 20px; font-weight: 700;">아이디와 비밀번호를 확인해주세요</span>'
					 					});
			}else {
		        $(this).closest('form').submit(); 
		    }
		});

		$('.join-btn').on('click', function(){
			window.location.href = '/join';
		});
		
		$('.id-link').on('click', function(event) {
            event.preventDefault(); // 기본 링크 동작 방지

            Swal.fire({
                title: '아이디 찾기',
                html: `
                    <label for="email">이메일:</label>
                    <input type="email" id="email" class="swal2-input" placeholder="이메일 입력...">
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone" class="swal2-input" placeholder="전화번호 입력..." oninput="this.value=this.value.replace(/[^0-9]/g,'');" maxlength=11>
                `,
                preConfirm: () => {
                    const email = Swal.getPopup().querySelector('#email').value;
                    const phone = Swal.getPopup().querySelector('#phone').value;
                    
                    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!email || !emailPattern.test(email)) {
                        Swal.showValidationMessage(`유효한 이메일 주소를 입력해주세요.`);
                        return false;
                    }
                    
                    if(!phone || phone.length < 11){
                    	 Swal.showValidationMessage(`유효한 전화번호를 입력해주세요.`);
                    	 return false
                    }
                    
                    if (!email || !phone) {
                        Swal.showValidationMessage(`모든 필드를 입력해야 합니다.`);
                    }
                    return { email: email, phone: phone }
                },
                showCancelButton: true,
                confirmButtonText: '제출'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                    	title : '아이디 찾기 결과',
                    	text : 'id : dsadsad',
                    	icon : 'info'
                    });
                }
            });
        });
		
        });
		
	

</script>
</body>
</html>