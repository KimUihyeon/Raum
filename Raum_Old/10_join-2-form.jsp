<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/NotLogin_page.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Join-2-form.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Join-2-form.js"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Raum Join
            </div>
            <div class="keyContainer_text2">01. 약관동의 > 02. 정보입력 > 03. 가입완료
            </div>
        </div>
    </section>
    
    <section id="section1">
    <form action="10_join-2-form_OK.jsp" method="post">
    	<div class="section1_box">
        	<div class="section1_title">개인정보입력
            </div>
            
            <div class="mentBox">
            	<div class="warning_icon">
                </div>
                <div class="section1_coment">
                </div>
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">아이디
                </div>
                <input  type= "text" class="IDinput" name="id">
                <input type="button" class="section1_doubleCheckB" value="중복확인" onClick="IDSearch()">
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">비밀번호
                </div>
                <input  type="password" class="PwInput" name="pw">
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">비밀번호 확인
                </div>
                <input  type= "password" class="PwReInput">
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">이름
                </div>
                <input  type= "text" class="NameInput" name="name">
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">휴대폰 번호
                </div>
                <input  type= "text" class="PhonInput1" name="tel_1">
                <div class="dasi">-</div>
                <input  type= "text" class="PhonInput2" name="tel_2">
                <div class="dasi">-</div>
                <input  type= "text" class="PhonInput3" name="tel_3">
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">주소
                </div>
                
                <div class="adressBox">
                	<div class="adressNumber">
                		<input  type= "text" class="AdressInput1" name="add_1">
                		<input type="button" class="section1_postNumberB" value="우편번호찾기">
                    </div>
                	<input  type= "text" class="AdressInput2" name="add_2">
                	<input  type= "text" class="AdressInput3" name="add_3">
                </div>
            </div>
            
            <div class="section1_infoBox">
            	<div class="InfoName">이메일
                </div>
                <input  type= "text" class="EmailInput1" name="Email_1">
                <div class="dasi">@</div>
                <input  type= "text" class="EmailInput2" name="Email_2">
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
            
        </div>
        
        <div class="section1_buttons">
        	<input type="reset" class="section1_button" value="취소">
            <input type="submit" class="section1_button" value="가입하기">
        </div>
    </form>    
    </section>
	
			<script>

			function IDSearch(){
				var _id = $('.IDinput').val();
				if(_id==""){
					alert("아이디를 입력해주세요");
					$('.warning_icon').css({display:"block"});
					$('.section1_coment').html("아이디를 입력해주세요");
				}
				else{
					$.ajax({
						url:'Action/Ajax_SearchID.jsp?id='+_id,
						success:function(data){
							var dataEdit = data.trim();
							if(dataEdit=="true"){
								alert("사용 가능한 아이디입니다");
								$('.warning_icon').css({display:"block"});
								$('.section1_coment').html("사용 가능한 아이디입니다.");
								bool = true;
							}
							else{
								alert("사용중인 이이디입니다.");
								$('.warning_icon').css({display:"block"});
								$('.section1_coment').html("이미 사용중인 아이디입니다.");
								bool =false;
							}
						}
					});
				}
			}
			

				
			</script>
    
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
