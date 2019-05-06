<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<%@include file="Action/NotLogin_page.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Login.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Login.js"></script>
<title>:: RAUM</title>
</head>

<%
	String Log = request.getParameter("Log");
	String Massage = "";
%>

<body>

<div id="wrap">


	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Login
            </div>
            <div class="keyContainer_text2">Raum Login
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section1_loginBox">
        <form action="10_login_Ok.jsp" method="post">
        	<div class="mentBox">
            	<div class="warning_icon">
                </div>
                <div class="section1_loginMent">로그인 후 더 다양한 정보를 제공 받으세요.
            	</div>
            </div>
        	
        	<div class="inputBox">
            	<input type = "text" class="inputText" placeholder="ID*" name="ID">
            </div>
            <div class="inputBox">
                <input type="password" class="inputText" placeholder="Password*" name="PW">
            </div>
            <input type="submit" class="loginButton" value="LOGIN">
        </form>
        </div>
        <div class="section1_textBox">
        	<form action="10_find-IDPW.jsp" method="post">
	        	<input type="submit" class="section1_text" value="아이디찾기">
    	        <input type="submit" class="section1_text" value="비밀번호찾기">
            </form>
        	<form action="10_join-1-check.jsp" method="post">
	            <input type="submit" class="section1_text section1_text_" value="회원가입">
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
<%

	if(Log==null){
	}
	else{
		if(Log.equals("0")){Massage= "잘못된 아이디 입니다.";}
		else if(Log.equals("1")){Massage= "잘못된 비밀번호 입니다.";}
		else if(Log.equals("2")){Massage= "회원 전용 페이지 입니다.";}
%>
	<script>
		alert("<%=Massage%>");
	</script>

<%

	};

%>