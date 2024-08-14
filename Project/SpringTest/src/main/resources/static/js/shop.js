$(document).ready(function() {
	
	
	$("#img-trigger").click(function() {
		$("#file-input").click();
	});
	
	$('#name-update').click(function(){
		$("#name").attr("hidden", true); 
		$("#button-container").attr("hidden", true);
		$("#update-shopname").removeAttr("hidden");
	});
	
	$('#info-btn').click(function(){
		$('#shop-info').attr("hidden", true);
		$('#infobtn-container').attr("hidden", true);
		$('#text-container').removeAttr("hidden");
	});
	
});