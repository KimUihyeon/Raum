<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage3-product-ordering1.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage3-product-ordering1.js"></script>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%
	String no = request.getParameter("no");
	String qty = request.getParameter("qty");

	String Name = request.getParameter("Cl_name");
	String add1 = request.getParameter("Cl_add1");
	String add2 = request.getParameter("Cl_add2");
	String add3 = request.getParameter("Cl_add3");
	String tel1 = request.getParameter("Cl_tel1");
	String tel2 = request.getParameter("Cl_tel2");
	String tel3 = request.getParameter("Cl_tel3");
	String Message = request.getParameter("Cl_Message");
	String point = request.getParameter("point");
	String Order_point = request.getParameter("Order_point");
	String card = request.getParameter("paymentWay");
	String Price = request.getParameter("Price");
	String id = request.getParameter("id");

	String _PATH =  "Ajax_AddOrder.jsp?ment="+Message+"&name="+Name+"&no="+no+"&qty="+qty+"&add1="+add1+"&add2="+add2+"&add3="+add3+"&tel1="+tel1+"&tel2="+tel2+"&tel3="+tel3+"&point="+point+"&point2="+Order_point+"&id="+id+"&paymentWay="+card+"&Price="+Price;
	if(Name==null){
		response.sendRedirect("11_mypage3-product-ordering1.jsp");
	}
	else{
	}
%>

<script>
//	alert("<%=_PATH%>");
</script>


<style>
	.paymentLodingBox , #buttonsOn{
		display:block;
	}
