<%@page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" href="Asset/00_Css/Common.css">
<link rel="stylesheet" href="Asset/00_Css/Sub.css">
<link rel="stylesheet" href="Asset/00_Css/Mypage3-cart.css">

<script src="Asset/00_Script/jquery-1.10.2.min.js"></script>
<script src="Asset/00_Script/jquery-ui.min.js"></script>
<script src="Asset/00_Script/jquery.ba-throttle-debounce.min.js"></script>
<script src="Asset/00_Script/jquery.mousewheel.js"></script>
<script src="Asset/00_Script/bitstorm_ColorAnimate.js"></script>
<script src="Asset/00_Script/Common.js"></script>
<script src="Asset/00_Script/Sub.js"></script>
<script src="Asset/00_Script/Mypage-Common.js"></script>
<script src="Asset/00_Script/Mypage3-cart.js"></script>
<title>:: RAUM</title>
</head>

<body>
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
        	<div class="keyContainer_text1">Cart
            </div>
            <div class="keyContainer_text2">Home / 마이페이지 / 장바구니
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
				<script>
					function WishList(){
						$.ajax({
							url:'Action/Ajax_CartList.jsp?currentLogin=<%=currentLogin%>',
						    success:function(data){
							var dataEdit = ""+data.trim();
							$('.table1').append(data);
						}
						})
					}
					WishList();
				</script>
            

                <div class="TotalLine">배송 상품 합계금액 516,000원 + 배송비 0 원 = 합계 516,000원
                </div>
                
                <div class="TotalBox">
                	<div class="TotalTop">
                    	<div class="TotalTopLeft">
                        	<h6>총 주문 금액
                            </h6>
                        </div>
                    	<div class="TotalTopRIght">
                        	<div class="RightTop">516,000원
                            	<div class="Tag">상품총 금액
                                </div>
                            </div>
                        	<div class="RightBottom">0원
                            	<div class="Tag">배송비
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="TotalBottom">
                    	<font color="#666666" class="font">(적립 마일리지 2580p) 결제 예정 금액
                        </font>
                        <font color="#996867" class="font">516,000원
                        </font>
                    </div>
                </div>
                
                <div class="BtnBox">
            	    <div class="wishiBtn">
                    <form action="11_mypage3-product-ordering1.jsp">
        	        	<input type="submit" value="전체상품 주문하기" class="subBtn B">
    	            </div>
                    </form>
	                <div class="wishiBtn">
                		<input type="submit" value="선택상품 주문하기" class="subBtn M" onClick="NoActive()">
            	    </div>
        	        <div class="wishiBtn">
						<form action="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" method="post">
	    	            	<input type="submit" value="쇼핑 계속하기" class="subBtn T">
						</form>
	                </div>
                
                	<div class="cartBtn">
            	    	<div class="TopBtn" style="display:none">
        	            	<input type="checkbox" >전체선택
    	                </div>
	                    <div class="BottomBtn">
                	    	<div class="Btn" onClick="Submit_1()">관심상품 이동
            	            </div>
        	            	<div class="Btn" onClick="Submit_2()">선택상품 삭제
                        </div>
    	                </div>
	                </div>
                </div>
				<script>
				
	function Submit_1(){
		if($('.CartNo').is(":checked")){
			var NextTitle="";
			$('.CartNo').each(function(){
				if($(this).is(":checked")){
					NextTitle +=$(this).val()+",";
				}
				
			});
			alert(NextTitle);
			$.ajax({
				url:'Action/Ajax_CartToWish_select.jsp?currentLogin=<%=currentLogin%>&No='+NextTitle,
				success:function(data){
					console.log(data);
					var TempSring = data.trim();
					console.log(TempSring);
					if(TempSring=="true"){
						alert("위시리스트에 추가하였습니다.");
					}
					else{
						alert("상품이 위시리스트에 존재합니다");
					}
				}
			})
		}
		else{
			alert("상품을 하나 이상 선택해주세요");
		}
	}
	function Submit_2(){
		
		if($('.CartNo').is(":checked")){
			var NextTitle="";
			$('.CartNo').each(function(){
				if($(this).is(":checked")){
					NextTitle +=$(this).val()+",";
				}
				
			});
			alert(NextTitle)
			$.ajax({
				url:'Action/Ajax_CartToSelect_delete.jsp?currentLogin=<%=currentLogin%>&No='+NextTitle,
				success:function(data){
					console.log(data);
					var TempSring = data.trim();
					console.log(TempSring);
					if(TempSring=="true"){
						alert("삭제되었습니다.");
						$('.table1').html("");
						WishList();
					}
					else{
						alert("이미 삭제된 상품입니다.");
					}
				}
			})
		}
		else{
			alert("상품을 하나 이상 선택해주세요");
		}
		
	}
				</script>
                    
                <div class="mentBox">
					<div class="ment">상품후기 마일리지 <br>상품의 첫 리뷰 작성 시 200마일리지 적립해 드립니다.
					</div>
					<div class="ment">구매 마일리지 <br>구매금액의 1%를 지급해 드립니다.
					</div>
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
		<script>
			function NoActive(){
				alert("개발중인 상품입니다");
			}
		</script>
    </section>
    
</div>

</body>
</html>

