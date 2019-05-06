<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage1-profile-2.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage1-profile-2.js"></script>
<title>:: RAUM</title>
</head>
<%

	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크
	String log = request.getParameter("log");
	if(log==null){
	}
	else{
		if(log.equals("1")){
			%>
				<script>
					alert("변경되었습니다");
				</script>
			<%
		}
		else if(log.equals("2")){
			%>
				<script>
					alert("비밀번호가 올바르지 않습니다.");
				</script>
			<%
		}
	}
	
	String tel1 ="";
	String tel2="";
	String tel3 ="";
	String add1="";
	String add3="";
	String add2="";
	String mail1="";
	String mail2= "";
	String name= "";
	if(currentLogin==null){
		response.sendRedirect("error_500.html");
	}
	else{
		Query = "select * from Raum_Member where M_id='"+currentLogin+"'";
		PreparedStatement QueryHelper = con.prepareStatement(Query);
		ResultSet cursor = QueryHelper.executeQuery();

		while(cursor.next()){
			name=cursor.getString("M_name");
			String[] temp_tel = cursor.getString("M_tel2").split("-");
			tel1 = temp_tel[0];
			tel2 = temp_tel[1];
			tel3 = temp_tel[2];

			add1 = cursor.getString("M_address1");
			add3 = cursor.getString("M_address3");
			add2 = cursor.getString("M_address2");
			
			String[] temp_mail = cursor.getString("M_tel").split("@");
			mail1 = temp_mail[0];
			mail2 = temp_mail[1];

		}

	}

%>

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
	</div>

    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Profile Modified
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 개인정보수정
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
			<form action="11_mypage1-profile-2-update.jsp" method="post">
            
        		<div class="section1_title">개인정보관리
            	</div>
                
                <div class="mentBox1">
            		<div class="warning_icon">
                	</div>
                	<div class="warning_coment">
                	</div>
            	</div>
                
            	<div class="section1_infoBox">
            		<div class="InfoName">아이디
                    	<div class="section1_coment">(수정불가)
                        </div>
                	</div>
                	<input  type= "text" class="IDinput" readonly value="<%=currentLogin%>">
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">이름
                    	<div class="section1_coment">(수정불가)
                        </div>
                	</div>
                	<input  type= "text" class="NameInput" readonly value="<%=name%>">
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">휴대폰 번호
                	</div>
                	<input  type= "text" class="PhonInput1" value="<%=tel1%>" name="tel1">
                	<div class="dasi">-</div>
                	<input  type= "text" class="PhonInput2" value="<%=tel2%>" name="tel2">
                	<div class="dasi">-</div>
                	<input  type= "text" class="PhonInput3" value="<%=tel3%>" name="tel3">
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">주소
                	</div>
                
                	<div class="adressBox">
                		<div class="adressNumber">
                			<input  type= "text" class="AdressInput1" value=<%=add1%> name="add1">
                			<input type="button" class="section1_postNumberB" value="우편번호찾기">
                    	</div>
                		<input  type= "text" class="AdressInput2" value="<%=add2%>" name="add2">
                		<input  type= "text" class="AdressInput3" value="<%=add3%>" name="add3">
                	</div>
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">이메일
                    	<div class="section1_coment">
                        </div>
                	</div>
                	<input  type= "text" class="EmailInput1" name="mail1" value="<%=mail1%>">
                	<div class="dasi">@</div>
                	<input  type= "text" class="EmailInput2" name="mail2" value="<%=mail2%>">
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">정보수신여부
                	</div>
                
                	<div class="ReceiveInfoCheckList">
                		<div class="CheckListMent">라움에서 제공하는 정보를 받아보세요.
                    	</div>
                    	<div class="CheckList">
                    		<input type="checkbox" name="chk_receiveInfo" value="sms"><label for="chkBox">SMS 수신동의</label>
                    	</div>
                    	<div class="CheckList">
                    	<input type="checkbox" name="chk_receiveInfo" value="email"><label for="chkBox">이메일 수신동의</label>
                    	</div>
                	</div>
            	</div>
                
                <input type="submit" class="profileChangeB" value="개인정보수정">
				</form>
            
        	</div>
            
            <div class="section1_box2">
			<form action="11_mypage1-profile-2-pw.jsp" method="post">
            
        		<div class="section1_title">비밀번호 수정
            	</div>
                
                <div class="mentBox2">
            		<div class="warning_icon">
                	</div>
                	<div class="warning_coment">
                	</div>
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">기존 비밀번호
                	</div>
                	<input  type= "password" class="PwInput" name="pw">
            	</div>
            
            	<div class="section1_infoBox">
            		<div class="InfoName">새 비밀번호
                	</div>
                	<input  type= "password" class="NewPwInput" name="pw2">
            	</div>
                
                <div class="section1_infoBox">
            		<div class="InfoName">새 비밀번호 확인
                	</div>
                	<input  type= "password" class="NewPwCheckInput">
            	</div>
                
                <input type="submit" class="pwChangeB" value="비밀번호수정">
                <input type="button" class="leaveMemershipB" value="회원탈퇴하기">
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
