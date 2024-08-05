
	$(document).ready(function(){
		$('#id').on('input', function(){
			var input = $(this).val();
			var regex = /^(?=.*[a-zA-Z])(?=.*\d|^[a-zA-Z]+$)[a-zA-Z\d]{6,16}$/;
			
			if(!regex.test(input)){
				$('#error-id').css("display","block");
			}else{
				$('#error-id').css("display","none");
			}
		});
		
		$('#pwd').on('input', function(){
			var input = $(this).val();
			var regex = /^(?=.*[a-zA-Z])(?=.*\d|.*[!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-])(?=.*[a-zA-Z\d!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-]).{10,}$/;
	        
	        if(input.length < 10 && !regex.test(input)){
	        	$('#error-pwd').css("display", "block");
	        }else if(input.length >= 10 && !regex.test(input)){
	        	$('#error-pwd').css("display", "block");
	        	$('#msg1').text("영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합");
	        }else {
	        	$('#error-pwd').css("display", "none");
	        }
		});
		
		$('#rpwd').on('input', function(){
			var pwd = $('#pwd').val();
			var rpwd = $(this).val();
			
			if(rpwd.length === 0){
				$('#msg2').text("비밀번호를 한번 더 입력해주세요.");
				$('#error-rpwd').css("display", "block");
			}else if(pwd !== rpwd){
				$('#error-rpwd').css("display", "block");
				$('#msg2').text("동일한 비밀번호를 입력하세요");
			}else if(rpwd == pwd){
				$('#error-rpwd').css("display", "none");
			}
		});
		
		$('#name').on('input', function(){
			var name = $(this).val();
			
			if(name.length === 0){
				$('#error-name').css("display", "block");
			}else{
				$('#error-name').css("display", "none");
			}
		});
		
		$('#mail').on('input', function(){
			var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			var input = $(this).val();
			
			if(input.length === 0){
				$('#error-mail').css("display", "block");
				$('#msg4').text("이메일을 입력해주세요.");
			}else if(!regex.test(input)){
				$('#error-mail').css("display", "block");
				$('#msg4').text("올바른 이메일 형식을 입력해주세요.");
			}else {
				$('#error-mail').css("display", "none");
			}
		});
		
		$('#number').on('input', function(){
			var input = $(this).val();
			
			if(input.length === 0){
				$('#msg5').text("휴대폰 번호를 입력해주세요.");
				$('#error-number').css("display", "block");
			}else {
				$('#error-number').css("display", "none");
			}
		});
		
		function openAddressSearch() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var extraRoadAddr = ''; // 참고 항목 변수

		            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            // 건물명이 있고, 공동주택일 경우 추가한다.
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		            if(extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            $('#roadAddress').val(roadAddr + extraRoadAddr);

		            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		            if(roadAddr !== ''){
		                $('#Addressbtn-container').css("display", "none");
		                $('#result-container').css("display", "block");
		                $('#btn-container').css("display", "block");
		            } else {
		                $('#sample4_extraAddress').val('');
		            }
		        }
		    }).open();
		}
		
		$('#address-btn').on('click', openAddressSearch);
		$('#research-btn').on('click', openAddressSearch);
		
		$('#agreeAll').on('change', function(){
			var isCheckd = $(this).is(':checked');
			
			$('.terms-list .custom-checkbox').prop('checked', isCheckd);
		});
		
	});
