// JavaScript Document
$(function(){
	
	var $paymentB=$('.paymentB');
	var $buttonsOn=$('#buttonsOn');
	var $paymentLodingBox=$('.paymentLodingBox');
	var $lodingImage=$('.lodingImage');
	//결제하기누르면 나오는 로딩창나타나기
	$paymentB.on('click', function(){
		$buttonsOn.css({display:'block'});
		$paymentLodingBox.css({display:'block'});
		//$lodingImage.addClass('Active-on');
		//돌아가게만들어야한다
	});
	
	//우편번호찾는팝업창
	$('.addressSearch').val("");
	var $tap1=$('.tap1');
	var $tap2=$('.tap2');
	
	$tap1.addClass('tapOn');
	$('.tapBox1').css({display:'block'});
	$('.tapBox2').css({display:'none'});
	var $findPostNumberBox=$('.findPostNumberBox');
		
	$tap1.on('click', function(){
		$tap1.addClass('tapOn');
		$tap2.removeClass('tapOn');
		$('.addressSearch').val("");
		$('.PopUpInfoBox3').css({display:'block'});
		$('.PopUpInfoBox2').css({display:'none'});
		/*앤터쳤을때 검색되게만들어야함*/
	});
	$tap2.on('click', function(){
		$tap2.addClass('tapOn');
		$tap1.removeClass('tapOn');
		$('.addressSearch').val("");
		$('.PopUpInfoBox3').css({display:'block'});
		$('.PopUpInfoBox2').css({display:'none'});
		/*앤터쳤을때 검색되게만들어야함*/
	});
	/*
	//우편번호찾기버튼눌렀을때 우편찾기팝업창나옴
	var $section1_postNumberB=$('.section1_postNumberB');
	$section1_postNumberB.on('click', function(){
		$buttonsOn.css({display:'block'});
		$findPostNumberBox.css({display:'block'});
	});
	//닫기버튼눌렀을때 우편찾기팝업창없어짐
	var $PopUpCloseB=$('.PopUpCloseB');
	$PopUpCloseB.on('click', function(){
		$buttonsOn.css({display:'none'});
		$findPostNumberBox.css({display:'none'});
	});
	*/
	//로딩창,우편번호창 세로 가운대정렬
	function PopUpCenter(){
	var LodingBoxMarginT=($(window).height()-$('.paymentLodingBox').height())/2;
	var findPostNumberBoxMarginT=($(window).height()-$('.findPostNumberBox').height())/2;
	$paymentLodingBox.css({marginTop:LodingBoxMarginT+"px"});
	$findPostNumberBox.css({marginTop:findPostNumberBoxMarginT+"px"});
	}
	
	//아이탬늘어나면 전체 길이도늘어남
	var $section1=$('#section1');
	var $section1_box1=$('.section1_box1');
	var $orderItem=$('.orderItem');
	var orderItemNumber=$orderItem.length;
	
	var section1Height=0;
	var section1_box1Height=0;
	var itemListHeight=0;
		
	itemListHeight=orderItemNumber*120;
		
	section1_box1Height=60+itemListHeight;
	section1Height=2155+section1_box1Height;
	
	$section1.css({height:section1Height+""});
	$section1_box1.css({height:section1_box1Height+""});
	/*
	//천단위로컴마붙이기
	function numberWithComas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//컴마,원빼기
	function fn(str){
		var res;
		res = str.replace(/[^0-9]/g,"");
		return res;
	}*/
		/*
	var itemOrderPrice=new Array();
	$orderItem.each(function(index, element) {
      itemOrderPrice[index]=Number(fn($(this).find(' .itemPrice').html()))*Number($(this).find(' .itemCount').html());
	   $(this).find(' .itemOrderPrice').html(numberWithComas(itemOrderPrice[index])+"원");
    });
	
	var total=0;
	for(var p=0;p<$orderItem.length;p++){
	  total=itemOrderPrice[p]+total;
	}
	$('.totalPrice').html(numberWithComas(total)+"원");
	$('.saveMileage').html("(적립 마일리지 "+numberWithComas(parseInt(total/100))+"p)");
	
	if(total>300000){
		$('.deliveryPrice').html("0원");
		$('.section1_box2_2 .totalPrice').html(numberWithComas(total)+"원");
	}
	else if(total<300000){
		$('.deliveryPrice').html("8000원");
		$('.section1_box2_2 .totalPrice').html(numberWithComas(total+8000)+"원");
	}
	
	*/
	
	var $customerName=$('.customerName');
	var $customerAddressNumber=$('.customerAddressNumber');
	var $customerAddress1=$('.customerAddress1');
	var $customerAddress2=$('.customerAddress2');
	var $customerPhone=$('.customerPhone');
	
	var $recieverName=$('.recieverName');
	var $recieverAddressNumber=$('.recieverAddressNumber');
	var $recieverAddress1=$('.recieverAddress1');
	var $recieverAddress2=$('.recieverAddress2');
	var $recieverPhone1=$('.recieverPhone1');
	var $recieverPhone2=$('.recieverPhone2');
	var $recieverPhone3=$('.recieverPhone3');
	/*
	//나중에 살릴꺼
	
	function radioChk(){
	if( $('#same').is(":checked")){
		$recieverName.val($customerName.html());
		$recieverAddressNumber.val($customerAddressNumber.html());
		$recieverAddress1.val($customerAddress1.html());
		$recieverAddress2.val($customerAddress2.html());
		$recieverPhone1.val(phoneSplit[0]);
		$recieverPhone2.val(phoneSplit[1]);
		$recieverPhone3.val(phoneSplit[2]);
	}
	if( $('#new').is(":checked")){
		$recieverName.val("");
		$recieverAddressNumber.val("");
		$recieverAddress1.val("");
		$recieverAddress2.val("");
		$recieverPhone1.val("");
		$recieverPhone2.val("");
		$recieverPhone3.val("");
	}
	}
	
	radioChk();
	var $box4_radioBox=$('.box4_radioBox');
	$box4_radioBox.on('click', function(){
		radioChk();
	});*/
	
	/* 결제금액 부분 input에서 입력받은값에 따른 가격 마이너스의 변화,가지고있는마일리지보다 적게 사용하게
	var mileage=fn($('.mileage').html());
	var $mileageInput=$('.mileageInput');
	if(Number($mileageInput.value())> Number(mileage)){
       $mileageInput.value(""); 
       $mileageInput.focus();
	}
	$mileageInput.on('click', function(){
		$('.useMileage').html("-"+numberWithComas($mileageInput.value())+"원");
	});*/
	
	
	
	
	
	
	$(window).resize(function(){
		PopUpCenter();
	});
	
	$(window).trigger('resize');
	
	
	
	
	
});