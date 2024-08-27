/**
 * 
 */
$(document).ready(function() {
	var IDStatus = 0;
	var mailStatus = 0;
	$('#id').on('input', function() {
		var input = $(this).val();
		var regex = /^(?=.*[a-zA-Z])(?=.*\d|^[a-zA-Z]+$)[a-zA-Z\d]{6,16}$/;

		if (!regex.test(input)) {
			$('#error-id').css("display", "block");
		} else {
			$('#error-id').css("display", "none");
		}
	});

	$('#pwd').on('input', function() {
		var input = $(this).val();
		var regex = /^(?=.*[a-zA-Z])(?=.*\d|.*[!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-])(?=.*[a-zA-Z\d!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-]).{10,}$/;

		if (input.length < 10 && !regex.test(input)) {
			$('#error-pwd').css("display", "block");
		} else if (input.length >= 10 && !regex.test(input)) {
			$('#error-pwd').css("display", "block");
			$('#msg1').text("영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합");
		} else {
			$('#error-pwd').css("display", "none");
		}
	});

	$('#rpwd').on('input', function() {
		var pwd = $('#pwd').val();
		var rpwd = $(this).val();

		if (rpwd.length === 0) {
			$('#msg2').text("비밀번호를 한번 더 입력해주세요.");
			$('#error-rpwd').css("display", "block");
		} else if (pwd !== rpwd) {
			$('#error-rpwd').css("display", "block");
			$('#msg2').text("동일한 비밀번호를 입력하세요");
		} else if (rpwd == pwd) {
			$('#error-rpwd').css("display", "none");
		}
	});

	$('#name').on('input', function() {
		var name = $(this).val();

		if (name.length === 0) {
			$('#error-name').css("display", "block");
		} else {
			$('#error-name').css("display", "none");
		}
	});

	$('#mail').on('input', function() {
		var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		var input = $(this).val();

		if (input.length === 0) {
			$('#error-mail').css("display", "block");
			$('#msg4').text("이메일을 입력해주세요.");
		} else if (!regex.test(input)) {
			$('#error-mail').css("display", "block");
			$('#msg4').text("올바른 이메일 형식을 입력해주세요.");
		} else {
			$('#error-mail').css("display", "none");
		}
	});

	$('#number').on('input', function() {
		var input = $(this).val();

		if (input.length === 0) {
			$('#msg5').text("휴대폰 번호를 입력해주세요.");
			$('#error-number').css("display", "block");
		} else {
			$('#error-number').css("display", "none");
		}
	});

	function openAddressSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				var expJibunAddr = data.sido + ' ' + data.sigungu + ' ' + data.bname;

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}



				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$('#roadAddress').val(roadAddr + extraRoadAddr);
				$('#expJibunAddr').val(expJibunAddr);

				if (roadAddr.trim() !== '') {
					$('#result-container').css('display', 'block'); // 보이기
					$('#btn-container').css('display', 'block'); // 보이기
					$('#Addressbtn-container').css('display', 'none'); // 숨기기
				} else {
					$('#sample4_extraAddress').val(''); // 빈 문자열로 설정
					$('#result-container').css('display', 'none'); // 보이기
					$('#btn-container').css('display', 'none'); // 보이기
					$('#Addressbtn-container').css('display', 'block'); // 숨기기
				}
			}
		}).open();
	}

	$('#address-btn').on('click', openAddressSearch);
	$('#research-btn').on('click', openAddressSearch);

	$('#agreeAll').on('change', function() {
		var isCheckd = $(this).is(':checked');

		$('.terms-list .custom-checkbox').prop('checked', isCheckd);
	});

	$('#id-check-btn').on('click', function() {
		var id = $('#id').val().trim();

		if (id === "") {
			Swal.fire({
				icon: 'error',
				title: '아이디 입력 필요',
				text: '아이디를 입력해주세요.'
			});
			return
		}

		$.post('/idexits', { id: id }, function(response) {
			console.log("data : " + response);
			if (response == 1) {
				IDStatus = 0;
				Swal.fire({
					icon: 'error',
					title: '중복 확인',
					text: '이미 사용 중인 아이디입니다.',
				});
			} else {
				IDStatus = 1;
				Swal.fire({
					icon: 'success',
					title: '사용 가능',
					text: '사용 가능한 아이디입니다.',
				});

			}

		});
	});

	$('#mail-btn').on('click', function() {
		var email = $('#email').val();

		if (email === "") {
			Swal.fire({
				icon: 'error',
				title: '이메일 입력 필요',
				text: '이메일을 입력해주세요.'
			});
			return
		}

		$.post('/mailexits', { email: email }, function(response) {
			if (response == 1) {
				mailStatus = 0;
				Swal.fire({
					icon: 'error',
					title: '중복 확인',
					text: '이미 사용 중인 이메일입니다.',
				});
			} else {
				mailStatus = 1;
				Swal.fire({
					icon: 'success',
					title: '사용 가능',
					text: '사용 가능한 이메일입니다.',
				});

			}
		});

	});

	$('#id').on('input', function() {
		IDStatus == 0;
	});

	$('#submit-btn').click(function(event) {
		event.preventDefault();

		var id = $('#id').val();
		var pwd = $('#pwd').val();
		var rpwd = $('#rpwd').val();
		var name = $('#name').val();
		var mail = $('#email').val();
		var number = $('#phone').val();
		var roadAddress = $('#roadAddress').val();
		var detailAddress = $('#detailAddress').val();
		var gender = $('input[name="gender"]:checked').val();
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();

		var termsagree1Checked = $('#termsagree1').is(':checked');
		var termsagree2Checked = $('#termsagree2').is(':checked');
		var termsagree3Checked = $('#termsagree3').is(':checked');

		var idregex = /^(?=.*[a-zA-Z])(?=.*\d|^[a-zA-Z]+$)[a-zA-Z\d]{6,16}$/;
		var pwdregex = /^(?=.*[a-zA-Z])(?=.*\d|.*[!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-])(?=.*[a-zA-Z\d!@#$%^&*()_+{}\[\]:;"'<>,.?/\\|`~-]).{10,}$/;
		var nameregex = /^[가-힣a-zA-Z]+$/;
		var mailregex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if (!idregex.test(id)) {
			Swal.fire({
				icon: 'error',
				title: '아이디 확인',
				text: '아이디를 확인해주세요.',
			});
			return false;
		} else if (IDStatus == 0) {
			Swal.fire({
				icon: 'error',
				title: '아이디중복 확인',
				text: '아이디 중복을 확인해주세요.',
			});
			return false;
		}

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

		if (mail.trim() === '' && !mailregex.test(mail)) {
			Swal.fire({
				icon: 'error',
				title: '이메일 확인',
				text: '이메일 확인해주세요.',
			});
			return false;
		} else if (mailStatus === 0) {
			Swal.fire({
				icon: 'error',
				title: '이메일중복 확인',
				text: '이메일 중복을 확인해주세요.',
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

		if (!termsagree1Checked || !termsagree2Checked || !termsagree3Checked) {
			Swal.fire({
				icon: 'error',
				title: '이용약관 동의',
				text: '모든 필수 약관에 동의해 주세요.',
			});
			return false;
		}



		// 모든 유효성 검사를 통과한 경우, 확인 모달을 표시합니다.
		Swal.fire({
			title: '가입 확인',
			text: '입력하신 정보로 가입을 진행하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				// 사용자가 '확인'을 클릭하면 폼을 제출합니다.
				$('#joinForm')[0].submit();
			}
		});
	});


	function checkAgreeAll() {

		var termsagree1Checked = $('#termsagree1').is(':checked');
		var termsagree2Checked = $('#termsagree2').is(':checked');
		var termsagree3Checked = $('#termsagree3').is(':checked');


		if (termsagree1Checked && termsagree2Checked && termsagree3Checked) {
			$('#agreeAll').prop('checked', true);
		} else {
			$('#agreeAll').prop('checked', false);
		}
	}

	$('#termsagree1, #termsagree2, #termsagree3').change(checkAgreeAll);


	

	

});


