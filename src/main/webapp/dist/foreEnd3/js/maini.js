jQuery(document).ready(function($){
	
	//close popup
	$('.cd-popup').on('click', function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.cd-popup').removeClass('is-visible');
	    }
    });

//所有页的注册
    $('.allregister').on('click', function(event){
        event.preventDefault();
        $('.allpop').addClass('is-visible');
    });

    //close popup
    $('.allpop').on('click', function(event){
        if( $(event.target).is('.all_close') || $(event.target).is('.allpop') ) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    //close popup when clicking the esc keyboard button
    $(document).keyup(function(event){
        if(event.which=='27'){
            $('.allpop').removeClass('is-visible');
        }
    });
});

