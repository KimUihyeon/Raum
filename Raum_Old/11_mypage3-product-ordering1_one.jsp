<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
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
<script src="Asset/00_Script/Mypage3-product-ordering1.js?var=1"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    <%
		String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
		String ItemNoParameter = request.getParameter("no");
		String _path = "11_mypage3-product-ordering1-1.jsp?";
	%>
	<div id="buttonsOn">
    	<div class="buttonsOnBG">
        </div>
        
        <div class="findPostNumberBox">
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
				
                <%	
					Query = "select * from Raum_Cart , Raum_Product where Raum_Cart.Prd_no = Raum_Product.Prd_no and M_id='"+currentLogin+"' and Raum_Cart.Prd_no="+ItemNoParameter+" ORDER BY Cart_no desc";
					PreparedStatement cousorHelper = con.prepareStatement(Query);
					ResultSet cursor = cousorHelper.executeQuery();
					String _path_ITEM ="no=";
					String _path_ITEMQTY ="qty=";

					int price =0;
					int point =0;
					int salePrice =0;
					int qty =0;
					int totalPrice = 0;
					int filalPrice = 0;
					double Order_point = 0 ; 
					String ItemNo ="";
					String ItemTitle= "";
					String FileName = "";
					while(cursor.next()){
						int no = cursor.getInt("Prd_no");
						qty = cursor.getInt("Cart_qty");
						_path_ITEM +=no+",";
						_path_ITEMQTY += qty+",";
						if(no<10){
							ItemNo = "A17-00"+no;
						}
						else if(no<100){						
							ItemNo = "A17-0"+no;
						}
						else{
							ItemNo = "A17-"+no;
						}

						String[] Temp = cursor.getString("Prd_title").split("<br>");
						ItemTitle = Temp[0]+" "+Temp[1];

						price = cursor.getInt("Prd_price");
						salePrice = (int)((double)price - ((double)price/10));


						FileName = cursor.getString("Prd_name");
						totalPrice = qty *salePrice;
						filalPrice += totalPrice;
						%>
						
                <div class="orderItem">
                	<div class="itemNumber"><%=ItemNo%>
                    </div>
                    <div class="itemInfoBox">
                    	<div class="itemImage" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat; background-size:cover">
                        </div>
                        <div class="itemInfoText">[단일상품]<br><%=ItemTitle%>
                        </div>
                    </div>
                    <div class="itemPrice">&#8361 <%=salePrice%>.00
                    </div>
                    <div class="itemCount"><%=qty%>
                    </div>
                    <div class="itemOrderPrice">&#8361 <%=totalPrice%>.00
                    </div>
                </div>

						<%

					}
					Order_point = ((double)filalPrice /10);
				%>
			</div>
                
            
            <div class="section1_box2">
            	<div class="section1_box2_1">
                	<div class="box4_title">총 주문 금액
                    </div>
                    
                    <div class="boxlineCover">
                    	<div class="boxline">
                    		<div class="priceName">상품 총 금액
                        	</div>
                        	<div class="totalPrice"><%=filalPrice%>.00 천원
                        	</div>
                    	</div>
                    	<div class="boxline">
                    		<div class="priceName">배송비
                        	</div>
                        	<div class="deliveryPrice">0.25 천원
                        	</div>
                    	</div>
                    </div>
                </div>
                
                <div class="section1_box2_2">
                	<div class="saveMileage">(적립 마일리지 <%=Order_point%>p)
                    </div>
                    <div class="section1_box2_2Text">결제예정 금액
                    </div>
                    <div class="totalPrice"><%=filalPrice%>.25 천
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">주문고객 정보
            </div>
			<%_path +=_path_ITEM+"&"+_path_ITEMQTY+"&price="+filalPrice+"&Order_point="+Order_point+"&id="+currentLogin+"&Price="+filalPrice;%>
            <form action="<%=_path%>" name="fomr1" method="post">
            <div class="section1_box3">
			
                <%	
					String Query2 = "select * from Raum_Member where M_id='"+currentLogin+"'";
					PreparedStatement cousorHelper2 = con.prepareStatement(Query2);
					ResultSet cursor2 = cousorHelper2.executeQuery();

					String ID_Name= "";
					String ID_Mail="";
					String ID_Add1="";
					String ID_Add2="";
					String ID_Add3="";
					String ID_Tel="";
					double ID_Point = 0;
					while(cursor2.next()){
						ID_Name=cursor2.getString("M_name");
						ID_Mail=cursor2.getString("M_tel");
						ID_Add1=cursor2.getString("M_address1");
						ID_Add2=cursor2.getString("M_address2");
						ID_Add3=cursor2.getString("M_address3");
						ID_Tel=cursor2.getString("M_tel2");
						ID_Point = cursor2.getDouble("M_point");

					}

				%>
            	<div class="boxline">
                	<div class="infoName">주문자
                    </div>
                    <div class="customerName"><%=ID_Name%>
                    </div>
                    
                    <div class="infoName">이메일주소
                    </div>
                    <div class="customerEmail"><%=ID_Mail%>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">주소
                    </div>
                    <div class="customerAddress">
                    	<div class="customerAddressNumber"><%=ID_Add1%>
                    	</div>
                    	<div class="customerAddress1"><%=ID_Add2%>
                    	</div>
                    	<div class="customerAddress2"><%=ID_Add3%>
                    	</div>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">연락처
                    </div>
                    <div class="customerPhone"><%=ID_Tel%>
                    </div>
                </div>
            </div>
			<script>
			
