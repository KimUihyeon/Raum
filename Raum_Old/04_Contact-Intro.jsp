<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Contact-Intro.css?ver=3">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>

<script src="three.js"></script>
<script src="Detector.js"></script>
<script src="OrbitControls.js"></script>
<script src="OBJLoader.js"></script>
<script src="MTLLoader.js"></script>

<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>	
<script src="Asset/00_Script/Contact-Intro.js"></script>
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
        	<div class="keyContainer_text1">Request for Production 
            </div>
            <div class="keyContainer_text2">Home / 제작의뢰
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<h1>Make your great “RAUM”
        </h1>
        <h2>하나부터 열까지 당신으로부터 전문가의 손을 거치다.
        </h2>
        <h3>DIRECTION YOUR RAUM
        </h3>
        <div class="sampleBox">
        	<div class="sample">sample 01
            </div>
        	<div class="sample">sample 02
            </div>
        	<div class="sample">sample 03
            </div>
        </div>
        <div class="sampleSlide_Box">
        	<div class="slide_controller">
    	    	<div class="slide_Item">
	            </div>
        		<div class="slide_Item">
        	    </div>
    	    	<div class="slide_Item">
	            </div>
            </div>
            <div class="shadow">
            </div>
            <div class="shadowDown">
            </div>
        </div>
        
        <div class="level2-Title1">라움에서는
        </div>
        <div class="level2-Title2">원하시는 인테리어, 가구 등을 고객님의 스타일에 맞게<br>
개인의뢰를 통하여 연출해드립니다
        </div>
            
        <div class="level2-contactsBox">
        	<div class="level2-contacts">
        		<div class="level2-icon">
                </div>
                <div class="level-text">Home Interior<p>
                 	<font size="14px">고객 맞춤형 홈 인테리어<br>
젊은 감각과 검증된 기술력으로<br>
질 좋은 인테리어 디자인을 제공합니다.  
                    </font>
                </div>
	       </div>
        	<div class="level2-contacts">
        		<div class="level2-icon">
                </div>
                <div class="level-text">Customer Mage<p>
                 	<font size="14px">고객 맞춤형 커스텀 가구제작<br>
각각의 환경과 스타일에 맞는<br>
다양한 가구를 제작해 드립니다.
                    </font>
                </div>
	       </div>
       </div>
       
       
       <h4>라움 의뢰 절차
       </h4>
       <div class="Line">
       </div>
       
       <div class="level3">
       		<div class="step_container">    
    	   		<div class="step_Box">
	            	<div class="step_Logo">
            	    </div>
        	        <div class="stop_Text">Step1
    	            </div>
	            </div>
            </div>
            
            <div class="contants_container">
            	<div class="contants_Box">
            		<div class="contants_Text">의뢰주문서를 작성해 주세요.<br>
주문서 작성 시 원하시는 색상, 디자인을 첨부하여 주셔야 합니다.<Br>
(JPEG, PNG, 3DN, OBJ, MAX, FBX, 직접 찍은 사진, 그림 등 )<br>
<font color="#FF0000">예시사진)</font>
        	        </div>
    	            <div class="contants_InnerBox laaa">
	                </div>
                    <div class="Label_box">    
            	        <div class="Exlabel">예시
        	            </div>
    	                <div class="ExFile">파일첨부
	                    </div>
                    </div>
                    <div class="lastMent">첨부가 어려울시 고객센터로 연락 바랍니다.
                    </div>
                </div>
            </div>
       </div>


       <div class="level3 sub2">
       		<div class="step_container">    
    	   		<div class="step_Box">
	            	<div class="step_Logo">
            	    </div>
        	        <div class="stop_Text">Step2
    	            </div>
	            </div>
            </div>
            
            <div class="contants_container">
            	<div class="contants_Box">
            		<div class="contants_Text">주문서 작성 시 원하시는 재질을 명시하여 주셔야 합니다.<br>
<font color="#FF0000">예시사진)</font>
        	        </div>
    	            <div class="contants_InnerBox intro-textarea">그림의 의자중에서 등받이는 나무로 만들어 주시고,<br>
다리는 스틸로 해주세요. 앉는부분은 푹신푹신하게요.<br>
등받이 길이 : 70mm  /  다리 길이 : 80mm<Br>
	                </div>
                    <div class="Label_box">
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">스틸<br>Steel
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">아크릴<br>acrylic
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">유리<br>glass
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">대리석<br>marble
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">알루미늄<br>aluminium
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">패브릭<br>fabic 
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">편백나무<br>retinispora
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">자작나무<br>white birch
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">MDF<br>합판
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">가죽<br>leather
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">도자기타일<br>ceramic tile
                            </div>
                        </div>
                    	<div class="texture">
                        	<div class="textureBG">
                            </div>
                        	<div class="textureFillter active-fillter">시트오버레이<br>sheet overlay 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>


       <div class="level3 sub3">
       		<div class="step_container">    
    	   		<div class="step_Box">
	            	<div class="step_Logo">
            	    </div>
        	        <div class="stop_Text">Step3
    	            </div>
	            </div>
            </div>
            
            <div class="contants_container">
            	<div class="contants_Box">
            		<div class="contants_Text">의뢰확인 시 고객님의 디자인을 참고하여 3D를 통하여,<br>
디자인을 미리 확인해보실 수 있습니다.<br>
3D 모델링까지는 의뢰후 3~4일까지 소요되며 이후<br>
마이페이지 > 의뢰확인 에서 확인하실 수 있습니다.<br>
<font color="#FF0000">예시모델)</font>
        	        </div>
    	            <div class="contants_InnerBox intro-3D" id="3DTarget">
	                </div>
                    <div class="lastMent">의뢰후 3~4일 소요
                    </div>
                </div>
            </div>
       </div>
		<script src="Contact3D-Custom.js"></script>


       <div class="level3 sub4">
       		<div class="step_container">    
    	   		<div class="step_Box">
	            	<div class="step_Logo">
            	    </div>
        	        <div class="stop_Text">Step4
    	            </div>
	            </div>
            </div>
            
            <div class="contants_container">
            	<div class="contants_Box">
            		<div class="contants_Text">디자인 확인이 완료됨과 동시에 제작에 들어갑니다.<br>
제작 완료 후 고객님께 전달해 드립니다.<br>
제작은 1주에서 3주일 정도 소요되며, 상황에 따라 변동이 있을 수 있습니다.<br>
<font color="#FF0000">* 별도로 요청하지 않은 사항은 디자이너의 판단에 의해 제작됩니다. </font>
        	        </div>
                </div>
            </div>
       </div>
       
       
       <div class="ButtonBox">
			<%
				if(currentLogin==null){
					//로그인 안됐을떄
			%>
				<a href="10_login.jsp?Log=2" class="a_box">커스텀 의뢰
	            </a>
			<%
				}
				else{

			%>
				<a href="04_Contact-1.jsp" class="a_box">커스텀 의뢰
		        </a>

			<%
				}
				
			%>
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
