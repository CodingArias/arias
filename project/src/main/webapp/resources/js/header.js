


$(function() {
	$('#mypage').hover(function() {
		$(this).addClass("open");
		$(".dropdown").attr("aria-expanded", "true");
	}, function() {
		$(this).removeClass("open");
		$(".dropdown").attr("aria-expanded", "false");
	});
	
	
	$('#hosting').hover(function() {
		$(this).addClass("open");
		$(".dropdown").attr("aria-expanded", "true");
	}, function() {
		$(this).removeClass("open");
		$(".dropdown").attr("aria-expanded", "false");
	});
});