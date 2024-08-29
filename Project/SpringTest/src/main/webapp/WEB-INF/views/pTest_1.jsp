<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/join2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../Common/header.jsp"></jsp:include>
<main>
	<div class = "container" style = "padding-top: 20px;">
		<div class = "row">
			<div class = "col-12">
				<h1>상품 등록</h1>
			</div>
		</div>
		<div class="container">	
		
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>제품 이름 : </label>
				</div>
				<div class = "col-5">
					<input type = "text" class = "form-control" id = "product_name"  value = ""  style="max-width: 100%;"/>
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>제품 카테고리 : </label>
				</div>
				<div class = "col-5" style="display: inline-flex;">					
					<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					    대분류
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><label class="dropdown-item" id = "category_1" >의류</label></li>
					    <li><label class="dropdown-item" id = "category_2" >가전</label></li>
					    <li><label class="dropdown-item" id = "category_3" >시계</label></li>
					    <li><label class="dropdown-item" id = "category_4" >음반</label></li>
					   </ul>
					</div>
					<div class="dropdown" style = "margin-left: 10px;">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
					    소분류
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><label class="dropdown-item" id = "category_small_1" ></label></li>
					    <li><label class="dropdown-item" id = "category_small_2" ></label></li>
					    <li><label class="dropdown-item" id = "category_small_3" ></label></li>
					   </ul>
					</div>
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>제품 가격 : </label>
				</div>
				<div class = "col-5">
					<input type = "text" class = "form-control" id = "product_price" value = "${expJibunAddr}"  style="max-width: 100%;"/>
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>거래 희망 위치 : </label>
				</div>
				<div class = "col-5">
					<div class="col-md-6 input-container" id="Addressbtn-container" style="display: blcok;">
					<div class="Addressbtn-container">
						<button type="button" class="btn btn-primary" id="address-btn">
							<span>주소찾기</span>
						</button>
					</div>
				</div>
				<div class="result-container" id="result-container"
					style="width: 100%; display: none;">
					<div class="col input-container" id="result-container">
						<input type="text" class="form-control" name="roadAddress"
							id="roadAddress" readonly="readonly" style  = "width: 100%;">
					</div>
					<div class="col input-container" id="detailAddress-container">
						<input type="text" class="form-control" name="detailAddress"
							id="detailAddress" placeholder="상세주소를 입력해주세요." style  = "width: 100%; margin-top: 5px;">
					</div>
					<div class="col input-container" id="expJibunAddr-container" style="display: none; ">
						<input type="text" class="form-control" name="expJibunAddr"
							id="expJibunAddr" placeholder="상세주소를 입력해주세요." style  = "width: 100%; margin-top: 5px;">
					</div>
					
				</div>
				<div class="col-md-3 btn-container" id="btn-container" style="display: none; margin-top: 5px;">
					<button type="button" class="btn btn-primary" id="research-btn">
						<span>재검색</span>
					</button>

				</div>
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>제품 설명 : </label>
				</div>
				<div class = "col-5">
					<textarea class = "form-control" id = "product_detail" style="max-width: 100%; min-height: 300px; white-space: pre-wrap;"></textarea>
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 10px;">
				<div class = "col-2" ></div>
				<div class = "col-2" style = "display: inline-flex; align-items: center;">
					<label>제품 이미지 : </label>
				</div>
				<div class = "col-5">
					<label for="fileUpload">사진 선택:</label>
        		<input type="file" id="fileUpload" name="uploadedFiles" accept="image/*" multiple>        		
				</div>
			</div>
			
			<div class = "row" style = "margin-bottom: 30px;">
				<div class = "col-9" style = "display: inline-flex; align-items: center; justify-content: flex-end;">
					<button class = "btn btn-danger" id = "deletebtn" style = "margin-right: 10px;">취소</button>
					<button class = "btn btn-primary" id = "updatebtn" style = "margin-right: 10px;">제품 등록</button>
						<button class = "btn btn-secondary" id = "returnBtn">userListPage</button>
				</div>
				<div class = "col-3">
				</div>
			</div>	
			
			<input type = "hidden" id = "user_id" value="<%=request.getAttribute("userid")%>">
			<input type = "hidden" id = "user_isAdmin" value="${is_admin}">
			<input type = "hidden" id = "user_passwordReset" value="${password_reset}">
			
		</div>	
	</div>
