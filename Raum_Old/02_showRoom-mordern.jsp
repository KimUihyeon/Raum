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
<link rel="stylesheet" href="Asset/00_Css/ShowRoom-mordern.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/ShowRoom-mordern.js"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Modern Type
            </div>
            <div class="keyContainer_text2">Home / 라움쇼룸 / 모던형
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1_box0">
        	<div class="box1_ment1">Show our great "RAUM"
            </div>
            <div class="box1_ment2">전문가의 손을 거쳐 완성된 당신의 라움
            </div>
        </div>
        
    	<div class="section1_box1">
            
            <div class="showRoomList">
<!--
            <style>
				.showRoomItem:nth-child(1){
					background:url(Asset/01_img/03_Object_Upload/stan_wood_01.jpg) no-repeat center center;
					background-size:cover;
				}
				.showRoomItem:nth-child(2){
					background: url(Asset/01_img/03_Object_Upload/Silde_roo-04.jpg)no-repeat center center;
					background-size:cover;
				}
				.showRoomItem:nth-child(3){
					background: url(Asset/01_img/03_Object_Upload/Silde_roo-02.jpg)no-repeat center center;
					background-size:cover;
				}
				.showRoomItem:nth-child(4){
					background: url(Asset/01_img/03_Object_Upload/Silde_roo-05.jpg)no-repeat center center;
					background-size:cover;
				}
			</style>
-->

			<%
				
				Query = "select * from Raum_Place order by Pla_no desc";
				PreparedStatement sessionHelper = con.prepareStatement(Query);
				ResultSet sessionCursor = sessionHelper.executeQuery();

				sessionCursor.last();
				int sessionLength = sessionCursor.getRow();
				sessionCursor.beforeFirst();
				int styleNumber = 1 ;

				if(sessionLength==0){
				}
				else{
					while(sessionCursor.next()){
						
						int No =sessionCursor.getInt("Pla_no");
						String FileName =sessionCursor.getString("Pla_name");
						String title = sessionCursor.getString("Pla_title");
						String text = sessionCursor.getString("Pla_text");
				%>
				
            
            	<div class="showRoomItem" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName%>.jpg) no-repeat center center; background-size:cover;">
                	<div class="ItemInfoBackground">
                    </div>
                    <div class="ItemInfo">
                    	<div class="item_name"><%=title%>
                        </div>
                        <div class="item_ment"><%=text%>
                        </div>
                        <div class="item_button_center">
                        	<form action="02_showRoom-detail.jsp?No=<%=No%>" method="post">
								<input type="submit" value="자세히보기" class="item_button">
                            </form>
                        </div>
                   	</div>
                </div>

				<style>				
					.showRoomItem:nth-child(<%=styleNumber%>){
						background:url(Asset/01_img/03_Object_Upload/stan_wood_01.jpg) center center no-repeat;
						background-size:cover;
					}
				</style>
                


				<%
					styleNumber++;
					};
				}


			%>
            
                
            </div>
            
            
            <div class="section1-Buttons">
            	<form>
	            	<input type="submit" class="section1_controller" value="<">
                </form>
                
            	<form>
	                <input type="submit" class="section1_controller" value="1">
                </form>
    
            	<form>
    	            <input type="submit" class="section1_controller" value=">">
                </form>
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
