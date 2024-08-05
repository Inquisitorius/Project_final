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
		<form method="POST" action="/join" class="form-container"
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
							name="gender" id="MALE" value="MALE"> <label
							class="form-check-label gender-label" for="flexRadioDefault1"> 남자</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="gender" id="FEMALE" value="FEMALE"> <label
							class="form-check-label gender-label" for="flexRadioDefault2"> 여자 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="gender" id="NONE" value="NONE"> <label
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
			<div class="css-headline"></div>
			<div class="input">
			<div class="label-container gothic-a1-regular"
					style="font-weight: bold; font-size: 15px;">
					<label>이용약관 동의</label>
				</div>
				<div class="col-md-10 input-container" style="height: auto;">
					<div class="AgreeAll-container">
					<input id="agreeAll" type="checkbox" class="custom-checkbox">
					<label for="agreeAll" class="checkbox-label gothic-a1-regular" style="font-size: 20px; font-weight: bold;">전체 동의합니다.</label>
					<p class="terms-p"style="padding: 4px 0px 0px 30px; font-size: 12px;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
					</div>
					
					<div class="terms-list" style="padding: 8px 0px;">
					<input id="termsagree1" type="checkbox" class="custom-checkbox">
					<label for="termsagree1" class="checkbox-label" style="font-size: 14px; color: rgb(51,51,51);">이용약관 동의</label>
					<span class="terms-span"style="font-size: 11px; color:rgb(121,121,121);">(필수)</span>
					</div>
					
					<div class="terms-list" style="padding: 8px 0px;">
					<input id="termsagree2" type="checkbox" class="custom-checkbox">
					<label for="termsagree2" class="checkbox-label" style="font-size: 14px; color: rgb(51,51,51);">개인정보약관 동의</label>
					<span class="terms-span"style="font-size: 11px; color:rgb(121,121,121);">(필수)</span>
					</div>
					
					<div class="terms-list" style="padding: 8px 0px;">
					<input id="termsagree3" type="checkbox" class="custom-checkbox">
					<label for="termsagree3" class="checkbox-label" style="font-size: 14px; color: rgb(51,51,51);">본인은 만 14세 이상입니다.</label>
					<span class="terms-span"style="font-size: 11px; color:rgb(121,121,121);">(필수)</span>
					</div>
					
				</div>
		</div>
			<div class=submit-container>
				<button type="submit" class="submit-btn"><span class="submit-span">가입하기</span></button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../Common/footer.jsp"></jsp:include>

</body>
</html>