
$(function(){

	///
	///탭 체인지
	///
	var $tab=$('.tab');
	var $product_BEST=$('.product_BEST');
	var $product_NEW=$('.product_NEW');
	$tab.each(function(index, element) {
		var index_inner=index;
		if(index_inner==0){
        	$(this).find(' .tab_text').on('click' ,function(){
				$tab.eq(0).find(' .tab_dot').css({display:'block'});
				$tab.eq(1).find(' .tab_dot').css({display:'none'});
				$(this).removeClass('tab_textcolor2');
				$(this).addClass('tab_textcolor1');
				$tab.eq(1).find(' .tab_text').removeClass('tab_textcolor1');
				$tab.eq(1).find(' .tab_text').addClass('tab_textcolor2');
				$product_BEST.css({display:'block'});
				$product_NEW.css({display:'none'});
				$('#product').removeClass('ActiveNew');
			});
		}
		else if(index_inner==1){
        	$(this).find(' .tab_text').on('click' ,function(){
				$tab.eq(1).find(' .tab_dot').css({display:'block'});
				$tab.eq(0).find(' .tab_dot').css({display:'none'});
				$(this).removeClass('tab_textcolor2');
				$(this).addClass('tab_textcolor1');
				$tab.eq(0).find(' .tab_text').removeClass('tab_textcolor1');
				$tab.eq(0).find(' .tab_text').addClass('tab_textcolor2');
				$product_BEST.css({display:'none'});
				$product_NEW.css({display:'block'});
				$('#product').addClass('ActiveNew');
			});
		}
    });

	var $best_Item=$('.best_Item');
	$best_Item.each(function(index, element) {
        $(this).on('mouseover' ,function(){
			$(this).addClass('best_Itemover');
			$(this).find(' .best_Info').css({display:'none'});
			$(this).find(' .best_choice').css({display:'block'});

			var $best_button=$(this).find(' .best_button');
			$best_button.each(function(index, element) {
                $(this).on('mouseover' ,function(){
					$(this).addClass('best_buttonChoice');
					$(this).find(' .best_buttonCBG').css({display:'block'});
				});
            });
			var $best_button=$(this).find(' .best_button');
			$best_button.each(function(index, element) {
                $(this).on('mouseleave' ,function(){
					$(this).removeClass('best_buttonChoice');
					$(this).find(' .best_buttonCBG').css({display:'none'});
				});
            });

		});
    });
	$best_Item.each(function(index, element) {
        $(this).on('mouseleave' ,function(){
			$(this).removeClass('best_Itemover');
			$(this).find(' .best_Info').css({display:'block'});
			$(this).find(' .best_choice').css({display:'none'});
		});
    });


	var $special_timer=$('.special_timer');

	var $special_timerT=$('.special_timerT');
	$special_timerT.each(function(index) {
		$(this).css({left:index*105+'px'});
    });


	//
	//슬라이드 제어부
	//
	
	$('#key-container').each(function(index, element) {
		
		
		var $key_Box = $('.key-Box'); // 전체 슬라이드 무브박스
		
		var $Slide_Box = $('.Slide_Box '); // 각 페이지 
		var Slide_Box_Length =  $Slide_Box.length; // 페이지 갯수
		var pageSpeed = 10000 ; // 페이지 스피드
		
		var $controler = $('.control'); // 컨트롤러
		
		var $key_Item = $('.Slide_Box:nth-child(1) .key-Item'); // 첫번째 슬라이드 아이템
		var $key_Item2 =$('.Slide_Box:nth-child(2) .key-Item');// 두번째 슬라이드 아이템
		var $key_Item3 =$('.Slide_Box:nth-child(3) .key-Item');// 세번째 슬라이드 아이템
		var Interval = ""; // 인터벌 선언
		
		var $Key_Itemturn = $('.Slide_BoxR .key-Item:nth-child(2)');
		var $Key_text2 = $('.Slide_Box:nth-child(2) .KeyText'); // 두번째 슬라이드 텍스트
		var $Key_text3 = $('.Slide_Box:nth-child(3) .KeyText'); // 세번째 슬라이드 텍스트
		
		var Firstbool = true;
		
		var CurrentIndex = 1 ;
		
		// 1페이지 제어
		function GoFirstFrame(){
			var SlideSpeed = 1000;
			$key_Item.each(function(index, element) {
				$(this)	.find(' .key-Bg').removeClass('key-Active');
				var crrentindex = Math.abs(index-$key_Item.length);
				if(index>0){
	    	    	$(this).delay(crrentindex*1500).animate({opacity:0},1000);
				}
		    });
		};
		function StopFirstFrame(){
			$key_Item.find(' .key-Bg').addClass('key-Active');
			$key_Item.stop(true);
			$key_Item.css({opacity:1});
		};
		
		function PlayFrame1(){
			$Key_Itemturn.delay(1500).animate({opacity:0},1000);
		};
		function NextFrame1(){
			$Key_Itemturn.delay(500).animate({opacity:1},500);
		};
		
		
		function goFrame2(){
			$key_Item2.find(' .key-Bg').removeClass('key-Active2');
			var indexTo = 0 ;
			var Gotext = setInterval(function(){
					if(indexTo<$Key_text2.length+1){
						if(indexTo==$Key_text2.length){
							$('.Slide_Box:nth-child(2) .KeyBtn').removeClass('SildeBtnActive');
						}
						else{
							$Key_text2.eq(indexTo).removeClass('SildeTextActive');
						}
						indexTo++;
						console.log("실행중");
					}
					else{
						clearInterval(Gotext);						
						console.log("실행ㄴㄴ");
					}
					
				},500)
		}
		function StopFrame2(){
			$key_Item2.find(' .key-Bg').addClass('key-Active2');
			$('.Slide_Box:nth-child(2) .KeyBtn').addClass('SildeBtnActive');
			$Key_text2.addClass('SildeTextActive');
		}
		
		function goFrame3(){
			$key_Item3.find(' .key-Bg').removeClass('key-Active2');
			var indexTo = $Key_text3.length;
			var Gotext = setInterval(function(){
					if(indexTo>-2){
						if(indexTo==-1){
							$('.Slide_Box:nth-child(3) .KeyBtn').removeClass('SildeBtnActive');
						}
						else{
							$Key_text3.eq(indexTo).removeClass('SildeTextActive2');
						}
						indexTo--;
						console.log("실행중");
					}
					else{
						clearInterval(Gotext);						
						console.log("실행ㄴㄴ");
					}
					
				},500)
		};
		
		function StopFrame3(){
			$key_Item3.find(' .key-Bg').addClass('key-Active2');
			$Key_text3.addClass('SildeTextActive2');
			$('.Slide_Box:nth-child(3) .KeyBtn').addClass('SildeBtnActive');
		}
		
		//셋인터벌
		function goToSlide(){
			Interval= setInterval(function(){
				pageSpeed=5500;
				$controler.removeClass('controlActive');
				$controler.eq(CurrentIndex).addClass('controlActive');
				MoveSlide();
				console.log(pageSpeed);
				},pageSpeed);
		};
		
		// 슬라이드 
		function MoveSlide(){
			$key_Box.animate({left:-CurrentIndex*100+'%'},800);
			switch(CurrentIndex){
				case 0:	{
					if(Firstbool){
						GoFirstFrame();
					}
					else{
						PlayFrame1();
					}
					 StopFrame2();StopFrame3(); break;
				}
				case 1:{
					if(Firstbool){
						clearInterval(Interval);
						goToSlide();
						Firstbool=false;
					}
					else{
						NextFrame1();
					}
					 goFrame2();
					 StopFrame3();
					 break;
				}
				case 2:{
					if(Firstbool){
						clearInterval(Interval);
						goToSlide();	
						Firstbool=false;					
					}
					else{
						NextFrame1();
					}
					StopFrame2();
					goFrame3();
					 break;
				}
			};
				
			if(CurrentIndex<Slide_Box_Length-1){
				CurrentIndex++;					
			}
			else{
				CurrentIndex = 0 ;
			}
		};
		
		// 컨트롤러제어 
		$controler.each(function(index, element) {
			$(this).on('click',function(){
				$controler.removeClass('controlActive');
	            $(this).addClass('controlActive');
				CurrentIndex= index;
				MoveSlide();
				clearInterval(Interval);
				goToSlide();
			});
        });
		GoFirstFrame();
		goToSlide();
		StopFrame2();
		StopFrame3();
	
        
    });



	// 시간제어 박스

	function EventTime(){

		var Eventdate = new Date('2017/06/22 23:59:59'); // 이벤트 만료일

		var date = new Date();
		var calDate = ( Eventdate.getTime() - date.getTime()) / (1000*60*60*24);

		Eventdate.setHours(
			Eventdate.getHours()-date.getHours(),
			Eventdate.getMinutes()-date.getMinutes(),
			Eventdate.getSeconds()-date.getSeconds(),0);

		Eventdate.setMonth(
			Eventdate.getMonth()-date.getMonth(),
			Eventdate.getDate()-date.getDate());


		var TimeFormet =parseInt(calDate)
			+" : "+Eventdate.getHours()
			+" : "+Eventdate.getMinutes()
			+" : "+Eventdate.getSeconds();

		console.log(TimeFormet);
		return TimeFormet;

	}
	setInterval(function(){
		$('.special_timer').html(EventTime());
		},1000);


	function initialize() {
		var mapProp = {
		    center:new google.maps.LatLng(37.497086, 127.027380),
	    	zoom:16,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			 scrollwheel: false,

    zoomControl: true,
    zoomControlOptions: {
        position: google.maps.ControlPosition.RIGHT_TOP
    }
		};
	  	var map=new google.maps.Map(document.getElementById("map"),mapProp);

		var marker = new google.maps.Marker({
		    position: new google.maps.LatLng(37.497086, 127.027380),
	    	title:"Hello World!"
		});
		marker.setMap(map);
	}
	//google.maps.event.addDomListener(window, 'load', initialize);
});
