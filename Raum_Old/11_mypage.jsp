<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage.js?ver=2"></script>
<title>:: RAUM</title>
</head>

<body>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Mypage
            </div>
            <div class="keyContainer_text2">Home / 마이페이지
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section_Center">
        	<div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">PROFILE
                </div>
                <div class="section1Box_ment">고객님의 개인정보를<br>관리하는 공간입니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage1-profile-1.jsp" class="a_box">
	                	<input type="button" value="개인정보 변경하기" class="section1Button">
                    </a>
                </div>
            </div>
            
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">ORDER
                </div>
                <div class="section1Box_ment">주문하신 상품의<br>주문내역을 확인하실 수 있습니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage2-order-1.jsp" class="a_box">
	                	<input type="button" value="주문내역 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">CART
                </div>
                <div class="section1Box_ment">장바구니에 등록하신 상품의<br>목록을 보여드립니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage3-cart.jsp" class="a_box">
	                	<input type="button" value="장바구니 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">WISHLIST
                </div>
                <div class="section1Box_ment">관심상품으로 등록하신 상품의<br>목록을 보여드립니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage4-wishlist.jsp" class="a_box">
                		<input type="button" value="관심상품 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">CONTACT
                </div>
                <div class="section1Box_ment">1:1의뢰를 통해 요청하신<br>의뢰내역을 확인하 실 수있습니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage5-contact-1.jsp" class="a_box">
                		<input type="button" value="의뢰내역 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">INQUIRY
                </div>
                <div class="section1Box_ment">1:1문의를 통해 요청하신<br>문의내역을 확인하실 수 있습니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage6-1to1.jsp" class="a_box">
                		<input type="button" value="1:1문의내역 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">A/S
                </div>
                <div class="section1Box_ment">신청하신 A/S 목록을<br> 확인하실 수 있습니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage7-As-1.jsp" class="a_box">
                		<input type="button" value="A/S신청내역 확인하기" class="section1Button">
                    </a>
                </div>
            </div>
            <div class="section1Box">
            	<div class="section1Box_icon">
                </div>
                <div class="section1Box_title">REVIEW
                </div>
                <div class="section1Box_ment">작성하신 상품후기를<br>확인하실수있습니다.
                </div>
                <div class="section1ButtonBG">
                	<a href="11_mypage8-review.jsp" class="a_box">
	                	<input type="button" value="상품후기 확인하기" class="section1Button">
                    </a>
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
