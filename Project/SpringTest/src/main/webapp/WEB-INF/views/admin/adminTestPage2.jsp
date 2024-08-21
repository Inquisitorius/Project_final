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
<div id = "testDiv">
<img src = "/img/c:/jgs/5_test.png"/>
</div>
<div id="imageContainer"></div>
</body>
<script type="text/javascript">
$('document').ready(function()
{
	init_forTest();	
});

function init_forTest()
{
	$.ajax({
        url: '/getImgNameList',
        type: 'POST',       
        contentType: 'application/json',
        processData: 'json',
        success: function(filePaths) 
        {
        	var container = $('#imageContainer').empty();	
        	
        	filePaths.forEach(function(filePath) {
				//var path = filePath.replace('/home/ubuntu/tomcat/apache-tomcat-10.0.27/webapps/ROOT/WEB-INF/classes/static', '');
         var path = filePath;
				var img = $('<img>').attr('src', path).attr('alt', '동적 이미지');
                var div = $('<div>').addClass('image-item').append(img);
                container.append(div);
            });
        	
        	
        },
        error: function(jqXHR, textStatus, errorThrown) {
            
        }
    });	
}
</script>

</html>