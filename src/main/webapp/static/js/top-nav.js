$().ready(function(){ 

	$(window).unload(function() {
		$('#userNav').removeClass('down');
		$('.dropDownLabel').removeClass('down');
		$('.dropDownList').hide();
	});
	
	$('.dropDownLabel').click(function(){
		var topMenuTimer;
		if($(this).hasClass('down')){
			$('.dropDownList').hide();
			$(this).removeClass('down');
			$('#userNav').removeClass('down');
		} else {
			$('.dropDownList').show();
			$(this).addClass('down');
			$('#userNav').addClass('down');
			$('.dropDownList').mouseleave(function(){
				topMenuTimer = setTimeout(function(){
					$('.dropDownList').hide();
					$('.dropDownLabel').removeClass('down');
					$('#userNav').removeClass('down');
				}, 2000);
			});
			$('.dropDownList').mouseover(function(){
				clearTimeout(topMenuTimer);
			});
		}
	});
		
}
);

