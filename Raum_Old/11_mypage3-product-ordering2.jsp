<%@page contentType="text/html; charset=utf-8"%>
<%@ page language="java"  import="smson.SmsPost" %>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage3-product-ordering2.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage3-product-ordering2.js"></script>
<title>:: RAUM</title>
</head>

<body>
<%
	String id = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String name = "";
	String Clname = "";
	String tel ="";
	String tel2 ="";
	String mail = "";
	String add = "";
	String Message = "";
	String payment = "";
	String date = "";
	int price = 0;
	int ord_no = 0;
	String B_type = request.getParameter("type");
	int type= Integer.parseInt(B_type);

	Query = "SELECT * FROM Raum_Order , Raum_Member , Raum_Product WHERE Raum_Order.M_id ='"+id+"' AND B_type ="+type+" And Raum_Order.Prd_No = Raum_Product.Prd_No and Raum_Order.M_id = Raum_Member.M_id ";

//	Query = "SELECT * FROM Raum_Order WHERE M_id='"+id+"' and B_type="+type;
	PreparedStatement cursorHelper = con.prepareStatement(Query);
	ResultSet cursor = cursorHelper.executeQuery();

	
	cursor.last();
	int sessionLength = cursor.getRow();
	cursor.beforeFirst();

	if(sessionLength==0){
		response.sendRedirect("error_500.html");
	}
	else{
		while(cursor.next()){
			name = cursor.getString("M_name");
			Clname = cursor.getString("Cl_name");
			mail = cursor.getString("M_tel");
			tel = cursor.getString("Cl_phone");
			tel2 =cursor.getString("M_tel2");
			add = cursor.getString("Cl_add2") +" "+cursor.getString("Cl_add3") +" "+cursor.getString("Cl_add1");
			Message = cursor.getString("Cl_message");
			date = cursor.getString("B_date");
			price = cursor.getInt("B_price");
			ord_no = cursor.getInt("B_no");
			String paymentTemp = cursor.getString("B_paymentWay");
			if(paymentTemp.equals("cacao")){
				payment="카카오페이";
			}
			else if(paymentTemp.equals("phone")){
				payment="핸드폰 결제";
			}
			else if(paymentTemp.equals("bank1")){
				payment="무통장 입금";
			}
			else if(paymentTemp.equals("bank2")){
				payment="계좌이체";
			}
			else if(paymentTemp.equals("card")){
				payment="신용카드";
			}
			else{
				payment="카카오페이";
			}
		}
	}
%>

