<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/FAQ.css?ver=1">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/FAQ.js?ver=1"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>

    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">FAQ
            </div>
            <div class="keyContainer_text2">Home / 고객센터 / 자주찾는질문
            </div>
        </div>
    </section>

    <section id="section1">
			<div class="Level-04-Title">
				<div class="Title-Icon">FAQ
				</div>
				<div class="title-Text">
                <form>
                	<input type="text" class="input_1">
                    <input type="submit" class="input2" value="검색">
                </form>
				</div>
                <div class="title-Text2">반품&nbsp;|&nbsp;교환&nbsp;|&nbsp;배송비&nbsp;|&nbsp;A/S
                </div>
			</div>
            
            <div class="ment_box">* 라움을 이용하시면서 불편하셨던 사항을 분류별로 빠르게 찾으실 수 있습니다.<br>* 검색 또는 찾으시는 질문이 없는 사항은 1:1 문의를 이용해주시면 빠르고 정확한 답변을 받으실 수 있습니다.<font color="#996867"> 1:1 문의 ></font>
            </div>
            
            <div class="ctgBox">
            	<div class="ctg ctg-ative" onClick="LodingFaQ('회원관련')">회원관련
                </div>
            	<div class="ctg" onClick="LodingFaQ('주문결제')">주문/결제
                </div>
            	<div class="ctg" onClick="LodingFaQ('반품교환AS')">반품/교환/AS
                </div>
            	<div class="ctg" onClick="LodingFaQ('상품')">상품
                </div>
            	<div class="ctg" onClick="LodingFaQ('배송')">배송
                </div>
            	<div class="ctg" onClick="LodingFaQ('기타')">기타
                </div>
            </div>
			<script>
				function LodingFaQ(Ctg){
					$.ajax({
						url:'Action/Ajax_FAQ.jsp?Ctg='+Ctg,
						success:function(data){
							var dataEdit = ""+data.trim();
							console.log(dataEdit);
							$('.Level-04-SectionBox').html("<div class='Level-04-SectionTitle'></div>")
							$('.Level-04-SectionBox').append(dataEdit);
						}
					});
				}
				LodingFaQ('회원관련');
			</script>

			<div class="Level-04-SectionBox">
				<div class="Level-04-SectionTitle">
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
