<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Main.css?ver=3">

<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAJ4tAV_nvlTx6BdiEKAk9sBRAwwaWhTO4"></script> -->
<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Main.js?ver=2"></script>

<title>:: RAUM</title>

</head>

<body>
<%
	String Logout = request.getParameter("Logout");
	String Login = request.getParameter("Login");
	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	if(Login == null){
	}
	else{
		%>
		<script>
			alert("로그인 되었습니다.");
		</script>
		<%
	}
	if(Logout == null){

	}
	else{
		%>
		<script>
			alert("로그아웃 되었습니다.");
		</script>
		<%
	}
%>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>


    <section id="key-container">
    	<div class="key-Box">
        	<div class="Slide_Box">
            	<div class="Slide_BoxR">
		        	<div class="key-Item">
            			<div class="key-Bg key-Active">
        		        </div>
    		        </div>
		        	<div class="key-Item">
	            		<div class="key-Bg key-Active">
        	    	    </div>
    	    	    </div>
	    	    	<div class="key-Item">
    	        		<div class="key-Bg key-Active">
	        	        </div>
    	        	</div>
	        		<div class="key-Item">
        	    		<div class="key-Bg key-Active">
    	    	        </div>
	    	        </div>
	        		<div class="key-Item">
        	    		<div class="key-Bg key-Active">
    	    	        </div>
	    	        </div>
	        		<div class="key-Item">
        		    	<div class="key-Bg key-Active">
    		            </div>
		            </div>
                </div>
            </div>
            
            
        	<div class="Slide_Box">
	        	<div class="key-Item">
           			<div class="key-Bg key-Active2">
       		        </div>
   		        </div>
               	<div class="KeyText Text1">Customized Furniture Design
                </div>
                <div class="KeyText Text2">새로운 시작,라움입니다.
                </div>
                <div class="KeyText Text3">라움에서 제작된 맞춤형 가구를 살펴보세요.
                </div>
                <div class="KeyBtn">
					<a href="03_object-detail.jsp?No=1" class="a_box">상품보기 >
					</a>
                </div>
            </div>
        	<div class="Slide_Box">
	        	<div class="key-Item">
           			<div class="key-Bg key-Active2">
       		        </div>
   		        </div>
               	<div class="KeyText Text1">THE USEFUL DESIGN
                </div>
                <div class="KeyText Text2">더욱 편리하고, 편안하게
                </div>
                <div class="KeyBtn">
                	<div class="KeyBtnR">
						<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">상품보기
						</a>
                    </div>
                </div>
            </div>
        </div>
        
    	<div class="Controller">
        	<div class="ControlBtn">
    	    	<div class="control controlActive">
	            </div>
        		<div class="control">
        	    </div>
    	    	<div class="control">
	            </div>
            </div>
        </div>
    </section>

    <section id="introduce">
    	<div class="introduce_h2">
        	<h2>Raum</h2><h2>: 라움</h2>
        </div>
        <h4>싱글 라이프를 위한 디자인 가구 브랜드</h4>

        <div class="introduce_box">
        	<div class="introduce_box1">
        	</div>

        	<div class="introduce_box2"></div>
        </div>

    </section>

    <section id="product">
    	<div class="product_boxs">

        	<div class="product_box1">
            	<div class="product_box1tabs">
                	<div class="tab">
                        <div class="tab_text">BEST SELLERS
                        </div>
                    	<div class="tab_dot">
                        </div>
                    </div>
                    <div class="tab">
                        <div class="tab_text">NEW PRODUCT
                        </div>
                        <div class="tab_dot">
                        </div>
                    </div>
                </div>
            </div>

            <div class="product_box2">

            	<div class="product_BEST">
                	
					<%
						//
						// BEST Product
						//
						
						Query = "select * from Raum_Product ORDER BY Prd_Click desc";
						PreparedStatement cousorHelper = con.prepareStatement(Query);
						ResultSet cousor = cousorHelper.executeQuery();
						int breakSw = 0 ;
						while(cousor.next()){
							int ItemNo = cousor.getInt("Prd_no");
							String Item_Title = cousor.getString("Prd_title");
							String File_Name = cousor.getString("Prd_name");
							int Item_Price = cousor.getInt("Prd_price");
							int FinalPrice = (int)((double)Item_Price - ((double)Item_Price/10));
							breakSw+=1;
							%>

                    <div class="best_Item">
    	            	<div class="best_Image" style="background:url(Asset/01_img/03_Object_Upload/<%=File_Name%>.jpg) center center no-repeat; background-size:cover">
							<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
							</a>
        	            </div>
            	        <div class="best_Info">
                	    	<div class="best_name"><%=Item_Title%>
                    	    </div>
                        	<div class="best_price">&#8361 <%=FinalPrice%>.00
	                        </div>
    	                </div>
        	            <div class="best_choice">
            	        	<div class="best_name"><%=Item_Title%>
                	        </div>
                    	    <div class="best_buttons">
                        		<div class="best_button">
                            		<div class="best_buttonCBG">
                                		<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
                                    	</a>
	                                </div>
    	                        </div>

								<%
									if(currentLogin==null){
									%>
									
        	                    <div class="best_button">
            	                	<div class="best_buttonCBG">
                	                	<a href="10_login.jsp?Log=2" class="a_box">
                    	                </a>
                        	        </div>
                            	</div>
	                            <div class="best_button">
    	                        	<div class="best_buttonCBG">
        	                        	<a href="10_login.jsp?Log=2" class="a_box">
            	                        </a>
                	                </div>
                    	        </div>
									<%
									}
									else{
									%>
									
        	                    <div class="best_button">
            	                	<div class="best_buttonCBG" onClick="WishAdd<%=ItemNo%>()">
                        	        </div>
                            	</div>
	                            <div class="best_button">
    	                        	<div class="best_buttonCBG" onClick="CartAdd<%=ItemNo%>()">
                	                </div>
                    	        </div>
								
							<script>
								function WishAdd<%=ItemNo%>(){$.ajax({
								    url:'Action/Ajax_WishAdd.jsp?No=<%=ItemNo%>',
								    success:function(data){
										var dataEdit = ""+data.trim();
										if(dataEdit=="true"){
											alert("관심상품에 등록되었습니다.")
										}
										else{
											alert("이미 등록된 상품입니다.")
										}
									}
									})
								}
								function CartAdd<%=ItemNo%>(){
								    $.ajax({
								    url:'Action/Ajax_CartAdd.jsp?No=<%=ItemNo%>',
								    success:function(data){
										var dataEdit = ""+data.trim();
										if(dataEdit=="true"){
											alert("장바구니에 등록되었습니다.")
										}
										else{
											alert("이미 등록된 상품입니다.")
										}
									}
									})
								}
							</script>

									<%
									}

								%>
                        	</div>
	                    </div>
    	            </div>
							<%

							if(breakSw==8){
								break;
							}
						}

					%>

				</div>
                
                
                <div class="product_NEW">
                
                	
					<%				
					
						//
						// New Product
						//
						breakSw = 0 ;
						Query = "select * from Raum_Product ORDER BY Prd_no desc";
						PreparedStatement cousorHelper2 = con.prepareStatement(Query);
						ResultSet cousor2 = cousorHelper2.executeQuery();
						while(cousor2.next()){
							int ItemNo = cousor2.getInt("Prd_no");
							String Item_Title = cousor2.getString("Prd_title");
							String File_Name = cousor2.getString("Prd_name");
							int Item_Price = cousor2.getInt("Prd_price");
							int FinalPrice = (int)((double)Item_Price - ((double)Item_Price/10));
							breakSw+=1;
							%>

                    <div class="best_Item">
    	            	<div class="best_Image" style="background:url(Asset/01_img/03_Object_Upload/<%=File_Name%>.jpg) center center no-repeat; background-size:cover">
							<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
							</a>
        	            </div>
            	        <div class="best_Info">
                	    	<div class="best_name"><%=Item_Title%>
                    	    </div>
                        	<div class="best_price">&#8361 <%=FinalPrice%>.00
	                        </div>
    	                </div>
        	            <div class="best_choice">
            	        	<div class="best_name"><%=Item_Title%>
                	        </div>
                    	    <div class="best_buttons">
                        		<div class="best_button">
                            		<div class="best_buttonCBG">
                                		<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
                                    	</a>
	                                </div>
    	                        </div>
								<%
									if(currentLogin==null){
									%>
									
        	                    <div class="best_button">
            	                	<div class="best_buttonCBG">
                	                	<a href="10_login.jsp?Log=2" class="a_box">
                    	                </a>
                        	        </div>
                            	</div>
	                            <div class="best_button">
    	                        	<div class="best_buttonCBG">
        	                        	<a href="10_login.jsp?Log=2" class="a_box">
            	                        </a>
                	                </div>
                    	        </div>
									<%
									}
									else{
									%>
									
        	                    <div class="best_button">
            	                	<div class="best_buttonCBG" onClick="WishAdd<%=ItemNo%>()">
                        	        </div>
                            	</div>
	                            <div class="best_button">
    	                        	<div class="best_buttonCBG" onClick="CartAdd<%=ItemNo%>()">
                	                </div>
                    	        </div>
								
								
							<script>
								function WishAdd<%=ItemNo%>(){
								    $.ajax({
								    url:'Action/Ajax_WishAdd.jsp?No=<%=ItemNo%>',
								    success:function(data){
										var dataEdit = ""+data.trim();
										if(dataEdit=="true"){
											alert("관심상품에 등록되었습니다.")
										}
										else{
											alert("이미 등록된 상품입니다.")
										}
									}
									})
								}
								function CartAdd<%=ItemNo%>(){
								    $.ajax({
								    url:'Action/Ajax_CartAdd.jsp?No=<%=ItemNo%>',
								    success:function(data){
										var dataEdit = ""+data.trim();
										if(dataEdit=="true"){
											alert("장바구니에 등록되었습니다.")
										}
										else{
											alert("이미 등록된 상품입니다.")
										}
									}
									})
								}
							</script>

									<%
									}

								%>
                        	</div>
	                    </div>
    	            </div>
                  



							<%

							if(breakSw==8){
								break;
							}
						}

					%>
                    
				</div>
			</div>
            
            <div class="product_box3">
            	<div class="product_box3B">
                	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">BROWSE OUR PRODUCTS
                    </a>
                </div>
            </div>

        </div>
    </section>

    <section id="special">
    	<div class="special_image">
        </div>
        
    	<style>
		.special_image{
			background:url(Asset/01_img/01_Main/Raum_set.jpg) center center no-repeat;
			background-size:cover;
		}
		
			
		</style>


        <div class="special_box">
        	<div class="special_textbox">

            	<div class="special_text1">SPECIAL SET
                </div>

                <hr align="left">

                <div class="special_text2">라움에서 추천하는 기간 한정 세트상품을 만나보세요.<br>가격, 퀄리티, 디자인까지 당신을 만족하게 할 수 있을 것입니다.
                </div>

                <div class="special_text3">크리스탈 화이트 3종세트
                </div>

                <div class="special_text4">
                	<div class="special_text4-1">300,000원
                    </div>
                    <div class="special_text4-2">225,000원
                    </div>
                </div>

                <div class="special_timer">22 : 06 : 23 : 45
 	              	<div class="special_timerT">Days
                    </div>
                    <div class="special_timerT">Hours
                    </div>
                    <div class="special_timerT">Minutes
                    </div>
                    <div class="special_timerT">Seconds
                    </div>
                </div>

                <div class="special_addCartB">
                	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">
	                	<div class="special_cartIcon">
    	                </div>
        	            <div class="special_addCartText">자세히보기
	                    </div>
                    </a>
                </div>

            </div>
        </div>

        <div class="special_centerboll">
        	<div class="special_percentige">
            	<h2>-25%</h2>
            </div>
        </div>

    </section>
    <section id="empty_Background">
    </section>

    <section id="empty">
    </section>

    <section id="advantages">
    	<div class="advantages_boxs">
        	<div class="advantages_box">
            	<div class="advantages_icon1">
                </div>
                <div class="advantages_text1">FREE SHIPPING WORLDWIDE
                </div>
                <div class="advantages_text2">20만원 이상 주문시 무료배송 해드립니다.
                </div>
            </div>

            <div class="advantages_box">
            	<div class="advantages_icon2">
                </div>
                <div class="advantages_text1">24/7 CUSTOMER SERVICE
                </div>
                <div class="advantages_text2">당신이 필요할때 도움을 받을수 있습니다.
                </div>
            </div>

            <div class="advantages_box">
            	<div class="advantages_icon3">
                </div>
                <div class="advantages_text1">100% MONEY BACK
                </div>
                <div class="advantages_text2">정품이 아닐시 100% 환불해드립니다.
                </div>
            </div>

        </div>
    </section>

    <section id="ment">
    	<div class="ment_box">
        	<div class="ment_text">Everything is designed for you.
            </div>
        </div>
    </section>

    <section id="map">
    </section>

    <section id="putter">
    	<div class="putter_box">

        	<div class="putter_boxTop">
            	<div class="putter_logo">
                	<a href="00_index..jsp" class="a_box">
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
