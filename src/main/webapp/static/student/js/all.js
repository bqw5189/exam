// JavaScript Document
$(function(){
		$('h1.onhere',$('.leftMenulist')).nextAll('a').css('display','block');
		$('h1',$('.leftMenulist')).click(function(){
			$('.leftMenulist a').hide();
			$('h1',$('.leftMenulist')).removeClass('onhere');
			$(this).addClass('onhere');
			$(this).nextAll('a').css('display','block');
			})	
		setInterval(changeimg,1500);
						
	})
	function changeimg(){
		for(var j=0;j< 6;j++){
		var i01 =$('.rollBox .img0'+j).attr('dex');
		var url01 ='url('+ctx+'img/pic0'+i01+'.png)'
		$('.rollBox .img0'+j).css('background',url01)
		i01++
		$('.rollBox .img0'+j).attr('dex',i01);
		if(i01 > 5){
				$('.rollBox .img0'+j).attr('dex',1);
				}
			}
		}
	
	
	