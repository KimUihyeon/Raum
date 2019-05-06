<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Center.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Center.js"></script>
<title>RAUM ::</title>
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
        	<div class="keyContainer_text1">Customer Center
            </div>
            <div class="keyContainer_text2">Home / 고객센터
            </div>
        </div>
    </section>

    <section id="section1">
			<div class="Level-04-Title">
				<div class="Title-Icon">
				</div>
				<div class="title-Text">어서오세요. 라움에서 도와드리겠습니다.<br>라움에 대해 궁금하신 점, 불편하신 점이 있으시다면 아래를 통해 확인해 주세요.
				</div>
			</div>

			<div class="Level-04-SectionBox">
				<div class="Level-04-SectionTitle">자주 찾는 질문 Top5
					<div class="AddButton">
                    	<a href="05_FAQ.jsp" class="a_box">더보기
                        </a>
					</div>
				</div>


				<div class="Level-04-Item">
					<div class="Text-Q">Q : 맞춤으로 가구를 구입할 수 있나요?
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active">- 네 물론입니다. 라움에서는 고객님을 위해 주문제작 서비스를 제공하고 있습니다.<Br>
[제작의뢰]를 통해 맞춤 가구 서비스를 이용하실 수 있습니다.

				</div>


				<div class="Level-04-Item">
					<div class="Text-Q">Q : 결제금액보다 더 많이 입금한 경우는 어떻게 하나요?
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active">- 초과입금하신 경우는 무통장 환불 또는 마일리지로 대체적립이 가능합니다.<br>
보통 초과금액이 1만원미만은 마일리지로, 1만원이상은 무통장 환불로 됩니다.<br>
주문금액보다 초과하여 입금하셨을 경우, 1:1문의를 통해 내용을 남겨주시기 바랍니다.

				</div>


				<div class="Level-04-Item">
					<div class="Text-Q">Q : 고객센터의 근무시간은 어떻게 되나요?
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active">- 월~금 : 08:30~17:30<br>
토요일 : 08:30~12:30<br>
일요일, 공휴일 휴무입니다.

				</div>


				<div class="Level-04-Item">
					<div class="Text-Q">Q : 구매하려고 하는 상품의 적립금을 확인 할 수 있나요?
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active">- 구매하시고자 하는 상품의 상품정보에서 적립금 금액을 확인 하실 수 있습니다.
				</div>


				<div class="Level-04-Item">
					<div class="Text-Q">Q : 배송날짜를 연기할 수 있나요?
					</div>
					<div class="Text-A Text-A-Ative">
					</div>
				</div>
				<div class="Level-04-DropItem Drop-Active">- 상품의 재고 여부 및 평균 배송일, 배송 방법 또는 출고여부에 따라 배송날짜의 연기가 불가 할 수 있으니 자세한 문의는 [1:1 문의]나 고객센터로 문의주시기 바랍니다.

				</div>
			</div>

			<div class="ohter-section">
				<div class="ohter-icon">
				</div>
				<div class="ohter-Text">찾으시는 질문이 없으시거나 자세한 답변이 필요하신가요 ? <br>상담원을 토해 1:1 문의를 해보세요
				</div>
				<div class="other-Button">
				<%
					if(currentLogin==null){
						//로그인 안됐을떄
				%>
                	<a href="10_login.jsp?Log=2" class="a_box">1:1문의
                    </a>
				<%
					}
					else{

				%>
                	<a href="05_Question.jsp" class="a_box">1:1문의
                    </a>

				<%
					}
					
				%>
				</div>
			</div>

			<div class="ohter-section2">
				<div class="ohter-icon">
				</div>
				<div class="ohter-Text">사용하시다 발생하는 문제점, 불편하신 점은 사이트를 통해서<br>A/S신청을 하실수 있습니다.
				</div>
				<div class="other-Button">
				<%
					if(currentLogin==null){
						//로그인 안됐을떄
				%>
                	<a href="10_login.jsp?Log=2" class="a_box">AS 신청
                    </a>
				<%
					}
					else{

				%>
                	<a href="05_AS.jsp" class="a_box">AS 신청
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
