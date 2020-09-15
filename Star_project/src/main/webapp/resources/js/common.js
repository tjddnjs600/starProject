$(document).ready(function() {
	$(".gnb-sub-wrap").hide();
	
	$(".gmenu").hover(function() {
		$(".gnb-sub-wrap").removeClass("on");
		$(this).next(".gnb-sub-wrap").addClass("on");
		$(this).css({"background":"#2C2A29","color":"#669900"});
		$(".on").stop().slideDown(200);
	}, function() {
		$(this).css({"color":"#333","background":"none"});
		$(".on").stop().slideUp(200);
	});
	
	$(".gnb-sub-wrap").hover(function() {
		$(this).prev(".gmenu").css({"color":"#669900","background":"#2C2A29"});
		$(".on").stop().slideDown(200);
	}, function() {
		$(this).prev(".gmenu").css({"color":"#333","background":"none"});
		$(".on").stop().slideUp(200);
	});

	
});