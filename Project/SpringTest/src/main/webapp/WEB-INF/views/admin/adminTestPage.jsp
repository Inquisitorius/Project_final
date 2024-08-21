<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <form id="uploadForm">
        <label for="fileUpload">사진 선택:</label>
        <input type="file" id="fileUpload" name="uploadedFiles" accept="image/*" multiple>
        <br><br>
        <label for="nameInput">이름 입력 (콤마로 구분):</label>
        <input type="text" id="nameInput" placeholder="파일마다 이름을 입력 (예: name1, name2)">
        <br><br>
        <input type="button" id="uploadButton" value="업로드">
    </form>
    <p id="uploadStatus"></p>


</body>
<script type="text/javascript">
$('document').ready(function()
{

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
	
	$('#fileUpload').change(function(){
        var fileName = $(this).val().split('\\').pop();
        $('#fileNameDisplay').text(fileName);
    });
});

function updateImgFile(file)
{
	console.log(file);
	 $.ajax({
         url: '/file-spring_12',
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
</script>
</html>