<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<link href="/css/join.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/join.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>
	<jsp:include page="../Common/header.jsp"></jsp:include>
	<div class="container join-container">
		<div class="join-banner do-hyeon-regular">정보수정</div>
		<div class="css-headline"></div>
		<form method="POST" id="editForm" class="form-container"
			style="display: contents;">	
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>아이디</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="text" class="text-input id" name="id" id="id"
						 maxlength="16" readonly="readonly" value="${user.id}">
					<div class="text-muted" id="error-id" style="display: none;">
						<p class="error-msg">6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</p>
					</div>
				</div>
				
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>비밀번호</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="password" class="text-input pwd" name="pwd" id="pwd"
						placeholder="비밀번호를 입력해주세요" maxlength="16">
					<div class="text-muted" id="error-pwd" style="display: none;">
						<p class="error-msg" id="msg1">최소 10자 이상 입력</p>
					</div>
				</div>
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>비밀번호 확인</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="password" class="text-input rpwd" name="rpwd"
						id="rpwd" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="16">
					<div class="text-muted" id="error-rpwd" style="display: none;">
						<p class="error-msg" id="msg2"></p>
					</div>
				</div>
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>이름</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="text" class="text-input name" name="name" id="name"
						placeholder="이름을 입력해주세요" maxlength="20" value="${user.name}">
					<div class="text-muted" id="error-name" style="display: none;">
						<p class="error-msg" id="msg3">이름을 입력해주세요.</p>
					</div>
				</div>
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>이메일</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="text" value="${user.email}" class="text-input mail" name="email" id="email"
						readonly="readonly" >
					<div class="text-muted" id="error-mail" style="display: none;">
						<p class="error-msg" id="msg4"></p>
					</div>
				</div>
				
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>휴대폰</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="text"
						oninput="this.value = this.value.replace(/[^0-9]/g, '')"
						class="text-input number" name="phone" id="phone"
						placeholder="숫자만 입력해주세요." maxlength="11" value="${user.phone}">
					<div class="text-muted" id="error-number" style="display: none;">
						<p class="error-msg" id="msg5"></p>
					</div>
				</div>
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>주소</label>
				</div>
				
				<div class="result-container" id="result-container"
					style="width: 300px;">
					<div class="col input-container" id="result-container">
						<input type="text" class="text-input" name="roadAddress"
							id="roadAddress" readonly="readonly" value="${user.street_address }">
					</div>
					<div class="col input-container" id="detailAddress-container">
						<input type="text" class="text-input" name="detailAddress"
							id="detailAddress" placeholder="상세주소를 입력해주세요." value="${user.detail_address }">
					</div>
					<div class="col input-container" id="expJibunAddr-container" style="display: none;">
						<input type="text" class="text-input" name="expJibunAddr"
							id="expJibunAddr" placeholder="상세주소를 입력해주세요." value="${user.expJibunAddr} ">
					</div>
					
				</div>
				<div class="col-md-3 btn-container" id="btn-container" >
					<button type="button" class="input-btn" id="research-btn">
						<span>재검색</span>
					</button>

				</div>
			</div>
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>성별</label>
					
				</div>
				<div class="col-md-6 input-container" style="display:flex; justify-content: flex-start;">
					<div class="form-check">
					
						<input class="form-check-input" type="radio"
							name="gender" id="MALE" value="MALE"
							<c:if test="${user.gender == 'MALE'}">checked</c:if>> <label
							class="form-check-label gender-label" for="flexRadioDefault1"> 남자</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="gender" id="FEMALE" value="FEMALE"
							<c:if test="${user.gender == 'FEMALE'}">checked</c:if>> <label
							class="form-check-label gender-label" for="flexRadioDefault2"> 여자 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="gender" id="NONE" value="NONE"
							<c:if test="${user.gender == 'NONE'}">checked</c:if>> <label
							class="form-check-label gender-label" for="flexRadioDefault2"> 선택안함 </label>
					</div>
				</div>
			</div>
			
				<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>생년월일</label>
				</div>
				<div class="col-md-6 input-container">
					<div class="birth-container">
						<div  height="48">
							<input class="textinput" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" name="year" id="year" placeholder="YYYY" maxlength="4">
						</div>
						<span class="slash" style="height: 100%"></span>
						<div  height="48">
							<input class="textinput" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" name="month" id="month" placeholder="MM" maxlength="2">
						</div>
						<span class="slash" style="height: 100%"></span>
						<div  height="48">
							<input class="textinput" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" name="day" id="day" placeholder="DD" maxlength="2">
						</div>
					</div>
				</div>
			</div>
			
			<div class=submit-container>
				<button type="button" id ="edit-btn" class="submit-btn"><span class="submit-span">수정하기</span></button>
			</div>
			
			<div class=back-container>
				<button type="button" id ="back-btn" class="back-btn"><span class="submit-span">취소</span></button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../Common/footer.jsp"></jsp:include>
	<script type="text/javascript">
	$(document).ready(function() {
		var userbirth = '${user.birthDate}';
		var userpwd = '${user.pwd}';
		function initializeDateFields(birthDate){
			if(birthDate){
				var parts = birthDate.split('-');
				var year = parts[0] || '';
				var month = parts[1] || '';
                var day = parts[2] || '';
                $('#year').val(year);
                $('#month').val(month);
                $('#day').val(day);
			}
		}
		initializeDateFields(userbirth);
		
		$('#back-btn').click(function(){
			  window.history.back();
		});
		
		$('#edit-btn').click(function(event) {
			event.preventDefault();

			
			var pwd = $('#pwd').val();
			var rpwd = $('#rpwd').val();
			var name = $('#name').val();
			var number = $('#phone').val();
			var roadAddress = $('#roadAddress').val();
			var detailAddress = $('#detailAddress').val();
			var gender = $('input[name="gender"]:checked').val();
			var year = $('#year').val();
			var month = $('#month').val();
			var day = $('#day').val();

			

		
			var pwdregex = /^(?=.*[a-zA-Z])(?=.*\d|.*[!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-])(?=.*[a-zA-Z\d!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-]).{10,}$/;
			var nameregex = /^[가-힣a-zA-Z]+$/;
			
		

			if (!pwdregex.test(pwd) || pwd !== rpwd) {
				Swal.fire({
					icon: 'error',
					title: '비밀번호 확인',
					text: '비밀번호를 확인해주세요.',
				});
				return false;
			}

			if (name.trim() === '' && !nameregex.test(name)) {
				Swal.fire({
					icon: 'error',
					title: '이름 확인',
					text: '이름을 확인해주세요.',
				});
				return false;
			}


			if (number.trim() === '' || number.length < 11) {
				Swal.fire({
					icon: 'error',
					title: '전화번호 확인',
					text: '전화번호를 확인해주세요.',
				});
				return false;
			}

			if (roadAddress.trim() === '' && detailAddress.trim() === '') {
				Swal.fire({
					icon: 'error',
					title: '주소 확인',
					text: '주소를 확인해주세요.',
				});
				return false;
			}

			if (!gender) {
				Swal.fire({
					icon: 'error',
					title: '성별 확인',
					text: '성별을 선택해주세요.',
				});
				return false;
			}

			if (year.trim() === '' && month.trim() === '' && day.trim() === '') {
				Swal.fire({
					icon: 'error',
					title: '생년월일 확인',
					text: '생년월일을 확인해주세요.',
				});
				return false;
			}
			if (year <= 1920 || year > 2024) {
				Swal.fire({
					icon: 'error',
					title: '연도 확인',
					text: '연도는 1920부터 2024까지 입력 가능합니다.',
				});
				return false;
			}
			// 월 검증: 01부터 12까지
			if (!/^0[1-9]|1[0-2]$/.test(month)) {
				Swal.fire({
					icon: 'error',
					title: '월 확인',
					text: '월은 01부터 12까지 두 자리 숫자로 입력해야 합니다.',
				});
				return false;
			}
			// 일 검증: 01부터 31까지
			if (!/^0[1-9]|[12][0-9]|3[01]$/.test(day)) {
				Swal.fire({
					icon: 'error',
					title: '일 확인',
					text: '일은 01부터 31까지 두 자리 숫자로 입력해야 합니다.',
				});
				return false;
			}

			



			// 모든 유효성 검사를 통과한 경우, 확인 모달을 표시합니다.
			Swal.fire({
				title: '정보 수정',
				text: '입력하신 정보로 수정하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					// 사용자가 '확인'을 클릭하면 폼을 제출합니다.
					$('#editForm')[0].submit();
				}
			});
		});
		
		});
	
	
	</script>
</body>
</html>