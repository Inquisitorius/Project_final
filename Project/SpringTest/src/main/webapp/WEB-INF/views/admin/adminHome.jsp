<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input id = "testInput" type = "hidden" value = "1234" ></input>

<h1>this is AdminHome </h1>
</body>
<script type="text/javascript">
$(document).ready(function()
{
	console.log($("#testInput").val());
	
});

</script>
</html>