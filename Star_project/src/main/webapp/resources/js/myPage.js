$(document).ready(function(){
	$(".sideBar").next().hide();
	
	$(".sideBar").on("click", function() {
		$(this).next().slideToggle();
		$(this).children().toggleClass("sideAct");
	});
	
});