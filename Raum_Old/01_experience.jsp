<%@page contentType="text/html; charset=utf-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Experience.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Experience.js"></script>
<title>:: RAUM</title>
</head>

<body>
<%
	
	String currentLoginID = (String)session.getAttribute("currentSessionID");
%>
<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Workshop
            </div>
            <div class="keyContainer_text2">Home / 라움소개 / 공방체험
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1_box">
        
        	<div class="section1_Tbox1">
            	<div class="section1_text1">Do it yourself
                </div>
                <div class="section1_text2">스스로 만들어 보는 자신만의 공간 - 라움우드
                </div>
            </div>
            
            <div class="section1_text3">세상에서 오직 하나뿐인 가구를 만들어보세요.<br>자신의 손길이 묻어 더욱 특별한 나만의 가구를 만날 수 있습니다.
            </div>
            
            <div class="section1_Tbox2">
            	<div class="section1_Tbox2-1">
                	<div class="section1_icon">
                    </div>
                    <div class="section1_text4">라움우드는 보다 쉽게 수제가구를 체험 할 수 있습니다.<br>고객님의 요청사항에 따라 제작하실 수 있도록 미리 재단 및 가공해드립니다.<br>목재와 공구의 사용이 익숙하지 않은 고객님도 손쉽게 제작 하실 수 있습니다. 
                    </div>
                </div>
                <div class="section1_Tbox2-1">
                	<div class="section1_icon">
                    </div>
                    <div class="section1_text4">라움우드는 건강합니다.<br>나무 고유의 질감을 살려주고, 나무가 숨을 쉴수 있는 친환경 염료를 사용합니다.<br>마감재료로 사용되는 친환경 제품은 아이들에게도 안전한 제품입니다.
                    </div>
                </div>
                <div class="section1_Tbox2-1">
                	<div class="section1_icon">
                    </div>
                    <div class="section1_text4">라움우드는 거짓말하지 않습니다.<br>고객님께 최고의 품질과 서비스를 제공합니다.<br>튼튼하게 제작될 수 있도록 도와드려 금방 망가질 걱정이 없습니다.
                    </div>
                </div>
                <div class="section1_Tbox2-1">
                	<div class="section1_icon">
                    </div>
                    <div class="section1_text4">공방체험은 1:1문의 혹은 유선상으로 연락해주시면 신청 가능합니다.
                    </div>
                </div>
            </div>
            
            <div class="section1_button">
			<%
				if(currentLoginID==null){
					%>
					<a href="10_login.jsp?Log=2" class="a_box">신청하기
					</a>
					<%
				}
				else{
					%>
					<a href="05_Question.jsp" class="a_box">신청하기
					</a>
					<%
				}
			%>
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
