// JavaScript Document
$(function(){
	//select js
	$('.selBtn_L').hover(function(){
		    $(this).parent().next('.selDatabox_L').css('display','block');
		},function(e){
			//console.log($()
			var flag = $(e.relatedTarget).parents().hasClass('selDatabox_L') || $(e.relatedTarget).parent().hasClass('selectInput_L');
			if(!flag){
				$(this).parent().next('.selDatabox_L').css('display','none');
				}
			
			})
	
	$('.selDatabox_L li').click(function(){
		var thisdata = $(this).text();
		$(this).parents('.selectbox_L').find('input').val(thisdata);
		$(this).parents('.selDatabox_L').hide();
		})
		
	$('.selDatabox_L li').mouseout(function(e){
		 e.stopPropagation(); 
		 var flag = $(e.relatedTarget).parent().hasClass('selDatabox_L')|| $(e.relatedTarget).parent().hasClass('selectInput_L');
			if(!flag){
				$(this).parent().css('display','none');
			} 
		})
	
	$('.selectInput_L input').mouseout(function(e){
		 e.stopPropagation(); 
		 var flag = $(e.relatedTarget).parents().hasClass('selDatabox_L')|| $(e.relatedTarget).parent().hasClass('selectInput_L');
			if(!flag){
				$(this).parent().next('.selDatabox_L').css('display','none');
			} 
		})
		
	
		
		
		
	})

	