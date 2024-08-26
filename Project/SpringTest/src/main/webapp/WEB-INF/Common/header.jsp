<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link href="/css/header.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
<Style type="text/css">

</Style>
<header>
	<div class="container header-container">
		<div class="row menu-containner">
			<a class="col-1 img-container" style="padding: 0px; align-content: center;" href="/hello">
				<span><svg width="65" height="36" viewBox="0 0 65 36" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_47_13130)"><path d="M9.23186 11.6511C4.1335 11.6511 0 15.6932 0 20.7962C0 27.847 9.25838 31.5884 9.23186 31.5783C9.20661 31.5884 18.4637 27.847 18.4637 20.7962C18.4637 15.6969 14.3302 11.6511 9.23186 11.6511ZM9.23186 24.4985C8.54053 24.498 7.86486 24.2924 7.2903 23.9079C6.71573 23.5233 6.26807 22.977 6.00391 22.338C5.73975 21.6991 5.67096 20.9961 5.80623 20.318C5.9415 19.6399 6.27476 19.0171 6.76388 18.5285C7.25299 18.0398 7.87599 17.7072 8.55411 17.5726C9.23223 17.438 9.93502 17.5076 10.5736 17.7725C11.2122 18.0374 11.7579 18.4857 12.1418 19.0608C12.5256 19.6359 12.7304 20.3119 12.7301 21.0034C12.731 21.4632 12.6411 21.9187 12.4656 22.3437C12.2901 22.7687 12.0325 23.1549 11.7075 23.4802C11.3825 23.8055 10.9966 24.0634 10.5718 24.2392C10.1469 24.415 9.69161 24.5053 9.23186 24.5048V24.4985Z" fill="#FF6F0F"></path><path d="M11.3103 0C9.15573 0 7.6554 1.50565 7.41923 3.28415C4.54738 2.4909 2.29688 4.67359 2.29688 7.07354C2.29688 8.9114 3.55978 10.3956 5.24324 10.8781C6.60087 11.2659 9.04586 10.9766 9.04586 10.9766C9.03323 10.383 9.58007 9.73118 10.4237 9.13751C12.8232 7.44996 14.6999 6.65419 14.9891 4.35276C15.2922 1.94523 13.5052 0 11.3103 0Z" fill="#00A05B"></path><path d="M36.7873 14.8305C34.8374 15.4431 31.4616 15.769 28.2905 15.769V11.9114H34.8399V9.03906H24.7783V18.8208C30.2808 18.8208 35.0849 18.1576 37.1132 17.5298L36.7873 14.8305Z" fill="#FF6F0F"></path><path d="M41.4104 7.89453H37.9033V19.1402H41.4104V15.6148H44.2393V12.5467H41.4104V7.89453Z" fill="#FF6F0F"></path><path d="M34.8969 19.1138C31.1814 19.1138 28.4561 21.1613 28.4561 24.1663C28.4561 27.1713 31.1839 29.2188 34.8969 29.2188C38.6098 29.2188 41.3377 27.17 41.3377 24.1663C41.3377 21.1626 38.6124 19.1138 34.8969 19.1138ZM34.8969 26.4058C33.2223 26.4058 31.9657 25.6025 31.9657 24.1613C31.9657 22.72 33.2223 21.9179 34.8969 21.9179C36.5715 21.9179 37.8281 22.7213 37.8281 24.1613C37.8281 25.6012 36.5728 26.4058 34.8969 26.4058Z" fill="#FF6F0F"></path><path d="M51.0698 20.6055H47.4844V28.2133H61.735V25.202H51.0698V20.6055Z" fill="#FF6F0F"></path><path d="M61.2902 8.83301H47.3224V11.8443H57.7692C57.7692 12.5921 57.8046 14.3706 57.4623 16.3916H44.6514V19.5065H64.1002V16.3966H60.6347C61.0995 13.8426 61.2321 11.8519 61.2902 8.83301Z" fill="#FF6F0F"></path></g><defs><clipPath id="clip0_47_13130"><rect width="64.1053" height="36" fill="white"></rect></clipPath></defs></svg></span>
			</a>
			<nav class="col-3 menu-nav">
				<ul class="menu-ul">
					<li class="menu-li">
						<a class="menu-link" href="www.naver.com">중고거래</a>
					</li>
				</ul>
				<ul class="menu-ul">
					<li class="menu-li">
						<a class="menu-link" href="myRoomsPage">채팅하기</a>
					</li>
				</ul>
			</nav>
			<div class="col container-fluid search-container">
        <nav class="navbar navbar-light bg-light search-nav">
            <form class="d-flex">
                <input class="form-control me-2" type="search" style="width: 380px; height: 40px;" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </nav>
    </div>
    	
    <% 
		
    	String userid = (String) request.getAttribute("userid");
        String username = (String) request.getAttribute("username");
        Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
        if (username != null) {
    %>
    <div class="col-3 login" style="max-height: 48px; padding: 10px 20px 0;">
    <div style="display: flex; align-items: center; justify-content: space-between;">
        <span class="ddd"> <%= username %> 님</span>
        <% if (Boolean.TRUE.equals(isAdmin)) { %>
        <button id="admin-btn">관리자 페이지</button>
        <% } %>
        <button id="mypage-btn">마이페이지</button>
        <form id="logoutForm" action="/logout" method="post" style="margin-left: 10px;">
            <button type="submit" style="background: none; border: none; padding: 0; text-decoration: underline; cursor: pointer;">
                로그아웃
            </button>
        </form>
    </div>
    </div>
    
    <% } else { %>
    <div class="col-2 login" style="max-height: 48px;">
    	<div class="login-span" style="display: flex;">
            <a href="/login" style="display: flex; align-items: center; text-decoration: none;">
                <img src="/img/login-btn.svg" style="width: auto; height: 50px;">
                <div class="login-span" style="display: flex; align-items: center;">
                    <span>로그인/회원가입</span>
                </div>
            </a>
        </div>
        </div>
        
    <% } %>
	</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		var id = '<%= userid != null ? userid : "" %>';
		
		
	function checkid()	{
		if (id !== null && id.trim() !== '') {
		$.ajax({
			url : '/reset-password',
			type: 'POST',
			data: {id: id},
			success: function(response){
				
				if(response === 1){
					 Swal.fire({
	        	            title: '비밀번호를 변경해주세요',
	        	            html: `<div class="container" style="padding-top:30px; font-size:18px;">
	    		    			<div class="row row-cols-1">
	    		    			<div class="col" style="margin-bottom:15px;">
	    		            <label for="password" style="font-weight:bold;">비밀번호 : </label>
	    		            <input type="password" id="password" style="margin:0 auto;" name="id" class="swal2-input" placeholder="비밀번호 입력..." maxlength=16>
	    	            		</div>
	    	            		
	    		            </div>
	    		            </div>
	    		        `,
	        	            icon: 'info',
	        	            preConfirm: () => {
	        		            var password = Swal.getPopup().querySelector('#password').value;
  								if (!isValiPassword(password)) {
                                Swal.showValidationMessage(`비밀번호는 최소 10자 이상이어야 하며, 영문자와 숫자를 포함하고, 특수문자가 두 개 이상이어야 합니다.`);
                                return false;
                            	}

                            return { password: password };
	        		        },
	        	        }).then((result) => {
	        	        	  if (result.isConfirmed) {
	        	        		  var password = result.value.password;
	        	        		  $.post('/changePwd', {id:id, pwd:password}, function(response) {
	        	        			  if(response.status === 'success'){
	        	        				  Swal.fire({
				        	                    title: '비밀번호 변경',
				        	                    text: '비밀번호가 성공적으로 변경되었습니다.           다시 로그인해주세요' ,
				        	                    icon: 'success'
				        	                }).then(() => {
				        	                	window.location.href='/logout';
				        	                });
	        	        			  }else {
	        	        			        Swal.fire({
	        	        			            title: '비밀번호 변경 실패',
	        	        			            text: '비밀번호 변경 실패',
	        	        			            icon: 'error'
	        	        			        });
	        	        			    }
								});
	        	        		  
	                          }
	        	        });
				}
			}
		});
		}
	}
	checkid();
		$("#admin-btn").on('click',function(){
			 window.location.href = '/admin';
		});
		
		$("#mypage-btn").on('click',function(){
			 window.location.href = '/shop';
		});
		
		function isValiPassword(password){
			if (password.length < 10) return false;

	        var hasLetter = /[a-zA-Z]/.test(password);
	        var hasNumber = /[0-9]/.test(password);
	        var specialCharacterCount = (password.match(/[!@#$%^&*(),.?":{}|<>]/g) || []).length;

	        return hasLetter && hasNumber && specialCharacterCount >= 2;
		}
	});
	
	
	
</script>
</header>