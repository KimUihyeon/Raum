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
<link rel="stylesheet" href="Asset/00_Css/ShowRoom-detail.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/ShowRoom-detail.js?ver=7"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">ShowRoom Detail
            </div>
            <div class="keyContainer_text2">Home / 라움쇼룸 / 쇼룸자세히보기
            </div>
        </div>
    </section>
    
    
    <div id="showRoomDetail">
    
    	<div class="showRoomDetailBG">
        </div>
        
    	<div class="showRoomDetailImage">
        	<input type="button" class="showRoomDetail_closeB" value="X">
            

			<!--여기부터-->
			<%
			
					
					String pla_StrinNo =request.getParameter("No");
					int Pla_No =Integer.parseInt(pla_StrinNo);

					Query = "select * from Raum_Product where Pla_No="+Pla_No;
					PreparedStatement sessionHelper3 = con.prepareStatement(Query);
					ResultSet sessionCursor3 = sessionHelper3.executeQuery();
	
					sessionCursor3.last();
					int sessionLength2 = sessionCursor3.getRow();
					sessionCursor3.beforeFirst();
					if(sessionLength2==0){

					}
					else{
						while(sessionCursor3.next()){
							int ItemNo =sessionCursor3.getInt("Prd_no");
							String FileName2 =sessionCursor3.getString("Prd_name");
							int price = sessionCursor3.getInt("Prd_price");
							String title = sessionCursor3.getString("Prd_title");
							int FinalPrice = (int)((double)price - ((double)price/10));
							String[] tempTitle = title.split("<br>");
							double _X = sessionCursor3.getDouble("Prd_x");
							double _Y = sessionCursor3.getDouble("Prd_y");
							%>

            <div class="showRoomDetail_item" style="top:<%=_Y%>%; left:<%=_X%>%">
                
                <div class="Detail_infoBoxborder">
                	<div class="Detail_infoBoxCover">
                	<div class="Detail_infoBox">
                    	<div class="Detail_infoImage"style="background: url(Asset/01_img/03_Object_Upload/<%=FileName2%>.jpg) center center no-repeat;  background-size: cover">
							<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
							</a>
                        </div>
                        <div class="Detail_infoText">
							<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box"><%=tempTitle[0]%><br>&#8361 <%=FinalPrice%>.00
							</a>
                        </div>
                        <div class="Detail_buttons">
                        	<div class="Detail_button">
                            	<div class="Detail_buttonCBG">
									<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
									</a>
                                </div>
                            </div>
                            <div class="Detail_button">
                            	<div class="Detail_buttonCBG">
									<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
									</a>
                                </div>
                            </div>
                            <div class="Detail_button">
                            	<div class="Detail_buttonCBG">
									<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
									</a>
                                </div>
                            </div>
                        </div>
                	</div>
                    </div>
                </div>
                
            	<input type="button" class="showRoomDetail_pluseB">
                
            </div>
							<%
						}
					}
			%>

			<!--여기까지-->




        </div>
        
    </div>
    
    <section id="section1">
    	<div class="section1_center">
        
        	<div class="section1_box1">
            	<div class="box1_fiter">
                </div>
                <div class="box1_iconCover">
                	<div class="box1_icon">
                    </div>
                </div>
            </div>
			
				
				<%
					String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크

				
				
					Query = "select * from Raum_Place where Pla_No="+Pla_No;
					PreparedStatement sessionHelper = con.prepareStatement(Query);
					ResultSet sessionCursor = sessionHelper.executeQuery();
					while(sessionCursor.next()){
						String FileName = sessionCursor.getString("Pla_name");
				%>
					<style>
						.section1_box1,.showRoomDetailImage{
						    background: url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) center center no-repeat;
						    background-size: cover;
						}
					</style>
				<%
					}
				%>
            
            <div class="section1_box2">
            
            	<div class="section1_box2Title">오브젝트 목록
                </div>
                
                <div class="objectList">

				<%
					Query = "select * from Raum_Product where Pla_No="+Pla_No;
					PreparedStatement sessionHelper2 = con.prepareStatement(Query);
					ResultSet sessionCursor2 = sessionHelper2.executeQuery();
	
					sessionCursor2.last();
					int sessionLength = sessionCursor2.getRow();
					sessionCursor2.beforeFirst();

					int styleNumber = 1 ;
					if(sessionLength==0){
					}
					else{
						while(sessionCursor2.next()){
						
							int ItemNo =sessionCursor2.getInt("Prd_no");
							String FileName2 =sessionCursor2.getString("Prd_name");
							int price = sessionCursor2.getInt("Prd_price");
							String title = sessionCursor2.getString("Prd_title");
							int FinalPrice = (int)((double)price - ((double)price/10));
				%>

            		<div class="best_Item">
                    
                		<div class="best_Image" style="background: url(Asset/01_img/03_Object_Upload/<%=FileName2%>.jpg) center center no-repeat;  background-size: cover">
							<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
							</a>
                    	</div>
                        
                    	<div class="best_Info">
                    		<div class="best_name"><%=title%>
                        	</div>
                        	<div class="best_price">&#8361 <%=FinalPrice%>.00
                        	</div>
                    	</div>
                        
                    	<div class="best_choice">
                    		<div class="best_name"><%=title%>
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
            	                	<div class="best_buttonCBG" onclick="WishAdd<%=ItemNo%>()">
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
<!--
					<style>
						.best_Item:nth-child(<%=styleNumber%>) .best_Image{
						    background: url(Asset/01_img/03_Object_Upload/<%=FileName2%>.jpg) center center no-repeat;
						    background-size: cover;
						}
					</style>
					-->
				<%
						}
					}



				%>

                
                </div>
                
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