<div id="wrap">
	<jsp:include page="00_menu.jsp"/>
    
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
            
            <div class="section1_box1">
            	<div class="box1Ment">주문이 정상적으로 완료되었습니다.
                </div>
                <div class="box1Info">
                	<div class="box1-infoName">[주문번호]
                    </div>
					<%String[] noTemp = date.split("-");
					String ordNo_S= "";
					for(int i=0; i<2 ; i++){
						ordNo_S+= noTemp[i];
					}
					if(ord_no<10){
						ordNo_S += "000"+ord_no;
					}
					else if(ord_no<100){
						ordNo_S += "00"+ord_no;
					}
					else if(ord_no<1000){
						ordNo_S += "0"+ord_no;
					}
					else{
						ordNo_S += ord_no;
					}
					%>

                    <div class="orderNumber"><%=ordNo_S%>
                    </div>
                    
                    <div class="orderDate"><%=date%>
                    </div>
                    <div class="box1-infoName">[주문일시]
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">결제정보
            </div>
            <div class="section1_box2">
            	<div class="boxline">
                	<div class="infoName">결제방법
                    </div>
                    <div class="paymentWay"><%=payment%>
                    </div>
                    
                    <div class="infoName">결제일시
                    </div>
                    <div class="paymentDate"><%=date%>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">결제금액
                    </div>
                    <div class="paymentPrice">&#8361 <%=price%>.00
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">주문리스트
            </div>
            <div class="section1_box3">
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

					int ItemPrice = 0;
					int ItemQty = 0;
					int ItemNoTemp = 0;
					int ItemtotalPrice= 0;
					String ItemType ="";

					cursor.beforeFirst();

					if(sessionLength==0){
						response.sendRedirect("error_500.html");
					}
					else{
						while(cursor.next()){
							String ItemNo = "A17-";
							String ItemName = "";
							ItemPrice = (int)((double)cursor.getInt("Prd_price")-(double)(cursor.getInt("Prd_price")/10));
							ItemQty = cursor.getInt("B_qty");
							ItemNoTemp = cursor.getInt("Prd_no");
							String ItemFileName = cursor.getString("Prd_Name");
							ItemType = cursor.getString("Prd_type");

							String[] ItemNameTemp = cursor.getString("Prd_title").split("<br>");
							for(int i = 0 ; i<ItemNameTemp.length ; i++){					
								ItemName += ItemNameTemp[i]+" ";
							}
							if(ItemNoTemp<10){
								ItemNo=ItemNo + "00"+ItemNoTemp;
							}
							else if(ItemNoTemp<100){
								ItemNo=ItemNo + "0"+ItemNoTemp;
							}
							else{
								ItemNo=ItemNo + ItemNoTemp;
							}

							ItemtotalPrice = ItemPrice * ItemQty;

						%>

                <div class="orderItem">
                	<div class="itemNumber"><%=ItemNo%>
                    </div>
                    <div class="itemInfoBox">
                    	<div class="itemImage" style="background:url(Asset/01_img/03_Object_Upload/<%=ItemFileName%>.jpg) center center no-repeat; background-size:cover">
                        </div>
                        <div class="itemInfoText">[<%=ItemType%>]<br><%=ItemName%>
                        </div>
                    </div>
                    <div class="itemPrice">&#8361 <%=ItemPrice%>.00
                    </div>
                    <div class="itemCount"><%=ItemQty%>
                    </div>
                    <div class="itemOrderPrice">&#8361 <%=ItemtotalPrice%>.00
                    </div>
                </div>

						<%
						}
					}

				%>
            </div>
            
            <div class="section1_box4">
            	<div class="section1_box4_1">
                	<div class="box4_title">총 주문 금액
                    </div>
                    
                    <div class="boxlineCover">
                    	<div class="boxline">
                    		<div class="priceName">상품 총 금액
                        	</div>
                        	<div class="totalPrice"><%=price%>.00 천원
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
				<%double Point =((double)price/10);%>
                
                <div class="section1_box4_2">
                	<div class="mileage">(적립 마일리지 <%=Point%>p)
                    </div>
                    <div class="section1_box4_2Text">결제예정 금액
                    </div>
                    <div class="totalPrice"><%=price%>.25 천원
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">주문고객 정보 확인
            </div>
            <div class="section1_box5">
            	<div class="boxline">
                	<div class="infoName">주문자
                    </div>
                    <div class="customerName"><%=name%>
                    </div>
                    
                    <div class="infoName">이메일주소
                    </div>
                    <div class="customerEmail"><%=mail%>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">연락처
                    </div>
                    <div class="customerPhone"><%=tel2%>
                    </div>
                </div>
            </div>
            
            <div class="boxTitle">배송지 정보 확인
            </div>
            <div class="section1_box6">
            	<div class="boxline">
                	<div class="infoName">수취인
                    </div>
                    <div class="recieverName"><%=Clname%>
                    </div>
                    
                    <div class="infoName">연락처
                    </div>
                    <div class="recieverPhone"><%=tel%>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">주소
                    </div>
                    <div class="recieverAddress"><%=add%>
                    </div>
                </div>
                
                <div class="boxline">
                	<div class="infoName">배송메세지
                    </div>
                    <div class="deliveryMessage"><%=Message%>
                    </div>
                </div>
            </div>
            
            <div class="section1Buttons">
            	<input type="button" class="orderSearchB" value="주문/배송조회" onClick="go1('11_mypage2-order-1.jsp')">
                <input type="button" class="shoppingB" value="쇼핑 계속하기" onClick="go1('03_object-calender.jsp?type=1&listQty=8&page=1&align=new')">
            </div>
            <script>
				function go1(page){
					var aa=page;
					location.href=aa;
				}
			</script>
            
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

<%/*

String userid = "dkrnl1318";	// 문자온 아이디
String SMStype = "sms";	// 타입설정  - 90byte 이하 sms     91byte 이상 mms
String phone = "01055519801";	// 받는사람 번호  - (여러건 보낼때 "01022222222|01033333333|01055555555")
String msg = "테스트";		// 메시지내용
String callback = "01039943913";	// 문자보내는사람 전화번호
String names = "홍길동";	// 이름 ※ 치환문자 {name} -> 이름과치환
//mms

SmsPost sp = new SmsPost();

//sms
String result = sp.sendMsg(userid, phone, msg, callback, "", names, SMStype);
%>

<script>
	alert(<%=result%>);
</script>
<%
*/
%>


</body>
</html>