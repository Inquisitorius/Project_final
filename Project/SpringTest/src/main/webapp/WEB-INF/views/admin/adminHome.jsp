<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="/css/main.css" rel="stylesheet" type="text/css">
<jsp:include page="../../Common/header.jsp"></jsp:include>
<main>
<input id = "testInput" type = "hidden" value = "1234" ></input>
<div class="container">
	
	<div class = "row">
		<h1>Memory State </h1>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="myChart"></canvas>		
		</div>  		
	</div>
	
	<div class = "row">
		<div class = "col-12" style = "min-height: 1000px;">
			asdasad
		</div>  		
	</div>
	
</div>
</main>

<jsp:include page="../../Common/footer.jsp"></jsp:include>
</body>
<script type="/js/chart/utils.js"></script>
<script type="text/javascript">

var min;
var char_test;

$(document).ready(function()
{
	min = new Array();	
	
	
	console.log($("#testInput").val());
	doTest();
	setInterval(doTest, 30000);
});

function doTest()
{
	var now = new Date();
	var h = String(now.getHours()).padStart(2, "0");
	var m = String(now.getMinutes()).padStart(2, "0");
	
	var yyyy = now.getFullYear();
	var mm  = now.getMonth()+1;
	var dd = now.getDate();
	
	if(mm < 10)
		mm = '0' + mm;
	
	if(dd < 10)
		dd = '0' + dd;
	
	var nowDate = yyyy + "-" + mm +"-" + dd;	
	
	for(var i = 0; i < 10; ++i)
	{
		var tempMin = m-(i+1);
		
		if(tempMin < 10)	
			tempMin = "0" + tempMin;		
		
		var dateinfo = h +":" + tempMin;		
		min[i] = dateinfo;
	}
	
	if(char_test)
	{
		char_test.destroy();
	}		
	
	Get_ServerInfo(nowDate,h+":"+m);	
}

function chartInit(list)
{
	console.log(list);
	const ctx = document.getElementById('myChart');
	
	var cnt = 10;

	char_test =  new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: [{
	        label: '# of memory_cache',
	        borderColor: #FF0000,
	        data: [
	        	list[9].memory_cache,
	        	list[8].memory_cache,
	        	list[7].memory_cache,
	        	list[6].memory_cache,
	        	list[5].memory_cache,
	        	list[4].memory_cache,
	        	list[3].memory_cache,
	        	list[2].memory_cache,
	        	list[1].memory_cache,
	        	list[0].memory_cache],
	        borderWidth: 1
	      }]
	    },
	    options: {
	    	scales: {
	    	      x: {
	    	        display: true,
	    	      },
	    	      y: {
	    	        display: true,
	    	        type: 'logarithmic',
	    	      }
	    	}
	    }
	  });
}

function Get_ServerInfo(dateData, timeData)
{
	var date = dateData;
	var time = timeData;
	var cnt = 10;
	
	$.ajax({
		url : '/getServerInfo',
		type: 'POST',
		data: {date, time , cnt},
		success: function(list)
		{
			chartInit(list);			
		}
	});
	
	
}

/*
 $(document).ready(function(){
    var now = new Date();
    $("p").eq(0).text(now);
  }); 
 
 
 */

</script>
</html>