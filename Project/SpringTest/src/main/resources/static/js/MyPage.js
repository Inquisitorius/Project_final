$(document).ready(function() {
	
	
	$("#img-trigger").click(function() {
		$("#file-input").click();
	});
	
	$('#name-update').click(function(){
		$("#name").attr("hidden", true); 
		$("#button-container").attr("hidden", true);
		$("#update-shopname").removeAttr("hidden");
	});
	
	
});