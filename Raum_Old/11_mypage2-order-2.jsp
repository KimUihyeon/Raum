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
<link rel="stylesheet" href="Asset/00_Css/Mypage2-order-2.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>

<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Order
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 주문내역
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
            
            <%
			
				String id = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
				String type = request.getParameter("type");
				Query = "SELECT * FROM Raum_Order , Raum_Member , Raum_Product WHERE Raum_Order.M_id ='"+id+"' AND B_type ="+type+" And Raum_Order.Prd_No = Raum_Product.Prd_No and Raum_Order.M_id = Raum_Member.M_id ";
				
				PreparedStatement cursorHelper = con.prepareStatement(Query);
				ResultSet cursor = cursorHelper.executeQuery();
				
	
				cursor.last();
				int sessionLength = cursor.getRow();
				cursor.beforeFirst();


			%>
            <div class="tableBox">
            	<table class="table1">
                	<tr>
                    	<td>상품번호
                        </td>
                    	<td>주문일
                        </td>
                    	<td>주문상품
                        </td>
                    	<td>구매금액
                        </td>
                    	<td>주문수량
                        </td>
                    	<td>소계합계
                        </td>
                    	<td>주문상태
                        </td>
                    </tr>
            <%
				String date = "";
				String mail= "";
				String name= "";
				String ClName ="";
				String Cltel= "";
				String Clmessage = "";
				String add = "";
				String ITEM_no= "P-";
				String paymentTemp = "";
				String payment= "";
				int TotalPrice = 0;
				int TotalQTY = 0 ;
				if(sessionLength==0){
					response.sendRedirect("error_500.html");
					%>
					
                	<tr class="tableNoItem">
                    	<td colspan="5">주문하신 상품이 존재하지 않습니다.
                        </td>
                    </tr>
					<%
				}

				else{
					while(cursor.next()){
						ITEM_no= "A17-";
						date = cursor.getString("B_date");
						String ITEM_TYPE = cursor.getString("Prd_type");
						String[] ITEM_TITLE_TEMP = cursor.getString("Prd_title").split("<br>");
						String ITEM_TITEL = ITEM_TITLE_TEMP[0] + " " + ITEM_TITLE_TEMP[1];
						String dil = cursor.getString("B_dil");

						int price = (int)((double)cursor.getInt("Prd_price")-((double)cursor.getInt("Prd_price")/10));
						int qty = cursor.getInt("B_qty");
						int total = price* qty;
						TotalPrice = cursor.getInt("B_price");
						TotalQTY += qty;
						int no = cursor.getInt("Prd_no");

						if(no<10){
							ITEM_no=ITEM_no+"00"+no;
						}
						else if(no<100){
							ITEM_no=ITEM_no+"0"+no;
						}
						else{
							ITEM_no=ITEM_no+no;
						}

						mail= cursor.getString("M_tel");
						name= cursor.getString("M_name");
						Cltel = cursor.getString("Cl_phone");
						paymentTemp = cursor.getString("B_paymentWay");
						ClName = cursor.getString("Cl_Name");
						Clmessage	=cursor.getString("Cl_message");
						add = cursor.getString("Cl_add2") + " " + cursor.getString("Cl_add3") +" " + cursor.getString("Cl_add1") ;

						%>
						
                	<tr>
                    	<td><%=ITEM_no%>
                        </td>
                    	<td><%=date%>
                        </td>
                    	<td>[<%=ITEM_TYPE%>] <%=ITEM_TITEL%>
                        </td>
                    	<td>&#8361 <%=price%>.00
                        </td>
                    	<td><%=qty%>
                        </td>
                    	<td>&#8361 <%=total%>.00
                        </td>
                    	<td><%=dil%>
                        </td>
                    </tr>
                    
						<%
					}
				}
			%>
                    
                	
                    <tr  class="customTr">
                    	<td>
    			            <div class="customBox">
                            	<div class="level1">
    	            				<div class="TotalText">상품구매 총액 :&#8361 <%=TotalPrice%>.0
	            		        	</div>
									<%double point = ((double)TotalPrice/10);%>
		    	    	        	<div class="pointText">적립 마일리지  <%=point%> p
	    	            	    	</div>
                                </div>
                                <div class="line">
                                </div>
                                <div class="level2">
	                                <div class="TotalText">상품구매총액 <%=TotalPrice%>.00천원 ( 총 <%=TotalQTY%>상품) + 배송비 0.25천원 = 총 결제금액 <%=TotalPrice%>.00천원
                                </div>
                                </div>
		    		        </div>
                        </td>
                    </tr>
                </table>
                
				<h1 class="miniMent">구매자정보
                </h1>
                
                <table class="miniTable">
                	<tr>
                    	<td>주문자
                        </td>
                    	<td><%=name%>
                        </td>
                    	<td>이메일주소
                        </td>
                    	<td><%=mail%>
                        </td>
                    </tr>
                	<tr>
                    	<td>연락처
                        </td>
                    	<td class="autoSize"><%=date%>
                        </td>
                    </tr>
                </table>
                
                
				<h1 class="miniMent">결제정보
                </h1>
                
                <table class="miniTable">
				<%
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
				%>
                	<tr>
                    	<td>결제방법
                        </td>
                    	<td><%=payment%>
                        </td>
                    	<td>결제일시
                        </td>
                    	<td><%=date%>
                        </td>
                    </tr>
                	<tr>
                    	<td>결제금액
                        </td>
                    	<td class="autoSize">&#8361 <%=TotalPrice%>.25 
                        </td>
                    </tr>
                </table>
                
				<h1 class="miniMent">배송지정보
                </h1>
                
                <table class="miniTable">
                	<tr>
                    	<td>수취인
                        </td>
                    	<td><%=ClName%>
                        </td>
                    	<td>연락처
                        </td>
                    	<td><%=Cltel%>
                        </td>
                    </tr>
                	<tr>
                    	<td>주소
                        </td>
                    	<td class="autoSize"><%=add%>
                        </td>
                    </tr>
                	<tr>
                    	<td>배송메세지
                        </td>
                    	<td class="autoSize"><%=Clmessage%>
                        </td>
                    </tr>
                </table>
            
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

