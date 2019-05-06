<%@page contentType="text/html; charset=utf-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/About-raum.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/About-raum.js"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>

	<%
		String currentLogin = (String)session.getAttribute("currentSessionID");
	%>
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Raum
            </div>
            <div class="keyContainer_text2">Home / 라움소개 / Raum
            </div>
        </div>
    </section>

    <section id="section1">
    	<div class="section1-watchword">Everything is designed for you.
        </div>

        <div class="section1_textbox1">
        	<div class="section1_Innertextbox">
            	<div class="section1_octagon">공간
                </div>
            </div>
            <div class="section1_Innertextbox">
            	<div class="section1_octagon">사람
                </div>
            </div>
            <div class="section1_Innertextbox">
            	<div class="section1_octagon">가치
                </div>
            </div>
        </div>

        <div class="section1_textbox2">
        	<div class="numberBox">
            	<div class="numberBox-number">01
                </div>
            	<div class="numberBox-text">RAUM
                </div>
            </div>
            <div class="section1_textbox3">독일의 장인정신을 이어받았습니다.<br>제품 하나하나에 장인정신을 담아 현대적인 디자인을 접목시켰습니다.<br>당신을 위한 가구를 준비하였습니다.
            </div>
        </div>

        <div class="section1-image1">
        </div>

        <div class="section1_textbox2">
        	<div class="numberBox">
            	<div class="numberBox-number">02
                </div>
            	<div class="numberBox-text">FOR YOU
                </div>
            </div>
            <div class="section1_textbox3">단순히 가구를 파는곳이 아닙니다. Raum은 공간을 판매합니다.<br>당신의 몸이 가장 오래 머무르는 곳, 가장 많이 맞닿아 있는 곳 이기에 저희는 더욱 신중합니다.<br>우리는 당신이 머무는 공간을 판매합니다.
            </div>
        </div>

        <div class="section1-image2">
        </div>

        <div class="section1_textbox2">
        	<div class="numberBox">
            	<div class="numberBox-number">03
                </div>
            	<div class="numberBox-text">VALUABLE
                </div>
            </div>
            <div class="section1_textbox3">나홀로족도 고급스러울수 있습니가.<br>나홀로족은 하나의 문화로 자리매김 하고 있습니다.<br>아름다운 공간으로 자신의 가치를 한층 높여보세요.
            </div>
        </div>

        <div class="section1-image3">
        </div>

        <div class="section1_textbox2">
        	<div class="numberBox">
            	<div class="numberBox-number">04
                </div>
            	<div class="numberBox-text">CUSTOM
                </div>
            </div>
            <div class="section1_textbox3">커스텀으로 당신을 위한 가구로 거듭납니다.<br>개성이 중시되는 트렌드에 발맞춰 자신에게 꼭 맞는 당신의 가구를 제작해보세요.
            	<div class="customButton">
				<%
					if(currentLogin==null){
						//로그인 안됐을떄
				%>
                	<a href="10_login.jsp?Log=2" class="a_box">의뢰하기 >
                    </a>
				<%
					}
					else{

				%>
                	<a href="04_Contact-Intro.jsp" class="a_box">의뢰하기 >
                    </a>

				<%
					}
					
				%>
                </div>
            </div>
        </div>

        <div class="section1-image4">
        </div>

        <div class="section1_textbox2">
        	<div class="numberBox">
            	<div class="numberBox-number">05
                </div>
            	<div class="numberBox-text">SERVICE
                </div>
            </div>
            <div class="section1_textbox3">처음부터 마지막까지 라움에서 책임집니다.<br>사용시마다 문제점이 발생하시면 즉시 라움에서 방문하여 A/S해드립니다.
            	<div class="serviceButton">
				<%
					if(currentLogin==null){
						//로그인 안됐을떄
				%>
                	<a href="10_login.jsp?Log=2"class="a_box" >A/S 신청하기 >
                    </a>
				<%
					}
					else{

				%>
                	<a href="05_AS.jsp"class="a_box" >A/S 신청하기 >
                    </a>

				<%
					}
					
				%>
                </div>
            </div>
        </div>

        <div class="section1-image5">
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