</main>
<jsp:include page="../Common/footer.jsp"></jsp:include>
<script type="/js/chart/utils.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	dropdownInit();
	
	$('#deletebtn').click(function()
	{
		location.href = '/hello';		
	});
	
	$('#updatebtn').click(function()
	{
		
		var products_name = $('#product_name').val();
		var products_category = $('#dropdownMenuButton2').text();
		var products_price = $('#product_price').val();
		var products_location = $('#roadAddress').val();
		var products_details = $('#product_detail').val();
		var products_seller = $('#user_id').val();	
		
		products_details = products_details.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
		console.log(products_details);
		
		var formData = new FormData();

		// DTO의 다른 필드를 FormData에 추가
		formData.append('shop_id', 0); 
		formData.append('products_seller', $('#user_id').val());
		formData.append('products_name', $('#product_name').val());
		formData.append('products_category', $('#dropdownMenuButton2').text());
		formData.append('products_status', 'NULL'); 
		formData.append('products_details', $('#product_detail').val());
		formData.append('products_price', $('#product_price').val());
		formData.append('products_location', $('#roadAddress').val());			
		
		var files = $('#fileUpload').prop('files');
		for (var i = 0; i < files.length; i++) {
		    formData.append('files_list', files[i]);
		}		
		
		var dto = { 
								products_seller,
								products_name,
								products_category,
								products_price, 
								products_location, 
								products_details,
								files
							};
		
		console.log(dto);
		
		
			
		$.ajax({
	         url: '/upload_product',
	         type: 'POST',
	         data: formData,
	         contentType: false,
	         processData: false,
	         success: function(response) 
	         {	            
	        	 Swal.fire({
					  title: "제품등록",
					  text: "제품등록이 완료되었습니다.",
					  icon: "success"
					}).then((result) => {
						window.location.href = '/hello';
					});
	         },
	         error: function(jqXHR, textStatus, errorThrown) {
	             $('#uploadStatus').text('업로드 실패: ' + textStatus);
	         }
	     });	
		
		
	});
	
	
	$('#uploadButton').click(function() 
	{
		var files = $('#fileUpload').prop('files');
		var formData = new FormData();
			// 여러 개의 파일을 FormData에 추가
		for (var i = 0; i < files.length; i++) 
		{
			formData.append('files', files[i]);
		}
			
		updateImgFile(formData);
	});

	console.log($('#user_id').val());	
});

function get_formData()
{
	var files = $('#fileUpload').prop('files');
	var formData = new FormData();
		// 여러 개의 파일을 FormData에 추가
	for (var i = 0; i < files.length; i++) 
	{
		formData.append('files', files[i]);
	}
		
	return formData;
}

function updateImgFile(file)
{
	console.log(file);
	 $.ajax({
         url: '/file-spring_local',
         type: 'POST',
         data: file,
         contentType: false,
         processData: false,
         success: function(response) {
             $('#uploadStatus').text('업로드 성공: ' + response);
         },
         error: function(jqXHR, textStatus, errorThrown) {
             $('#uploadStatus').text('업로드 실패: ' + textStatus);
         }
     });	
}


function dropdownInit()
{
	$('#category_1').click(function()
	{
		$('#dropdownMenuButton1').text($('#category_1').text());	
		$('#dropdownMenuButton2').text('소분류');
		$('#category_small_1').text('상의');
		$('#category_small_2').text('하의');
		$('#category_small_3').text('아우터');		
	});	
	
	$('#category_2').click(function()
	{
			$('#dropdownMenuButton1').text($('#category_2').text());	
			$('#dropdownMenuButton2').text('소분류');
			$('#category_small_1').text('생활가전');
			$('#category_small_2').text('주방가전');
			$('#category_small_3').text('미용가전');		
	});	
	
	$('#category_3').click(function()
	{
		$('#dropdownMenuButton1').text($('#category_3').text());
		$('#dropdownMenuButton2').text('소분류');
		$('#category_small_1').text('남성시계');
		$('#category_small_2').text('여성시계');
		$('#category_small_3').text('시계용품');		
	});	
	
	$('#category_4').click(function()
	{
		$('#dropdownMenuButton1').text($('#category_4').text());	
		$('#dropdownMenuButton2').text('소분류');
		$('#category_small_1').text('CD');
		$('#category_small_2').text('LP');
		$('#category_small_3').text('DVD');		
	});	
	
	
	$('#category_small_1').click(function()
	{
		$('#dropdownMenuButton2').text($('#category_small_1').text());
	});
	$('#category_small_2').click(function()
			{
				$('#dropdownMenuButton2').text($('#category_small_2').text());
			});
	$('#category_small_3').click(function()
			{
				$('#dropdownMenuButton2').text($('#category_small_3').text());
			});
	
	
}

</script>
</body>
</html>