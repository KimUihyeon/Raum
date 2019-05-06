<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Contact.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Contact.js?ver=1"></script>
<title>:: RAUM</title>
</head>

<%
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	String PrevNo = request.getParameter("no");
	String id = "";
	String name = "";
	if(currentLoginID==null){
		response.sendRedirect("error_500.html");

	}
	else{
		Query = "select * from Raum_Member where M_id='"+currentLoginID+"'";
		PreparedStatement cursorHelper = con.prepareStatement(Query);
		ResultSet cursor = cursorHelper.executeQuery();

		while(cursor.next()){
			id = cursor.getString("M_id");
			name = cursor.getString("M_name");
		}
	}

%>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>

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
			<div class="section1-Box">

				<div class="itemBox">
				<form action="11_mypage5-contact-edit-2.jsp"  method="post" enctype="multipart/form-data">

					<div class="inputBox">
						<div class="innput"><input type="radio" name="Question" value="인테리어" checked> 인테리어
						</div>
						<div class="innput"><input type="radio" name="Question" value="가구제작"> 가구제작
						</div>
						<div class="innput"><input type="radio" name="Question" value="기타의뢰"> 기타의뢰
						</div>

					</div>

				</div>

                <div class="mobileItem">
                </div>
				<div class="input-Section1">
					<input type="Text" class="input_1 name" name="name" placeholder="이름" readonly value="<%=name%>">
					<input type="Text" class="input_1 id" name="id" placeholder="아이디" readonly value="<%=id%>">
				</div>

				<div class="input-Section2">
					<input type="Text" class="input_1 title" name="title" placeholder="제목">

				</div>
				<div class="input-Section3">
					<h1>의뢰내용
					</h1>
					<textarea class="input_1 textarea" placeholder="내용" name="text"></textarea>
				</div>
                
				<div class="input-Section2">
	                <input class="upload-name" value="" disabled="disabled"> 
                    <label for="file" class="fileLabel">첨부하기</label>
                    <input type="file" id="file" name="file" accept=".gif, .jpg, .png, .max, .obj">
					<h1>의뢰요청시 필요한 이미지를 첨부하실수 있습니다.
					</h1>
				</div>

				<div class="input-Section4">
					<input type="reset" value="초기화" class="input2">
					<input type="Button" value="의뢰하기" class="input2">
				</div>

			</div>
    </section>
    <div class="NextPage">
    	<div class="NextBox">
        	<div class="NextTitle">의뢰확인
            </div>
            <div class="NextText">라움에서는 입력된 의뢰정보에 따라 고객님께 연락을 드립니다.<br>
입력하신 정보가 맞으시면 의뢰하기 버튼을 눌러주시고,<br>
정보의 수정이 필요하시면 수정 버튼을 눌러주시기 바랍니다.
            </div>
            <div class="NextButton">
				<input type="reset" value="수정" class="input2 prev">
				<input type="submit" value="의뢰하기" class="input2">
            </div>
			<input type="text" value=<%=PrevNo%> name="no" style="width=1px; height=1px; opacity:0">
			</form>
        </div>
    </div>

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
