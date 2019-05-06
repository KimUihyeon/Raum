<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage-4-wishlist.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage-Common.js"></script>
<script src="Asset/00_Script/Mypage-4-wishlist.js"></script>
<title>:: RAUM</title>
</head>

<body>
<%
	String currentLogin = (String)session.getAttribute("currentSessionID");// 로그인 여부 체크

	if(currentLogin==null){
		response.sendRedirect("10_login.jsp?Log=2");
	}
	else{

	}

%>

<div id="wrap">

	<jsp:include page="00_menu.jsp"/>
    
    <section id="keyContainer">
    	<div class="keyContainer_blind">
        </div>
        <div class="keyContainer_text">
        	<div class="keyContainer_text1">Wishlist
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 관심상품
            </div>
        </div>
    </section>
    
    <section id="section1">
    	<div class="section_Center">
        	<div class="selectBox">
            	<select id="mypageSelect">
                	<option value="mypageCenter">마이페이지</option>
                	<option value="profile">개인정보수정</option>
                    <option value="order">주문내역</option>
                    <option value="cart">장바구니</option>
                    <option value="wishlist">관심상품</option>
                    <option value="contanct">의뢰내역</option>
                    <option value="inquiry">문의내역</option>
                    <option value="AS">A/S신청내역</option>
                    <option value="review">상품후기</option>
                </select>
                <input type="button" class="moveButton" value="이동">
            </div>
            
            
            <!--d여기여기-->
            <div class="clickItemBox">관심상품 목록(3)
            </div>

            <div class="tableBox">
            	<table class="table1">                    
                    
                </table>
                <div class="wishiBtn">
                	<input type="submit" value="전체상품 장바구니 담기" class="subBtn B" onClick="Submit_2()">
                </div>
                <div class="wishiBtn">
                	<input type="submit" value="선택상품 장바구니 담기" class="subBtn M" onClick="Submit_1()">
                </div>
                <div class="wishiBtn">
					<form action="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" method="post">
		            	<input type="submit" value="쇼핑 계속하기" class="subBtn T">
					</form>
                </div>
            </div>            
        </div>
				<script>
					function WishList(){
						$.ajax({
							url:'Action/Ajax_WishList.jsp?currentLogin=<%=currentLogin%>',
						    success:function(data){
							var dataEdit = ""+data.trim();
							$('.table1').append(data);
						}
						})
					}
					WishList();
					
				</script>
            
    	
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

