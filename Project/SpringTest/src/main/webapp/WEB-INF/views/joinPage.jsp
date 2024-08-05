<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/join.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/join.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/header.jsp"></jsp:include>
	<div class="container join-container">
		<div class="join-banner do-hyeon-regular">회원가입</div>
		<div class="css-headline"></div>
		<form method="POST" action="" class="form-container"
			style="display: contents;">
			<div class="input">
				<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>아이디</label>
				</div>
				<div class="col-md-6 input-container">
					<input type="text" class="text-input id" name="id" id="id"
						placeholder="아이디를 입력해주세요" maxlength="16">
					<div class="text-muted" id="error-id" style="display: none;">
						<p class="error-msg">6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</p>
					</div>
				</div>
				<div class="col-md-3 btn-container">
					<button class="input-btn" type="button">
						<span>중복확인</span>
					</button>
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
						placeholder="이름을 입력해주세요" maxlength="20">
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
					<input type="text" class="text-input mail" name="mail" id="mail"
						placeholder="예: example@naver.com">
					<div class="text-muted" id="error-mail" style="display: none;">
						<p class="error-msg" id="msg4"></p>
					</div>
				</div>
				<div class="col-md-3 btn-container">
					<button class="input-btn" type="button" id="mail-btn">
						<span>중복확인</span>
					</button>
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
						class="text-input number" name="number" id="number"
						placeholder="숫자만 입력해주세요." maxlength="11">
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
				<div class="col-md-6 input-container" id="Addressbtn-container">
					<div class="Addressbtn-container">
						<button type="button" class="input-btn" id="address-btn">
							<span>주소찾기</span>
						</button>
					</div>
				</div>
				<div class="result-container" id="result-container"
					style="width: 300px; display: none">
					<div class="col input-container" id="result-container">
						<input type="text" class="text-input" name="roadAddress"
							id="roadAddress" readonly="readonly">
					</div>
					<div class="col input-container" id="detailAddress-container">
						<input type="text" class="text-input" name="detailAddress"
							id="detailAddress" placeholder="상세주소를 입력해주세요.">
					</div>
				</div>
				<div class="col-md-3 btn-container" id="btn-container"
					style="display: none;">
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
							name="flexRadioDefault" id="flexRadioDefault1" value="MALE"> <label
							class="form-check-label gender-label" for="flexRadioDefault1"> 남자</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault2" value="FEMALE"> <label
							class="form-check-label gender-label" for="flexRadioDefault2"> 여자 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="flexRadioDefault" id="flexRadioDefault2" value="NONE"> <label
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
							<input class="textinput" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" name="year" id="year" placeholder="MM" maxlength="2">
						</div>
						<span class="slash" style="height: 100%"></span>
						<div  height="48">
							<input class="textinput" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" name="year" id="year" placeholder="DD" maxlength="2">
						</div>
					</div>
				</div>
			</div>
			<div class="css-headline"></div>
			<div class="input">
			<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>이용약관 동의</label>
				</div>
				<div class="col-md-3 input-container">
					<label class="css-allAgree">
						<input id="TermsAgreeAll" type="checkbox">
						<div class="css-79hxr7 e1dcessg1">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path><path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
							<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path>
							<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
							</svg>
						</div>
						<span>전체 동의합니다.</span>
					</label>
				</div>
		</div>
		</form>
	</div>
	
	<jsp:include page="../Common/footer.jsp"></jsp:include>

</body>
</html>