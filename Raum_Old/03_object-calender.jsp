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
<link rel="stylesheet" href="Asset/00_Css/Object-calender.css?ver=1">


<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Object-calender.js"></script>
<title>:: RAUM</title>
</head>

<body>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String Type = request.getParameter("type");
	int crrentPageNo = Integer.parseInt(request.getParameter("page"));
	String listQty = request.getParameter("listQty");

	String align = request.getParameter("align");
	String crrentPath = request.getRequestURL().toString();


	int listQtyNo = 8 ;

	if(Type==null){
		//response.sendRedirect("error_500.html");
	}
	else{

	int typeNo = Integer.parseInt(Type);
	String SubTitle ="";
	switch(typeNo){
		case 0 :  SubTitle = "홈오피스" ; break;
		case 1 :  SubTitle = "홈오피스" ; break;
		case 2 :  SubTitle = "홈오피스" ; break;
		case 3 :  SubTitle = "홈오피스" ; break;
		case 4 :  SubTitle = "홈오피스" ; break;
	};

	if(listQty==null){
		listQtyNo = 8 ;
	}
	else{
		listQtyNo = Integer.parseInt(listQty);
	}
	String aaa= "";
	Query = "select * from Raum_Product where Prd_type='"+SubTitle+"'";
	if(align.equals("new")){
		Query += "order by Prd_no desc ";
		aaa = "실행댐";
	}else if(align.equals("popularity")){
		Query += "order by Prd_Click desc ";
	}else if(align.equals("lowPrice")){
		Query += "order by Prd_price ASC ";
	}else if(align.equals("highPrice")){
		Query += "order by Prd_price desc ";
	}
	PreparedStatement sessionHelper2 = con.prepareStatement(Query);
	ResultSet sessionCursor2 = sessionHelper2.executeQuery();

	
%>


<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1"><%=SubTitle%>
            </div>
            <div class="keyContainer_text2">Home / 오브젝트 / 가구리스트
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1_Center">
        
        	<div class="section1_box1">
            	<div class="section1_box1-1">
                	<div class="section1_title">홈오피스
                    </div>
                    <div class="sortIcons">
                    	<input type="button" class="sortIcon">
                        <input type="button" class="sortIcon">
                    </div>
                </div>
                <div class="section1_box1-2">
                	<div class="kinds">
                    	<div class="kind">책상</div>
                        <div class="kind">책장</div>
                        <div class="kind">수납장</div>
                    </div>
                    <div class="sortWayBox">
                    	<select id="sortTypeSelect">
					<%
						if(align.equals("new")){
					%>
                        	<option value="new" selected>신상품순</option>
                            <option value="popularity">인기상품순</option>
                            <option value="lowPrice">낮은가격순</option>
                            <option value="highPrice">높은가격순</option>							
					<%
						}else if(align.equals("popularity")){
					%>
                        	<option value="new" >신상품순</option>
                            <option value="popularity"selected>인기상품순</option>
                            <option value="lowPrice">낮은가격순</option>
                            <option value="highPrice">높은가격순</option>							
					<%
						}else if(align.equals("lowPrice")){
					%>
                        	<option value="new" >신상품순</option>
                            <option value="popularity">인기상품순</option>
                            <option value="lowPrice"selected>낮은가격순</option>
                            <option value="highPrice">높은가격순</option>							
					<%
						}else if(align.equals("highPrice")){
					%>
                        	<option value="new" >신상품순</option>
                            <option value="popularity">인기상품순</option>
                            <option value="lowPrice">낮은가격순</option>
                            <option value="highPrice"selected>높은가격순</option>							
					<%
						}
					%>
                        </select>

                        <select id="exposureTypeSelect">
					<%
						if(listQty.equals("8")){
					%>
                        	<option value="8"selected>8개씩 보기</option>
                            <option value="12">12개씩 보기</option>
                            <option value="16">16개씩 보기</option>
                            <option value="20">20개씩 보기</option>
					<%

						}else if(listQty.equals("12")){
					%>
                        	<option value="8">8개씩 보기</option>
                            <option value="12"selected>12개씩 보기</option>
                            <option value="16">16개씩 보기</option>
                            <option value="20">20개씩 보기</option>
					<%

						}else if(listQty.equals("16")){
					%>
                        	<option value="8">8개씩 보기</option>
                            <option value="12">12개씩 보기</option>
                            <option value="16"selected>16개씩 보기</option>
                            <option value="20">20개씩 보기</option>
					<%

						}else if(listQty.equals("20")){
					%>
                        	<option value="8">8개씩 보기</option>
                            <option value="12">12개씩 보기</option>
                            <option value="16">16개씩 보기</option>
                            <option value="20"selected>20개씩 보기</option>
					<%
						}
					%>
                        </select>
                    </div>
                </div>
            </div>
            
            <div class="section1_box2">
            
            	<div class="objectCalender">

				<%
					sessionCursor2.last();
					int sessionLength = sessionCursor2.getRow();
					sessionCursor2.beforeFirst();

					int temp = sessionLength/listQtyNo;
					int temp2 =  sessionLength%listQtyNo;
					if(temp2==0){
					}
					else{
						temp=temp+1;
					}
					int tempW = (temp+2) *55;

//					int Page_startNo = 0;
					int Page_crrentNo = 0;
//					int Page_LastNo = listQtyNo;

					int Page_startNo =  Integer.parseInt(listQty) * (crrentPageNo-1);
					int Page_LastNo = Page_startNo + Integer.parseInt(listQty);


					if(sessionLength==0){
					}
					else{
					//	int[] ItemNo = new int[sessionLength];
				//		String[] FileName2 = new String[sessionLength];

						while(sessionCursor2.next()){
							int ItemNo =sessionCursor2.getInt("Prd_no");
							String FileName2 =sessionCursor2.getString("Prd_name");
							int price = sessionCursor2.getInt("Prd_price");
							int FinalPrice = (int)((double)price - ((double)price/10));
							String title = sessionCursor2.getString("Prd_title");

					//		FileName2[Page_crrentNo]=sessionCursor2.getString("Prd_name");
							if(Page_crrentNo>Page_startNo-1){
						%>
						
            		<div class="object_Item">
                    
                		<div class="object_Image" style="background:url(Asset/01_img/03_Object_Upload/<%=FileName2%>.jpg) center center no-repeat; background-size:cover">
                          	<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
	                        </a>
                    	</div>
                        
                    	<div class="object_Info">
                    		<div class="object_name"><%=title%>
                        	</div>
                        	<div class="object_price">&#8361 <%=FinalPrice%>.00
                        	</div>
                    	</div>
                        
                    	<div class="object_choice">
                    		<div class="object_name"><%=title%>
                        	</div>
                        	<div class="object_buttons">
                        		<div class="object_button">
                            		<div class="object_buttonCBG">
                                    	<a href="03_object-detail.jsp?No=<%=ItemNo%>" class="a_box">
                                        </a>
                                	</div>
                            	</div>
								<%
									if(currentLogin==null){
									%>
									
                            	<div class="object_button">
                            		<div class="object_buttonCBG">
                                    	<a href="10_login.jsp?Log=2" class="a_box">
                                        </a>
                                	</div>
                            	</div>
                            	<div class="object_button">
                            		<div class="object_buttonCBG">
                                    	<a href="10_login.jsp?Log=2" class="a_box">
                                        </a>
                                	</div>
                            	</div>

									<%
									}
									else{
									%>
									
                            	<div class="object_button">
                            		<div class="object_buttonCBG" onClick="WishAdd<%=ItemNo%>()">
                                	</div>
                            	</div>
                            	<div class="object_button">
                            		<div class="object_buttonCBG" onClick="CartAdd<%=ItemNo%>()">
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
							}
						Page_crrentNo+=1; 
						if(Page_crrentNo==Page_LastNo){
							break;
						}


						}
					}
				%>
                </div>
                
            </div>
            
            <div class="section1-Buttons" style="width:<%=tempW%>px">
            	<input type="button" class="section1_controller" value="<">
				
				<%
					for(int i =0 ; i <temp ;i++){
						int Nober = i+1;
					%>
						<script>
							console.log("<%=temp2%>");
						</script>
		                <input type="button" class="section1_controller" value="<%=Nober%>" onClick="MovePage(<%=Nober%>)">
					<%
				}
				%>
                <input type="button" class="section1_controller" value=">">
            </div>
			<script>
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

<script>
$(function(){
	var _type = "type=<%=Type%>&";
	var _listQty = "listQty=<%=listQty%>&";
	var _page ="page=1";
	var _align = "align=<%=align%>";
	var _fullPath = "<%=crrentPath%>?";

	$('#sortTypeSelect').change(function(){
		var temp = $('#sortTypeSelect').val();
		var _addPath = "align=";
		if(temp == "new"){
			_addPath+= "new";
		}else if (temp == "popularity")	{
			_addPath+= "popularity";
		}else if (temp == "lowPrice")	{
			_addPath+= "lowPrice";
		}else if (temp == "highPrice")	{
			_addPath+= "highPrice";
		}
		_fullPath = _fullPath+_type+_listQty+_page+"&"+_addPath;
		location.href=_fullPath;
	});
	$('#exposureTypeSelect').change(function(){
		var temp = $('#exposureTypeSelect').val();
		var _addPath = "listQty=";
		if(temp == '8'){
			_addPath += 8;
		}else if (temp == '12')	{
			_addPath += 12;
		}else if (temp == "16")	{
			_addPath += 16;
		}else if (temp == "20")	{
			_addPath += 20;
		}
		_fullPath = _fullPath +_type+_addPath+"&"+_page+"&"+_align;
		location.href=_fullPath;

	});
});
	function MovePage(page){
		var _type = "type=<%=Type%>&";
		var _listQty = "listQty=<%=listQty%>&";
		var _page ="page=1";
		var _align = "align=<%=align%>";
		var _fullPath = "<%=crrentPath%>?";

		_fullPath = _fullPath + _type + _listQty + "page="+page+"&"+_align;

//		alert(_fullPath);
		location.href=_fullPath;

	}
</script>

<%
	}
%>
</body>
</html>