</style>

  <script>
  var IMP = window.IMP; // 생략가능
  IMP.init('imp05800912'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

  IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 1000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '이예린',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://dkrnl1318.cafe24.com/Raum_1/11_mypage3-product-ordering2'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
		
//		alert("<%=_PATH%>");
		var Path = "<%=_PATH%>";

				location.href="<%=_PATH%>";
		
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
		location.href="11_mypage3-product-ordering1.jsp";
	    alert(msg);
    }
	
    //alert(msg);
});
  </script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
	<div id="buttonsOn">
    	<div class="buttonsOnBG">
        </div>
        
        <div class="findPostNumberBox">
        	<div class="PopUpTitle">우편번호 검색
            </div>
            <div class="PopUpInfo">
            	<div class="PopUpInfoCenter">
                	<div class="tapBox">
                    	<div class="tap1">새 우편번호
                        </div>
                        <div class="tap2">구) 우편번호
                        </div>
                    </div>
                    
                    <div class="PopUpInfoBox1">
                    	<div class="infoName">지번/도로명
                    	</div>
                        
                        <div class="addressSearchBox">
                        	<input type="text" class="addressSearch">
                            <div class="addressInBoxMent">도로명+건물번호(예:강남대로 465) | 읍/면/동/리 + 지번(예:고잔동 676)
                            </div>
                        </div>
                    </div>
                    
                    <div class="PopUpInfoBox2">
                    	<div class="addressNoItem">
                        	<div class="addressCover">
                        		<div class="roadNameAddress">
                                	<div class="tagCover">
                                		<div class="roadNameTag">도로명
                                    	</div>
                                    </div>
                                    <div class="address">경기도 안산시 단원구 광덕동로26(고잔동) 고잔1차 푸르지오아파트
                                    </div>
                            	</div>
                                
                            	<div class="areaNumberAddress">
                                	<div class="tagCover">
                                		<div class="areaNumberTag">지번
                                    	</div>
                                    </div>
                                    <div class="address">경기도 안산시 단원구 고잔동 781 고잔1차 푸르지오아파트
                                    </div>
                            	</div>
                            </div>
                            <div class="addressNumber">15483
                            </div>
                        </div>
                    </div>
                    
                    <div class="PopUpInfoBox3">찾으실 지번주소 혹은 도로명주소를 검색해 주세요
                    </div>
                
                </div>
            </div>
            <div class="PopUpCloseBox">
            	<input type="button" class="PopUpCloseB" value="X">
                <div class="PopUp_logo">
                </div>
            </div>
        </div>
        
    	<div class="paymentLodingBox">
        	<div class="lodingImage">
            </div>
            <div class="lodingMent">결제가 진행중입니다.<br>현제창을 새로고침, 닫기, 페이지이동을 하는경우 결제창은 자동으로 종료됩니다.
            </div>
        </div>
    </div>

    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Product Order
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 장바구니
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section_Center">
        	<div class="selectBox">
            	<select id="mypageSelect">
                	<option value="mypageCenter">마이페이지</option>
                	<option value="profile">개인정보수정</option>
                    <option value="order">주문내역</option>
                    <option value="cart">장바구니</option>
                    <option value="wishlist">관심상품</option>
                    <option value="contanct">의뢰내역</option>
                    <option value="inquiry">문의내역</option>
                    <option value="AS">A/S신청내역</option>
                    <option value="review">상품후기</option>
                </select>
                <input type="button" class="moveButton" value="이동">
            </div>
            
            <div class="boxTitle">주문리스트
            </div>
            <div class="section1_box1">
            	<div class="boxline">
                	<div class="infoName">상품번호
                    </div>
                    <div class="infoName">상품정보
                    </div>
                    <div class="infoName">판매가격
                    </div>
                    <div class="infoName">수량
                    </div>
                    <div class="infoName">주문금액
                    </div>
                </div>
                
                <div class="orderItem">
                	<div class="itemNumber">p-0003
                    </div>
                    <div class="itemInfoBox">
                    	<div class="itemImage">
                        </div>
                        <div class="itemInfoText">[단일상품]<br>심플원목 테이블 / 책상
                        </div>
                    </div>
                    <div class="itemPrice">129,000원
                    </div>
                    <div class="itemCount">1
                    </div>
                    <div class="itemOrderPrice">
                    </div>
                </div>
                
                <div class="orderItem">
                	<div class="itemNumber">p-0003
                    </div>
                    <div class="itemInfoBox">
                    	<div class="itemImage">
                        </div>
                        <div class="itemInfoText">[단일상품]<br>심플원목 테이블 / 책상
                        </div>
                    </div>
                    <div class="itemPrice">129,000원
                    </div>
                    <div class="itemCount">1
                    </div>
                    <div class="itemOrderPrice">
                    </div>
                </div>
            </div>
            
            <div class="section1_box2">
            	<div class="section1_box2_1">
                	<div class="box4_title">총 주문 금액
                    </div>
                    
                    <div class="boxlineCover">
                    	<div class="boxline">
                    		<div class="priceName">상품 총 금액
                        	</div>
                        	<div class="totalPrice">258,000원
                        	</div>
                    	</div>
                    	<div class="boxline">
                    		<div class="priceName">배송비
                        	</div>
                        	<div class="deliveryPrice">0원
                        	</div>
                    	</div>
                    </div>
                </div>
                
                <div class="section1_box2_2">
                	<div class="saveMileage">(적립 마일리지 1290p)
                    </div>
                    <div class="section1_box2_2Text">결제예정 금액
                    </div>
                    <div class="totalPrice">258,000원
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">주문고객 정보
            </div>
            <div class="section1_box3">
            	<div class="boxline">
                	<div class="infoName">주문자
                    </div>
                    <div class="customerName">이예린
                    </div>
                    
                    <div class="infoName">이메일주소
                    </div>
                    <div class="customerEmail">ecopark3@naver.com
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">주소
                    </div>
                    <div class="customerAddress">
                    	<div class="customerAddressNumber">15483
                    	</div>
                    	<div class="customerAddress1">경기도 안산시 단원구 광덕동로 26 
                    	</div>
                    	<div class="customerAddress2">107동 1303호
                    	</div>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">연락처
                    </div>
                    <div class="customerPhone">010-3673-8931
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">배송자 정보
            	<div class="box4_radioBox">
                	<input id="same" name="recieverInfoChk" type="radio" checked="checked">
                	<div class="same">주문고객 정보와 동일</div>
                	<input id="new" name="recieverInfoChk" type="radio">
                	<div class="new">새로운 배송지</div>
                </div>
            </div>
            <div class="section1_box4">
            	<div class="boxline">
                	<div class="infoName">수취인
                    </div>
                    <div class="infoCover">
                    	<input class="recieverName">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">주소
                    </div>
                    <div class="infoCover">
                    	<div class="adressNumber">
                    		<input class="recieverAddressNumber">
                			<input type="button" class="section1_postNumberB" value="우편번호찾기">
                        </div>
                    	<input class="recieverAddress1">
                        <input class="recieverAddress2">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">휴대폰 번호
                    </div>
                    <div class="infoCover">
                    	<input class="recieverPhone1">
                        <div class="dat">-</div>
                        <input class="recieverPhone2">
                        <div class="dat">-</div>
                        <input class="recieverPhone3">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">배송메세지
                    </div>
                    <div class="infoCover">
                    	<input class="deliveryMessage">
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">결제 금액
            </div>
            <div class="section1_box5">
            	<div class="boxline">
                	<div class="infoName">총 주문 금액
                    </div>
                    <div class="infoName">마일리지
                    </div>
                    <div class="infoName">결제 예정 금액
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="totalPrice">258,000원
                    </div>
                    <div class="useMileage">-3000원
                    </div>
                    <div class="paymentPrice">=255,000원
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="section1_box5-1">마일리지
                    </div>
                    <div class="section1_box5-2">
                    	<div class="box5-2_mileageBox">
                        	<input type="text" class="mileageInput">
                            <div class="mileageBoxText">p (총 사용가능 마일리지 :
                            </div>
                            <div class="mileage">3000p</div>
                            <div class="mileageBoxText">)
                            </div>
                        </div>
                        
                        <div class="box5-2Ment">
                        	<div class="clamp">>
                            </div>
                            <div class="box5-2MentText">마일리지는 최소 0p 이상일때 사용이 가능합니다.
                            </div>
                        </div>
                        
                        <div class="box5-2Ment">
                        	<div class="clamp">>
                            </div>
                            <div class="box5-2MentText">최대 사용금액은 제한이 없습니다.
                            </div>
                        </div>
                        
                        <div class="box5-2Ment">
                        	<div class="clamp">>
                            </div>
                            <div class="box5-2MentText">마일리지로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">결제 수단
            </div>
            <div class="section1_box6">
            	<div class="boxline">
                	<div class="paymentWayBox">
                    	<input type="radio" id="way0" name="paymentWay" checked="checked"><div class="paymentWay">신용카드</div>
                        <input type="radio" id="way1" name="paymentWay"><div class="paymentWay">실시간 계좌이체</div>
                        <input type="radio" id="way2" name="paymentWay"><div class="paymentWay">무통장 입금</div>
                        <input type="radio" id="way3" name="paymentWay"><div class="paymentWay">휴대폰 결제</div>
                       	<input type="radio" id="way4" name="paymentWay"><div class="paymentWay">카카오 페이</div>
                    </div>
                </div>
            </div>
            <div class="paymentWayMent">* 신용카드 / 실시간 계좌이체는 결제 후, 무통장 입금은 입금확인 후 배송이 이루어집니다.
            </div>
                
            
            <div class="section1Buttons">
            	<input type="button" class="beforeB" value="이전페이지">
                <input type="button" class="paymentB" value="결제하기">
            </div>
            
        </div>
    </section>
    
    <section id="putter">
    	<div class="putter_box">

        	<div class="putter_boxTop">
            	<div class="putter_logo">
                	<a href="00_index.jsp" class="a_box">
                    </a>
                </div>
            </div>

            <div class="putter_boxMid">
            	<div class="putter_icons">
                	<div class="twiter_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                	<div class="facebook_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                	<div class="insta_icon">
                    	<a href="#" class="a_box">
                        </a>
                    </div>
                </div>
            </div>

            <div class="putter_boxBottom">
            	<div class="putter_info">ⓒ 2016 Raum. All rights reserved. Raum</h4>
                </div>
                <div class="putter_info">충청남도 천안시 서북구 성환읍 대학로 91</h4>
                </div>
            </div>

        </div>
    </section>
    
</div>
</body>
</html>
