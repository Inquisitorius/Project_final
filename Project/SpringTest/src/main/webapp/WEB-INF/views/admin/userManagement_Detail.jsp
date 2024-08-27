<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="/css/main.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>userDetail information</title>
</head>
<body>
<jsp:include page="../../Common/header.jsp"></jsp:include>
<main>
<div class="container">

	<div class = "row" style = "margin-bottom: 50px; border-bottom: 1px solid #80808033;">
		<div class = "col-12">
			<h1>User Detail Information</h1>
		</div>			
	</div>
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User id : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" value = "${id}" disabled 
			style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User email : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" id = "user_email" value = "${email}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User birthDate : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" id = "user_birthDate" value = "${birthDate}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User expJibunAddr : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" id = "user_expJibunAddr" value = "${expJibunAddr}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User detail_address : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control"  id = "user_detail_address" value = "${detail_address}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User gender : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" id = "user_gender" value = "${gender}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User name : </label>
		</div>
		<div class = "col-5">
			<input type = "text" class = "form-control" id = "user_name" value = "${name}"  style="max-width: 100%;"/>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 10px;">
		<div class = "col-2" ></div>
		<div class = "col-2" style = "display: inline-flex; align-items: center;">
			<label>User is_admin : </label>
		</div>
		<div class = "col-5">
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
			  <label class="form-check-label" id = "isAdmin_CheckLabel" for="flexCheckChecked">
			    --
			  </label>
			</div>
		</div>
	</div>
	
	<div class = "row" style = "margin-bottom: 30px;">
		<div class = "col-9" style = "display: inline-flex; align-items: center; justify-content: flex-end;">
			<button class = "btn btn-danger" id = "deletebtn" style = "margin-right: 10px;">유저 삭제</button>
			<button class = "btn btn-primary" id = "updatebtn" style = "margin-right: 10px;">정보 수정</button>
				<button class = "btn btn-secondary" id = "returnBtn">userListPage</button>
		</div>
		<div class = "col-3">
		</div>
	</div>	
	
	<input type = "hidden" id = "user_id" value="${id}">
	<input type = "hidden" id = "user_isAdmin" value="${is_admin}">
	<input type = "hidden" id = "user_passwordReset" value="${password_reset}">
	
</div>

</main>
<jsp:include page="../../Common/footer.jsp"></jsp:include>

</body>
<script type="/js/chart/utils.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	console.log($('#user_isAdmin').val());
	
	$('#returnBtn').click(function()
	{
		window.location.href = '/userManagementPage';
	});
	
	//flexCheckChecked
	if($('#user_isAdmin').val() == 'true')
	{
		$('#flexCheckChecked').prop("checked", true);
		$('#isAdmin_CheckLabel').text("is Admin");
	}
	else
	{
		$('#flexCheckChecked').prop("checked", false);
		$('#isAdmin_CheckLabel').text("is not Admin");
	}
	
	$('#flexCheckChecked').click(function()
	{
		adminChecked_Event('#flexCheckChecked');
	});
	
	$('#deletebtn').click(function()
	{
		var dto = {
			    id: $('#user_id').val()
		}
		
		$.ajax({
			url : '/DeleteUserInfo_Admin',
			type: 'POST',
			data: dto,
			success: function(list)
			{
				Swal.fire({
					  title: "회원 정보 삭제",
					  text: "삭제가 완료 되었습니다.",
					  icon: "success"
					}).then((result) => {
						window.location.href = '/userManagementPage';
					});		
			}
		});
	});
	
	$('#updatebtn').click(function()
	{

		var dto = {
			    id: $('#user_id').val(),
			    name: $('#user_name').val(),
			    email: $('#user_email').val(),
			    gender: $('#user_gender').val(),
			    brithString : $('#user_birthDate').val(),
			    expJibunAddr : $('#user_expJibunAddr').val(),
			    detail_address : $('#user_detail_address').val(),
			    is_admin : $('#flexCheckChecked').is(":checked")
			};	
		
		$.ajax({
			url : '/UpdateUserInfo_Admin',
			type: 'POST',
			data: dto,
			success: function(list)
			{
				Swal.fire({
					  title: "회원 정보 수정",
					  text: "수정이 완료 되었습니다.",
					  icon: "success"
					}).then((result) => {
						window.location.href = '/userManagementPage';
					});
			}
		});		
	});
	
});

function adminChecked_Event(status_id)
{
	if($(status_id).is(":checked"))
	{
		$('#isAdmin_CheckLabel').text("is Admin");
	}
	else
	{
		$('#isAdmin_CheckLabel').text("is not Admin");
	}
}


</script>
</html>