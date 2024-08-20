<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="/css/main.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>adminHome</title>
</head>
<body>

<jsp:include page="../../Common/header.jsp"></jsp:include>
<main>
<input id = "testInput" type = "hidden" value = "1234" ></input>
<div class="container">
	
	<div class = "row" style = "margin-bottom: 50px; border-bottom: 1px solid #80808033;">
		<div class = "col-6">
			<h1>Server State Page</h1>
		</div>	
		<div class = "col-6" style = "display: inline-flex;justify-content: flex-end;align-items: flex-end;">
			<button class = "btn btn-secondary" id = "userManagementPage" style = "margin-bottom: 10px;">전체 유저 관리</button>
		</div>
	</div>
	<div class = "row">
		<h3>Memory State </h3>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="myChart"></canvas>		
		</div>  		
	</div>	
	<div class = "row" style = "margin-top: 20px;">
		<div class = "col-12" style = "display : flex; justify-content: flex-end;">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    			Memory 속성 설명
		  </button>	
		</div>  		
	</div>
	<div class = "row" style = "margin-top: 10px; border-bottom: 1px solid #80808033; padding-bottom: 5px;">
		<div class = "col-12">
			<div class="collapse" id="collapseExample">
			  <div class="card card-body">
			    swpd: 스왑 메모리 사용량 (단위: KB). 이 값이 0이 아닌 경우, 시스템이 일부 메모리를 스왑 공간으로 옮겼다는 의미<br/>
			    free: 사용 가능한 메모리 양 (단위: KB). 시스템에서 아직 사용되지 않은 메모리의 양<br/>
			    buff: 버퍼 캐시로 사용된 메모리 양 (단위: KB). 디스크 I/O에서 읽어온 데이터가 저장되는 버퍼<br/>
			    cache: 페이지 캐시로 사용된 메모리 양 (단위: KB). 최근에 사용된 파일 시스템 데이터가 저장되는 캐시<br/>
			  </div>
			</div>
		</div>
	</div>
	
	
	<div class = "row" style = "margin-top: 50px;">
		<h3>Swap State </h3>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="SwapChart"></canvas>		
		</div>  		
	</div>	
	
	<div class = "row" style = "margin-top: 20px;">
		<div class = "col-12" style = "display : flex; justify-content: flex-end;">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_swap" aria-expanded="false" aria-controls="collapse_swap">
    			Swap 속성 설명
		  </button>	
		</div>  		
	</div>
	<div class = "row" style = "margin-top: 10px; border-bottom: 1px solid #80808033; padding-bottom: 5px;">
		<div class = "col-12">
			<div class="collapse" id="collapse_swap">
			  <div class="card card-body">
			    si (swap in): 디스크에서 메모리로 스왑된 양 (단위: KB/s).<br/>
			    so (swap out): 메모리에서 디스크로 스왑된 양 (단위: KB/s).<br/>
			  </div>
			</div>
		</div>
	</div>
	
	
	<div class = "row" style = "margin-top: 50px;">
		<h3>IO State </h3>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="IOChart"></canvas>		
		</div>  		
	</div>	
		<div class = "row" style = "margin-top: 20px;">
		<div class = "col-12" style = "display : flex; justify-content: flex-end;">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_io" aria-expanded="false" aria-controls="collapse_io">
    			IO 속성 설명
		  </button>	
		</div>  		
	</div>
	<div class = "row" style = "margin-top: 10px; border-bottom: 1px solid #80808033; padding-bottom: 5px;">
		<div class = "col-12">
			<div class="collapse" id="collapse_io">
			  <div class="card card-body">
			   	bi (blocks in): 블록 디바이스에서 수신된 블록 수 (단위: 블록/s). 디스크에서 데이터를 읽는 양<br/>
			   	bo (blocks out): 블록 디바이스로 전송된 블록 수 (단위: 블록/s). 디스크로 데이터를 쓰는 양<br/>
			  </div>
			</div>
		</div>
	</div>
	
	
	<div class = "row" style = "margin-top: 50px;">
		<h3>System State </h3>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="sysChart"></canvas>		
		</div>  		
	</div>	
		<div class = "row" style = "margin-top: 20px;">
		<div class = "col-12" style = "display : flex; justify-content: flex-end;">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_sys" aria-expanded="false" aria-controls="collapse_sys">
    			System 속성 설명
		  </button>	
		</div>  		
	</div>
	<div class = "row" style = "margin-top: 10px; border-bottom: 1px solid #80808033; padding-bottom: 5px;">
		<div class = "col-12">
			<div class="collapse" id="collapse_sys">
			  <div class="card card-body">
			   	in (interrupts): 초당 발생한 인터럽트 수.<br/>
			   	cs (context switches): 초당 발생한 컨텍스트 스위치 수.<br/>
			  </div>
			</div>
		</div>
	</div>
	
		<div class = "row" style = "margin-top: 50px;">
		<h3>Cpu State </h3>
		<div class = "col-12" style = "max-height: 300px;">
			<canvas id="cpuChart"></canvas>		
		</div>  		
	</div>	
		<div class = "row" style = "margin-top: 20px;">
		<div class = "col-12" style = "display : flex; justify-content: flex-end;">
			<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_cpu" aria-expanded="false" aria-controls="collapse_cpu">
    			Cpu 속성 설명
		  </button>	
		</div>  		
	</div>
	<div class = "row" style = "margin-top: 10px; border-bottom: 1px solid #80808033; padding-bottom: 5px;">
		<div class = "col-12">
			<div class="collapse" id="collapse_cpu">
			  <div class="card card-body">
			   	us (user): 사용자 모드에서 CPU가 사용된 시간 비율 (%). 애플리케이션 프로세스가 CPU를 사용하는 시간<br/>
			   	sy (system): 커널 모드에서 CPU가 사용된 시간 비율 (%). 시스템 커널 및 드라이버 작업에 사용된 시간<br/>
			   	id (idle): 사용되지 않은 CPU 시간 비율 (%). CPU가 유휴 상태인 시간<br/>
			   	wa (wait): I/O 대기 시간 비율 (%). CPU가 디스크 I/O 등으로 인해 대기하는 시간<br/>
			   	st (steal time): 가상화 환경에서 다른 가상 머신이 CPU를 사용하여 이 가상 머신이 대기한 시간 비율 (%).<br/>
			   	
			  </div>
			</div>
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
var char_swap;
var char_io;
var char_sys;
var char_cpu;