$(function(){
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
	
	
	function radioChk(){
	if( $('#same').is(":checked")){
		var telTemp = "<%=ID_Tel%>";	
		var tel =new Array();
		tel = telTemp.split("-");

		$recieverName.val("<%=ID_Name%>");
		$recieverAddressNumber.val("<%=ID_Add1%>");
		$recieverAddress1.val("<%=ID_Add2%>");
		$recieverAddress2.val("<%=ID_Add3%>");
		$recieverPhone1.val(""+tel[0]);
		$recieverPhone2.val(""+tel[1]);
		$recieverPhone3.val(""+tel[2]);
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
	});
});
	</script>
            
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
                    	<input class="recieverName" name="Cl_name">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">주소
                    </div>
                    <div class="infoCover">
                    	<div class="adressNumber">
                    		<input class="recieverAddressNumber" name="Cl_add1">
                			<input type="button" class="section1_postNumberB" value="우편번호찾기" >
                        </div>
                    	<input class="recieverAddress1" name="Cl_add2">
                        <input class="recieverAddress2" name="Cl_add3">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">휴대폰 번호
                    </div>
                    <div class="infoCover">
                    	<input class="recieverPhone1" name="Cl_tel1">
                        <div class="dat">-</div>
                        <input class="recieverPhone2" name="Cl_tel2">
                        <div class="dat">-</div>
                        <input class="recieverPhone3" name="Cl_tel3">
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">배송메세지
                    </div>
                    <div class="infoCover">
                    	<input class="deliveryMessage" name="Cl_Message">
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
                	<div class="totalPrice">&#8361 <%=filalPrice%>.25
                    </div>
                    <div class="useMileage">-<%=ID_Point%>p
                    </div>
                    <div class="paymentPrice">=255,000원
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="section1_box5-1">마일리지
                    </div>
                    <div class="section1_box5-2">
                    	<div class="box5-2_mileageBox">
                        	<input type="text" id="mileageInput" class="mileageInput" nkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'  name="point" value="0">
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
            
	<script>
		function onlyNumber(event){

			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
			console.log($('.mileageInput').val());
				return;
			}
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script>
            <div class="boxTitle">결제 수단
            </div>
            <div class="section1_box6">
            	<div class="boxline">
                	<div class="paymentWayBox">
                    	<input type="radio" id="way0" name="paymentWay" value="card"><div class="paymentWay">신용카드</div>
                        <input type="radio" id="way1" name="paymentWay" value="bank1"><div class="paymentWay">실시간 계좌이체</div>
                        <input type="radio" id="way2" name="paymentWay" value="bank2"><div class="paymentWay">무통장 입금</div>
                        <input type="radio" id="way3" name="paymentWay" value="phone"><div class="paymentWay">휴대폰 결제</div>
                       	<input type="radio" id="way4" name="paymentWay"  checked="checked" value="cacao"><div class="paymentWay">카카오 페이</div>
                    </div>
                </div>
            </div>
            <div class="paymentWayMent">* 신용카드 / 실시간 계좌이체는 결제 후, 무통장 입금은 입금확인 후 배송이 이루어집니다.
            </div>
                
            
            <div class="section1Buttons">
            	<input type="button" class="beforeB" value="이전페이지">
                <input type="submit" class="paymentB" value="결제하기">
            </div>
            </form>
            
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
