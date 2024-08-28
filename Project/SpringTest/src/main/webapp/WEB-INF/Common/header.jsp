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
	<div class="container" style = "padding: 0px; padding-top: 12px; padding-bottom: 12px;">
		<div class="row menu-containner" style = "min-width: 1320px; display: inline-flex; justify-content: space-between;">
			<div class = "col-4" style = "display: inline-flex; justify-content: space-between; align-items: center; padding: 0px;">
				<a style="padding: 0px; align-content: center;" href="/hello">
					<img src = "/img/logo_sample.svg" style = "width : 100px; height: 40px; margin-top: 5px;">
				</a>	
				<nav class="menu-nav">
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
			</div>
			
	<% 		
    	String userid = (String) request.getAttribute("userid");
        String username = (String) request.getAttribute("username");
        Boolean isAdmin = (Boolean) request.getAttribute("isAdmin");
        if (username != null) {
    %>	
    <div class="col-5 login" style="max-height: 48px; padding: 10px 20px 0;">
    <div style="display: flex; align-items: center; justify-content: flex-end;">
        <span class="ddd" style = "margin-right: 10px;"> <%= username %> 님</span>
        <% if (Boolean.TRUE.equals(isAdmin)) { %>
        <button class = "btn btn-danger" id="admin-btn" style = "margin-right: 10px;">관리자 페이지</button>
        <% } %>
        <button class = "btn btn-secondary" id="mypage-btn">마이페이지</button>
        <form id="logoutForm" action="/logout" method="post" style="margin-left: 10px;">
            <button class = "btn btn-secondary" type="submit">
                로그아웃
            </button>
        </form>
    </div>
    </div>    
    <% } else { %>
    <div class="col-4 login" style="max-height: 48px;">
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