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
<link rel="stylesheet" href="Asset/00_Css/Mypage2-order-1.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage-Common.js"></script>
<script src="Asset/00_Script/Mypage2-order-1.js"></script>
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
            
            
            <!--d여기여기-->
            <div class="clickItemBox">
            	<div class="ItemFillter">조회기간
                </div>
            	<div class="ItemFillter">
                	<a href="11_mypage2-order-1.jsp" class="a_box">15일
                    </a>
                </div>
            	<div class="ItemFillter">
                	<a href="11_mypage2-order-1.jsp" class="a_box">1개월
                    </a>
                </div>
            	<div class="ItemFillter">
                	<a href="11_mypage2-order-1.jsp" class="a_box">3개월
                    </a>
                </div>
            	<div class="ItemFillter">
                	<a href="11_mypage2-order-1.jsp" class="a_box">모두
                    </a>
                </div>
            </div>
            
            <div class="tableBox">
            	<table class="table1">
                	<tr>
                    	<td>주문번호
                        </td>
                    	<td>주문일
                        </td>
                    	<td>주문상품
                        </td>
                    	<td>판매가격
                        </td>
                    	<td>주문수량
                        </td>
                    	<td>결제금액
                        </td>
                    	<td>주문상태
                        </td>
                    </tr>
					<%
						String id = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
						Query = "SELECT * ,MAX(B_no) MAX_NO, COUNT( * )  count , SUM(B_qty) ItemQty FROM Raum_Order, Raum_Member, Raum_Product WHERE Raum_Order.M_id ='"+id+"' AND Raum_Order.Prd_No = Raum_Product.Prd_No AND Raum_Order.M_id = Raum_Member.M_id GROUP BY B_type order By B_date desc";

						PreparedStatement cursorHelper = con.prepareStatement(Query);
						ResultSet cursor = cursorHelper.executeQuery();

	
						cursor.last();
						int sessionLength = cursor.getRow();
						cursor.beforeFirst();

						int _height = (sessionLength * 63) +450;
						if(sessionLength==0){
							%>
							
                	<tr class="tableNoItem">
                    	<td colspan="5">주문하신 상품이 존재하지 않습니다.
                        </td>
                    </tr>
							<%

						}
						else{
							while(cursor.next()){
								String date = cursor.getString("B_date");
								String[] noTemp = date.split("-");
								int ord_no  = cursor.getInt("MAX_NO");
								String ordNo_S= "";
								String ITEM_typee = cursor.getString("Prd_type");
								String[] ITEM_name_TEMP = cursor.getString("Prd_title").split("<br>");
								String ITEM_name = "";
								ITEM_name = ITEM_name_TEMP[0] + " " + ITEM_name_TEMP[1] ;
								int ITEM_QTY = cursor.getInt("count")-1;
								String ITEM_QTY_S ="";
								String LINK = cursor.getString("B_type");


								int ITEM_INNER_QTY = cursor.getInt("ItemQty");
								int price = cursor.getInt("B_price");
								int SalePrice = (int)((double)price - ((double)price/10));

								String dil = cursor.getString("B_dil");
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
                	<tr>
                    	<td><a href="11_mypage2-order-2.jsp?type=<%=LINK%>" class="a_box"><%=ordNo_S%></a>
                        </td>
                    	<td><a href="11_mypage2-order-2.jsp?type=<%=LINK%>" class="a_box"><%=date%></a>
                        </td>
						<%
								if(ITEM_QTY==0){
									ITEM_QTY_S="";
									%>

                    	<td><a href="11_mypage2-order-2.jsp?type=<%=LINK%>" class="a_box">[<%=ITEM_typee%>] <%=ITEM_name%></a>
                        </td>
									<%
								}
								else{
									ITEM_QTY_S = ""+ITEM_QTY;
									%>
									
                    	<td><a href="11_mypage2-order-2.jsp?type=<%=LINK%>" class="a_box">[<%=ITEM_typee%>] <%=ITEM_name%> 외 <%=ITEM_QTY_S%>개 상품</a>
                        </td>
									<%
								}
						%>
                    	<td><a href="11_mypage2-order-2.jsp?type=<%=LINK%>" class="a_box">&#8361 <%=price%></a>
                        </td>
                    	<td><%=ITEM_INNER_QTY%>
                        </td>
                    	<td>&#8361 <%=SalePrice%>
                        </td>
                    	<td><a href="https://www.doortodoor.co.kr/main/index.jsp" target="_blank" class="a_box"><%=dil%></a>
                        </td>
                    </tr>
								<%

							}

						}
					%>
					<style>
						.addHeight{
							height:<%=_height%>px !important;
						}
					</style>
					<script>
						$('#section1').addClass('addHeight');
					</script>
                    
                </table>
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

