
$(function(){
	
	
	
	
	/* 고정메뉴바 생성및 제어 */
	function FiexdMenu(){
		var Clone = $('.header_box').clone(true);
		$('#wrap').append("<div class=\"FiexdMenu FixedHeight\"></div>");
		$('.FiexdMenu').append("<div class=\"FiexdRelMenu RelWidth\"></div>");
		$('.FiexdRelMenu').append(Clone);
		
		
		$('.RelWidth').css({width:0+'%'});
		$('.FixedHeight').css({height:0+'%'});
		
		
		$('.FiexdMenu').css({position:'fixed',
								left: 0,
								top: 0,
								height: 70+'px',
								transition: 'all 1.0s',
								zIndex:9,
								width: 100+'%'});
								
		$('.FiexdRelMenu').css({width: 100+'%',
								height: 100+'%',
								position: 'relative',
								margin: "0 auto",
							    transition: 'all 1.0s',
								zIndex:9,
							    boxShadow:'-1px 1px 20px 0px #000000',
								width: 100+'%',background:' #fff'});
		$('.FiexdMenu .header_box').css({maxWidth:1600+'px'});
		$('.FiexdMenu  .header_logo').css({marginLeft:45+'px' , marginTop:15+'px'});
		$('.FiexdMenu  .header_icons').css({ marginTop:10+'px'});
		$('.FiexdMenu  .menu').css({margin:0,marginLeft:25+'%', paddingTop:15+'px'});
		$('.FiexdMenu  .submenu').css({top:55+'px'});
		$('.FiexdMenu').addClass('FiexdRelMenu');
	};
	
	function addMenu (){
		$('.FiexdMenu').removeClass('FixedHeight');
		$('.FiexdRelMenu').removeClass('RelWidth');
	}
	function removeMenu(){
		$('.FiexdMenu').addClass('FixedHeight');
		$('.FiexdRelMenu').addClass('RelWidth');
	}
	FiexdMenu();
	$('body').trigger('scroll');
	$(window).trigger('resize');
	$('body').on('mousewheel',function(e){
		var $crrentHTML = $(this).scrollTop();
		if($crrentHTML>600){
			addMenu();				
		}
		else{
			removeMenu();
		}
		
	});
	
	$(window).resize(function(e) {
        ResizeMenu();
    });
	ResizeMenu();
	
	function ResizeMenu(){
		var Winwidth=window.innerWidth;
		/*PC분류*/
		if(Winwidth>766){
			$('.FiexdMenu').removeClass('PC');
			$('#Amenu').addClass('Mobile');
		}
		/*모바일 C분류*/
		else{
			$('.FiexdMenu').addClass('PC');
			$('#Amenu').removeClass('Mobile');
		}
	}
	
	/*메뉴제어*/
	var $Amenu=$('#Amenu');
	var $Amenu_icon=$('.Amenu_icon');
	var $closeB=$('.closeB');

	$Amenu_icon.on('click' ,function(){
		$Amenu.css({display:'block'});
		$Amenu.find(' .Amenu_boxs').animate({right:0+"%"},500);
	});
	$closeB.on('click' ,function(){
		$Amenu.find(' .Amenu_boxs').animate({right:-60+"%"},500);
		$Amenu.css({display:'none'});
	});

	var $menu_item=$('#header .menu_item , .FiexdMenu .menu_item');
	$menu_item.each(function(index){
		$(this).find(' .submenu_item').each(function(index){
			$(this).css({top:(index-1)*40+'px',zIndex:Math.abs(index-5)}
			);
		});
	});


	$menu_item.each(function(index, element) {
		var index_inner=index;
		
		
        $(this).on('mouseover' ,function(){
			var $CrrnetObject = $(this);
			
			if(index_inner==0 || index_inner==4|| index_inner==5|| index_inner==9){
				$CrrnetObject.find(' .submenu').animate({height:'120px'},1);
			}
			else if(index_inner==1 || index_inner==6){
				$CrrnetObject.find(' .submenu').animate({height:'80px'},1);
			}
			else if(index_inner==2 || index_inner==7){
				$CrrnetObject.find(' .submenu').animate({height:'200px'},1);
			}
			$CrrnetObject.find(' .submenu_item').each(function(index){
				$(this).delay(index*200).animate({top:index*40+'px',opacity:1},200);
			})
			
		});
		
		/*
		if(index_inner==0||4){
        $(this).on('mouseover' ,function(){
			
			
					$(this).find(' .submenu').animate({height:'120px'},1);
					$(this).find(' .submenu_item').each(function(index){
						$(this).delay(index*200).animate({top:index*40+'px',opacity:1},200);
					})
					
		});
		}
		else if(index_inner==1){
        $(this).on('mouseover' ,function(){
			$(this).find(' .submenu').animate({height:'80px'},1);

			$(this).find(' .submenu_item').each(function(index){
				$(this).delay(index*200).animate({top:index*40+'px',opacity:1},200);
			})
		});
		}
		else if(index_inner==2){
        $(this).on('mouseover' ,function(){
			$(this).find(' .submenu').animate({height:'160px'},1);
			$(this).find(' .submenu_item').each(function(index){
				$(this).delay(index*200).animate({top:index*40+'px',opacity:1},200);
			})
		});
		}
		
		$(this).on('mouseenter',function(){
		});*/

    });
	
	function Menu(indexTo){
		
	}


	$menu_item.each(function(index, element) {
		var index_inner=index;
		if(index_inner==0||4||5||9){
        $(this).on('mouseleave' ,function(){
			$(this).find(' .submenu').animate({height:'0px'},1);
				$(this).find(' .submenu_item').each(function(index){
					$(this).stop(true).css({top:(index-1)*40+'px',zIndex:Math.abs(index-5),opacity:0});
				});
		});
		}
		else if(index_inner==1||6){
        $(this).on('mouseleave'  ,function(){
			$(this).find(' .submenu').animate({height:'0px'},1);
				$(this).find(' .submenu_item').each(function(index){
					$(this).stop(true).css({top:(index-1)*40+'px',zIndex:Math.abs(index-5),opacity:0});
				});
		});
		}
		else if(index_inner==2){
        $(this).on('mouseleave'  ,function(){
			$(this).find(' .submenu').animate({height:'0px'},1);
				$(this).find(' .submenu_item').each(function(index){
					$(this).stop(true).css({top:(index-1)*40+'px',zIndex:Math.abs(index-5),opacity:0});
				});
		});
		}
    });

	var $search_icon=$('.search_icon');
	var $search_window=$('.search_window');

	$search_icon.on('mouseover' ,function(){
		$search_window.stop(true).animate({width:'150px'},500);
		$search_window.css({display:'block'});
	});
	$search_icon.on('mouseleave' ,function(){
		var $search_input=$('.search_input');
		$search_input.val("");
		$search_window.stop(true).animate({width:'0px'},500);
		$search_window.css({display:'none'});
	});
	
	
});
