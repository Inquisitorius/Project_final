<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
<link href="/css/main.css" rel="stylesheet" type="text/css">
<link href="/css/tabulator_site.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
<meta charset="UTF-8">
<title>유저 관리 페이지</title>
<style>
.tabulator.tabulator-header
{
	border-bottom: 1px solid #3FB449;	
}
.tabulator-tableholder 
{
	border-right: 1px solid #f5f0f5;
	border-left: 1px solid #f5f0f5;
	/*background-color: #3f3f3f; /* 원하는 배경 색으로 변경 */
}

.table-controls
{
	margin-bottom: 0px;
    padding: 10px 5px 0 5px;
    background: #5f5f5f;
    border-bottom: 1px solid #ffffff;
    font-size: 14px;
}
.table-controls input, .table-controls select 
{
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding: 4px 10px;
    border: 1px solid #4b4b4b;
    border-radius: 5px;
    background: #1f1f1f;
    outline: none;
    color: #ccc;
}

.table-controls input, .table-controls select {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding: 4px 10px;
    border: 1px solid #4b4b4b;
    border-radius: 5px;
    background: #1f1f1f;
    outline: none;
    color: #ccc;
}

.table-label {

	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700;
    color: #ccc;
}

.table-button {

	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-style: normal;
	
    padding: 5px 10px;
    border: 1px solid #25682a;
    background: #3FB449;
    background: -webkit-gradient(linear, left top, left bottom, from(#3FB449), to(#25682a));
    background: linear-gradient(to bottom, #3FB449 0%, #25682a 100%);
    color: #fff;
    font-weight: bold;
    -webkit-transition: color .3s, background .3s, opacity, .3s;
    transition: color .3s, background .3s, opacity, .3s;
    border-radius : 4px;
}
</style>
</head>
<body>
<jsp:include page="../../Common/header.jsp"></jsp:include>
<main>
	<input id = "loginSave" type = "hidden" value = "<%= request.getAttribute("userid")%>"/>
	<div class = "container">
		<div class = "row">
			<div class = "col-12">
				<div id="example-table"></div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-12">
				<div style = "display: none;">
					<form id = "dataForm" name="data" method="post" action = "/userManagementDetail">
						<input id = "form_id" type="hidden" name ="id" value="">
						<input id = "form_email" type="hidden" name ="email" value="">
						<input id = "form_birthDate" type="hidden" name ="brithString" value="">
						<input id = "form_jibunAddr" type="hidden" name ="expJibunAddr" value="">
						<input id = "form_address" type="hidden" name ="street_address" value="">
						<input id = "form_addressDetail" type="hidden" name ="detail_address" value="">
						<input id = "form_gender" type="hidden" name ="gender" value="">
						<input id = "form_name" type="hidden" name ="name" value="">
						<input id = "form_isAdmin" type="hidden" name ="is_admin" value="">
						<input id = "form_password_reset" type="hidden" name ="password_reset" value="">
					</form>
				</div>
			</div>
		</div>		
		<div class = "row" style = "margin-bottom: 10px; margin-top: 10px;">
			<div class = "col-12" style = "display: inline-flex; justify-content: flex-end;">
				<button class = "btn btn-secondary" id = "returnBtn">adminServerState</button>
			</div>
		</div>	
	</div>
	
</main>
<jsp:include page="../../Common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

$(document).ready(function()
{
	console.log($('#loginSave').val());
	
	$('#returnBtn').click(function()
	{
		window.location.href = '/adminHome';
	});
	
	
	tabulatorInit();
});


function tabulatorInit()
{
	var user_id = $('#loginSave').val();
	
	var table = new Tabulator("#example-table", {
	    height:"430px",
	    layout: "fitColumns",
	    pagination: "local",          // 로컬 페이징 사용
	    paginationSize: 10,           // 페이지당 행 수
	    paginationSizeSelector: [5, 10, 20, 50], // 선택 가능한 페이지당 행 수
	    ajaxURL: "/admin_GetUserList", // 데이터 로드할 URL
	    ajaxParams: { 
	        id: 30
	    },
	    ajaxConfig: {
	        method: "GET"
	    },
	    columns:
	    [
	    	{title:"passwordReset", field:"password_reset", visible: false},
	    	{title:"password", field:"pwd", visible: false},
		  		{title:"id", field:"id"},
		  		{title:"name", field:"name"},		   		
		  		{title:"phone", field:"phone", hozAlign:"center"},
		  		{title:"birthDate", field:"birthDate", hozAlign:"center"}
	    ],
	    
	    layout:"fitColumns"
	});
	    
	table.on("rowClick", function(e,row){
			//페이지 이동 처리 
			
		   $('#form_id').val(row.getData().id);
		   $('#form_email').val(row.getData().email);
		   
		   $('#form_birthDate').val(row.getData().birthDate);
		   $('#form_jibunAddr').val(row.getData().expJibunAddr);
		   
		   $('#form_address').val(row.getData().street_address);
		   $('#form_addressDetail').val(row.getData().detail_address);
		   $('#form_gender').val(row.getData().gender);
		   $('#form_name').val(row.getData().name);
		   
		   $('#form_isAdmin').val(row.getData().is_admin);
		   $('#form_password_reset').val(row.getData().password_reset);
		   
		   $('#dataForm').submit();
		   
	    });
	    
	    return table;
}

</script>
</html>