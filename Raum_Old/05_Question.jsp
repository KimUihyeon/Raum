<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Question.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Question.js?ver=1"></script>
<title>:: RAUM</title>
</head>

<%
	String currentLoginID = (String)session.getAttribute("currentSessionID");
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
        	<div class="keyContainer_text1">1:1 Request
            </div>
            <div class="keyContainer_text2">Home / 고객센터 / 1:1문의
            </div>
        </div>
    </section>

    <section id="section1">
			<div class="section1-Box">

				<div class="itemBox">
					<div class="itemTextBox">
						<div class="itemArrow">
						</div>
						<div class="itemText">구입관련문의
						</div>
					</div>

				<form action="05_Question-Update.jsp" method="post">
					<div class="inputBox">
						<div class="innput"><input type="radio" name="Question" value="배송문의" checked> 배송문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="주문입금문의"> 주문/입금문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="결제문의"> 결제문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="교환반품문의"> 교환/반품문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="환불문의"> 환불문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="AS문의"> A/S문의
						</div>

					</div>

				</div>



				<div class="itemBox">
					<div class="itemTextBox">
						<div class="itemArrow">
						</div>
						<div class="itemText">일반문의
						</div>
					</div>

					<div class="inputBox">
						<div class="innput"><input type="radio" name="Question" value="회원문의"> 회원문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="마일리지문의"> 마일리지문의
						</div>
						<div class="innput"><input type="radio" name="Question" value="상품문의"> 상품문의
						</div>

					</div>

				</div>



				<div class="itemBox">
					<div class="itemTextBox">
						<div class="itemArrow">
						</div>
						<div class="itemText">기타문의
						</div>
					</div>

					<div class="inputBox">
						<div class="innput"><input type="radio" name="Question" value="기타문의"> 기타문의
						</div>

					</div>

				</div>
                <div class="mobileItem">
                </div>
				<div class="input-Section1">
					<input type="Text" class="input_1 name" name="name" placeholder="이름" value="<%=name%>" readonly>
					<input type="Text" class="input_1 id" name="id" placeholder="아이디" value="<%=id%>"readonly>
				</div>

				<div class="input-Section2">
					<input type="Text" class="input_1 title" name="title" placeholder="제목">

				</div>
				<div class="input-Section3">
					<h1>문의내용
					</h1>
					<textarea class="input_1 textarea" name="text" placeholder="내용"></textarea>
				</div>

				<div class="input-Section4">
					<input type="reset" value="취소" class="input2">
					<input type="Button" value="문의하기" class="input2">
				</div>

			</div>
    </section>
    <div class="NextPage">
    	<div class="NextBox">
        	<div class="NextTitle">문의확인
            </div>
            <div class="NextText">입력하신 문의내역이 맞으시면 문의하기 버튼을 눌러주시고,<br>
내역의 수정이 필요하시면 수정 버튼을 눌러주시기 바랍니다.
            </div>
            <div class="NextButton">
				<input type="reset" value="수정" class="input2 prev">
				<input type="submit" value="문의하기" class="input2">
            </div>
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
