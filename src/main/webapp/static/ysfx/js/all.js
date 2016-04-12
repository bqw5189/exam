// JavaScript Document

	
$(function(){
		$('h1.onhere',$('.leftMenulist')).nextAll('a').css('display','block');
		$('h1',$('.leftMenulist')).click(function(){
			$('.leftMenulist a').hide();
			$('h1',$('.leftMenulist')).removeClass('onhere');
			$(this).addClass('onhere');
			
			$(this).nextAll('a').css('display','block');
			})	
			
		$('a',$('.leftMenulist')).click(function(){
			$('a',$('.leftMenulist')).removeClass('onhere');
			$(this).addClass('onhere');
			
			})	
		var flag = $('.rollBox').css('display')
		var flagblue = $('.rollBoxblue').css('display')
		if(flag='block'){
			setInterval(changeimg,1500);
			}
		if(flagblue='block'){
			setInterval(changeimgblue,1500);
			}
		//换f功能
		$('span.green' ,$('.hfcolor')).click(function(){
				$('.hfbox').css('background','#1ba627')
				$('#linkdom').attr('href','css/green.css')
				
			})
		$('span.blue' ,$('.hfcolor')).click(function(){
				$('.hfbox').css('background','#137c94')
				$('#linkdom').attr('href','css/blue.css')
				
			})
						
	})
	function changeimg(){
		for(var j=0;j< 6;j++){
		var i01 =$('.rollBox .img0'+j).attr('dex');
		var url01 ='url(img/pic0'+i01+'.png)'
		$('.rollBox .img0'+j).css('background',url01)
		i01++
		$('.rollBox .img0'+j).attr('dex',i01);
		if(i01 > 5){
				$('.rollBox .img0'+j).attr('dex',1);
				}
			}
		}
	
	function changeimgblue(){
		for(var j=0;j< 6;j++){
		var i01 =$('.rollBoxblue .img0'+j).attr('dex');
		var url01 ='url(img/blue/pic0'+i01+'.jpg)'
		$('.rollBoxblue .img0'+j).css('background',url01)
		i01++
		$('.rollBoxblue .img0'+j).attr('dex',i01);
		if(i01 > 5){
				$('.rollBoxblue .img0'+j).attr('dex',1);
				}
			}
		}
	
	
	