$(document).ready(function()
{
	min = new Array();	
	
	
	$('#userManagementPage').click(function()
	{
		location.href='/userManagementPage';
	});	
	
	
	chartfunc();
	setInterval(chartfunc, 30000);
});

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
			memory_chartInit(list, cnt);			
			swap_chartInit(list, cnt);
			io_chartInit(list, cnt);
			sys_chartInit(list, cnt);
			cpu_chartInit(list, cnt);
		}
	});
}

function chartfunc()
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
		var tempH = h;
		
		if(tempMin < 0)
		{
			tempMin = 60 + tempMin;
			tempH = h - 1;
		}
		
		if(tempMin < 10)	
			tempMin = "0" + tempMin;		
		
		var dateinfo = tempH +":" + tempMin;		
		min[i] = dateinfo;
	}
	
	if(char_test)	
		char_test.destroy();

	if(char_swap)
		char_swap.destroy();
	
	if(char_io)
		char_io.destroy();	
	
	if(char_sys)
		char_sys.destroy();
	
	if(char_cpu)
		char_cpu.destroy();
	
	Get_ServerInfo(nowDate,h+":"+m);	
}

function cpu_chartInit(list, count)
{
	const ctx = document.getElementById('cpuChart');	
	var cnt = count;
	
	char_cpu = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: 
	    	  [
		    	  {
		        label: '# of cpu_us',	        
		        borderColor: 'rgb(255, 99, 132)',
		        data: [
		        	list[9].cpu_us,
		        	list[8].cpu_us,
		        	list[7].cpu_us,
		        	list[6].cpu_us,
		        	list[5].cpu_us,
		        	list[4].cpu_us,
		        	list[3].cpu_us,
		        	list[2].cpu_us,
		        	list[1].cpu_us,
		        	list[0].cpu_us],
		        borderWidth: 1
		      },
		      {
			        label: '# of cpu_sy',	        
			        borderColor: 'rgb(153, 102, 255)',
			        data: [
			        	list[9].cpu_sy,
			        	list[8].cpu_sy,
			        	list[7].cpu_sy,
			        	list[6].cpu_sy,
			        	list[5].cpu_sy,
			        	list[4].cpu_sy,
			        	list[3].cpu_sy,
			        	list[2].cpu_sy,
			        	list[1].cpu_sy,
			        	list[0].cpu_sy],
			        borderWidth: 1
			      },
			      {
				        label: '# of cpu_id',	        
				        borderColor: 'rgb(54, 162, 235)',
				        data: [
				        	list[9].cpu_id,
				        	list[8].cpu_id,
				        	list[7].cpu_id,
				        	list[6].cpu_id,
				        	list[5].cpu_id,
				        	list[4].cpu_id,
				        	list[3].cpu_id,
				        	list[2].cpu_id,
				        	list[1].cpu_id,
				        	list[0].cpu_id],
				        borderWidth: 1
				     },
				     {
					       label: '# of cpu_wa',	        
					       borderColor: 'rgb(75, 192, 192)',
					       data: [
					       	list[9].cpu_wa,
					       	list[8].cpu_wa,
					        	list[7].cpu_wa,
					        	list[6].cpu_wa,
					        	list[5].cpu_wa,
					        	list[4].cpu_wa,
					        	list[3].cpu_wa,
					        	list[2].cpu_wa,
					        	list[1].cpu_wa,
					        	list[0].cpu_wa],
					        borderWidth: 1
					     },
						    {
						        label: '# of cpu_st',	        
						        borderColor: 'rgb(201, 203, 207)',
						        data: [
						        	list[9].cpu_st,
						        	list[8].cpu_st,
						        	list[7].cpu_st,
						        	list[6].cpu_st,
						        	list[5].cpu_st,
						        	list[4].cpu_st,
						        	list[3].cpu_st,
						        	list[2].cpu_st,
						        	list[1].cpu_st,
						        	list[0].cpu_st],
						        borderWidth: 1
						      }
	    	]
	    },
	    options: {
	    	maintainAspectRatio: false,
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

function sys_chartInit(list, count)
{
	const ctx = document.getElementById('sysChart');	
	var cnt = count;
	
	char_sys = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: 
	    	  [
		    	  {
		        label: '# of system_in',	        
		        borderColor: 'rgb(255, 99, 132)',
		        data: [
		        	list[9].system_in,
		        	list[8].system_in,
		        	list[7].system_in,
		        	list[6].system_in,
		        	list[5].system_in,
		        	list[4].system_in,
		        	list[3].system_in,
		        	list[2].system_in,
		        	list[1].system_in,
		        	list[0].system_in],
		        borderWidth: 1
		      },
		      {
			        label: '# of system_cs',	        
			        borderColor: 'rgb(153, 102, 255)',
			        data: [
			        	list[9].system_cs,
			        	list[8].system_cs,
			        	list[7].system_cs,
			        	list[6].system_cs,
			        	list[5].system_cs,
			        	list[4].system_cs,
			        	list[3].system_cs,
			        	list[2].system_cs,
			        	list[1].system_cs,
			        	list[0].system_cs],
			        borderWidth: 1
			      }
	    	]
	    },
	    options: {
	    	maintainAspectRatio: false,
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

function io_chartInit(list, count)
{
	const ctx = document.getElementById('IOChart');	
	var cnt = count;
	
	char_io = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: 
	    	  [
		    	  {
		        label: '# of io_bi',	        
		        borderColor: 'rgb(255, 99, 132)',
		        data: [
		        	list[9].io_bi,
		        	list[8].io_bi,
		        	list[7].io_bi,
		        	list[6].io_bi,
		        	list[5].io_bi,
		        	list[4].io_bi,
		        	list[3].io_bi,
		        	list[2].io_bi,
		        	list[1].io_bi,
		        	list[0].io_bi],
		        borderWidth: 1
		      },
		      {
			        label: '# of io_bo',	        
			        borderColor: 'rgb(153, 102, 255)',
			        data: [
			        	list[9].io_bo,
			        	list[8].io_bo,
			        	list[7].io_bo,
			        	list[6].io_bo,
			        	list[5].io_bo,
			        	list[4].io_bo,
			        	list[3].io_bo,
			        	list[2].io_bo,
			        	list[1].io_bo,
			        	list[0].io_bo],
			        borderWidth: 1
			      }
	    	]
	    },
	    options: {
	    	maintainAspectRatio: false,
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

function swap_chartInit(list, count)
{
	const ctx = document.getElementById('SwapChart');	
	var cnt = count;
	
	char_swap = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: 
	    	  [
		    	  {
		        label: '# of Swap_SI',	        
		        borderColor: 'rgb(255, 99, 132)',
		        data: [
		        	list[9].swap_si,
		        	list[8].swap_si,
		        	list[7].swap_si,
		        	list[6].swap_si,
		        	list[5].swap_si,
		        	list[4].swap_si,
		        	list[3].swap_si,
		        	list[2].swap_si,
		        	list[1].swap_si,
		        	list[0].swap_si],
		        borderWidth: 1
		      },
		      {
			        label: '# of Swap_SO',	        
			        borderColor: 'rgb(153, 102, 255)',
			        data: [
			        	list[9].swap_so,
			        	list[8].swap_so,
			        	list[7].swap_so,
			        	list[6].swap_so,
			        	list[5].swap_so,
			        	list[4].swap_so,
			        	list[3].swap_so,
			        	list[2].swap_so,
			        	list[1].swap_so,
			        	list[0].swap_so],
			        borderWidth: 1
			      }
	    	]
	    },
	    options: {
	    	maintainAspectRatio: false,
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


function memory_chartInit(list, count)
{
	const ctx = document.getElementById('myChart');	
	var cnt = count;

	char_test =  new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: [min[9],min[8],min[7],min[6],min[5],min[4],min[3],min[2],min[1],min[0]],
	      datasets: 
	    	  [
		    	  {
		        label: '# of memory_cache',	        
		        borderColor: 'rgb(255, 99, 132)',
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
		      },
		      {
			        label: '# of memory_buffer',	        
			        borderColor: 'rgb(153, 102, 255)',
			        data: [
			        	list[9].memory_buffer,
			        	list[8].memory_buffer,
			        	list[7].memory_buffer,
			        	list[6].memory_buffer,
			        	list[5].memory_buffer,
			        	list[4].memory_buffer,
			        	list[3].memory_buffer,
			        	list[2].memory_buffer,
			        	list[1].memory_buffer,
			        	list[0].memory_buffer],
			        borderWidth: 1
			      },
			      {
				        label: '# of memory_free',	        
				        borderColor: 'rgb(54, 162, 235)',
				        data: [
				        	list[9].memory_free,
				        	list[8].memory_free,
				        	list[7].memory_free,
				        	list[6].memory_free,
				        	list[5].memory_free,
				        	list[4].memory_free,
				        	list[3].memory_free,
				        	list[2].memory_free,
				        	list[1].memory_free,
				        	list[0].memory_free],
				        borderWidth: 1
				      },
				      {
					        label: '# of memory_swap',	        
					        borderColor: 'rgb(75, 192, 192)',
					        data: [
					        	list[9].memory_swpd,
					        	list[8].memory_swpd,
					        	list[7].memory_swpd,
					        	list[6].memory_swpd,
					        	list[5].memory_swpd,
					        	list[4].memory_swpd,
					        	list[3].memory_swpd,
					        	list[2].memory_swpd,
					        	list[1].memory_swpd,
					        	list[0].memory_swpd],
					        borderWidth: 1
					      }
	    	]
	    },
	    options: {
	    	maintainAspectRatio: false,
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


</script>
</html>