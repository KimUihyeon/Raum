<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/NotLogin_page.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Find-IDPW.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Find-IDPW.js"></script>
<title>:: RAUM</title>
<%
	String type = request.getParameter("type");
	String Log = "9";

	if(Log.equals(type)){
		%>
			<script>
				alert("찾으시는 정보가 존재하지 않습니다.")
			</script>
		<%
	}
	else{
	}
%>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Find ID,PW
            </div>
            <div class="keyContainer_text2">Home / Login / >Find ID,PW
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1_box">
        	<div class="section1_boxCenter">
            
            	<div class="section1_title">
                	<div class="title-icon">
                    </div>
                    <div class="title-text">회원 아이디 찾기
                    </div>
                </div>
                
                <div class="mentBox">
                	<div class="warning_icon">
                    </div>
                	<div class="section1_coment">이름과 이메일을 입력해주세요.
                	</div>
                </div>
                
                <div class="section1_inputBoxs">
                <form action="10_find-SaerchID.jsp" method="get">
                	<div class="inputBox">
                    	<input type = "text" class="inputText" placeholder="이름" name="name">
                    </div>
                    <div class="inputBox">
                    	<input type = "text" class="inputText" placeholder="이메일" name="email">
                    </div>
                    <input type="submit" class="findButton" value="아이디찾기">
                </form>
                    
                </div>
            </div>
        </div>
        
        <div class="section1_box">
        	<div class="section1_boxCenter">
            
            	<div class="section1_title">
                	<div class="title-icon">
                    </div>
                    <div class="title-text">회원 비밀번호 찾기
                    </div>
                </div>
                
                <div class="mentBox">
                	<div class="warning_icon">
                    </div>
                	<div class="section1_coment">이름과 아이디, 이메일을 입력해주세요.
                	</div>
                </div>
                
                <div class="section1_inputBoxs">
                <form action="10_find-SaerchPW.jsp" method="post">
                	<div class="inputBox">
                    	<input type = "text" class="inputText" placeholder="이름" name="name">
                    </div>
                    <div class="inputBox">
                    	<input type = "text" class="inputText" placeholder="아이디" name="id">
                    </div>
                    <div class="inputBox">
                    	<input type = "text" class="inputText" placeholder="이메일" name="email">
                    </div>
                    <input type="submit" class="findButton" value="비밀번호 찾기">
                  </form>  
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
