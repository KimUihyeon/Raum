<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@include file="Action/connectionDB.jsp"%>

<%
	String currentLoginID = (String)session.getAttribute("currentSessionID");
	int sessionLength=0;
	if(currentLoginID==null){
	}
	else{
		
		Query = "select * from Raum_Cart,Raum_Product where Raum_Cart.Prd_no =	Raum_Product.Prd_no and M_id='"+currentLoginID+"' ORDER BY Cart_no desc";
		PreparedStatement cousorHelper = con.prepareStatement(Query);
		ResultSet cursor = cousorHelper.executeQuery();

		cursor.last();
		sessionLength = cursor.getRow();
		cursor.beforeFirst();

	}


%>


	<div id="Amenu">
    	<div class="AmenuBack">
        </div>

    	<div class="Amenu_boxs">
        	<div class="Amenu_box1">
            	<div class="Amenu_login">
				<%

				if(currentLoginID==null){
				%>
                	<a href="10_login.jsp" class="a_box">LOGIN
                    </a>
				<%
				}else{
					%>
                	<a href="10_logout.jsp" class="a_box">LOGOUT
                    </a>
					<%
				}
				%>
                </div>
                <div class="closeB">
                </div>
            </div>

            <div class="Amenu_box2">
				<%

				if(currentLoginID==null){
				%>
                <div class="Amenu_box2Item">
	                <a href="10_login.jsp?Log=2" class="a_box">
    	            	<div class="Amenu_userIcon">
        	            </div>
            	        <div class="Amenu_iconText">내계정
                	    </div>
                    </a>
                </div>
                <div class="Amenu_box2Item">
                	<a href="10_login.jsp?Log=2" class="a_box">
	                    <div class="Amenu_cartIcon">
    	                </div>
        	            <div class="Amenu_iconText">장바구니
            	        </div>
					</a>
                </div>
                <div class="Amenu_box2Item">
                	<a href="10_login.jsp?Log=2" class="a_box">
	                    <div class="Amenu_favoriteIcon">
    	                </div>
        	            <div class="Amenu_iconText">위시리스트
            	        </div>
					</a>
                </div>

				<%
				}
				else{
				%>
				
                <div class="Amenu_box2Item">
	                <a href="11_mypage.jsp" class="a_box">
    	            	<div class="Amenu_userIcon">
        	            </div>
            	        <div class="Amenu_iconText">내계정
                	    </div>
                    </a>
                </div>
                <div class="Amenu_box2Item">
                	<a href="11_mypage3-cart.jsp" class="a_box">
	                    <div class="Amenu_cartIcon">
    	                </div>
        	            <div class="Amenu_iconText">장바구니
            	        </div>
					</a>
                </div>
                <div class="Amenu_box2Item">
                	<a href="11_mypage4-wishlist.jsp" class="a_box">
	                    <div class="Amenu_favoriteIcon">
    	                </div>
        	            <div class="Amenu_iconText">위시리스트
            	        </div>
					</a>
                </div>
				<%
				}
				%>
            </div>

            <div class="Amenu_box3">

            	<div class="Amenu_box3Box">
                	<div class="Amenu_box3Center">

                    	<div class="Amenu_menu"><a href="01-about-raum.jsp" class="a_box">라움소개</a>
                        </div>

                        <div class="Amenu_submenu">
                        	<div class="Amenu_item">
                            	<a href="01-about-raum.jsp" class="a_box">RAUM
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="01_deilvery.jsp" class="a_box">배송이야기
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="01_experience.jsp" class="a_box">공방체험
                                </a>
                        	</div>
                        </div>

                    </div>
                </div>

                <div class="Amenu_box3Box">
                	<div class="Amenu_box3Center">

                    	<div class="Amenu_menu"><a href="02_showRoom-mordern.jsp" class="a_box">라움쇼룸</a>
                        </div>

                        <div class="Amenu_submenu">
                        	<div class="Amenu_item">
                            	<a href="02_showRoom-mordern.jsp" class="a_box">모던형
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="02_showRoom-mordern.jsp" class="a_box">클래식형
                                </a>
                        	</div>
                        </div>

                    </div>
                </div>

                <div class="Amenu_box3Box">
                	<div class="Amenu_box3Center">

                    	<div class="Amenu_menu"><a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">오브젝트</a>
                        </div>

                        <div class="Amenu_submenu">
                        	<div class="Amenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">홈오피스
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">침실/서랍장
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">거실/소파
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">서재/책장
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">소품/조명
                                </a>
                        	</div>
                        </div>

                    </div>
                </div>

                <div class="Amenu_box3Box">
                	<div class="Amenu_box3Center">

                    	<div class="Amenu_menu"><a href="04_Contact-Intro.jsp" class="a_box">의뢰하기</a>
                        </div>

                        <div class="Amenu_submenu">
                        	<div class="Amenu_item">
                            	<a href="04_Contact-Intro.jsp" class="a_box">의뢰
                                </a>
                        	</div>
                        </div>

                    </div>
                </div>

                <div class="Amenu_box3Box">
                	<div class="Amenu_box3Center">

                    	<div class="Amenu_menu"><a href="05_Center.jsp" class="a_box">고객센터</a>
                        </div>

                        <div class="Amenu_submenu">
							<%
				
							if(currentLoginID==null){
								//로그인 안됐을떄

							%>
                        	<div class="Amenu_item">
                            	<a href="10_login.jsp?Log=2" class="a_box">1:1 문의
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="05_FAQ.jsp" class="a_box">자주 찾는 질문
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="10_login.jsp?Log=2" class="a_box">A/S신청
                                </a>
                        	</div>
							<%
							}
							else{

							%>
                        	<div class="Amenu_item">
                            	<a href="05_Question.jsp" class="a_box">1:1 문의
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="05_FAQ.jsp" class="a_box">자주 찾는 질문
                                </a>
                        	</div>
                        	<div class="Amenu_item">
                            	<a href="05_AS.jsp" class="a_box">A/S신청
                                </a>
                        	</div>
							<%
							}
							%>
                        </div>

                    </div>
                </div>

            </div>

            <div class="Amenu_box4">
            	<div class="Amenu_logo">
                	<a href="00_index.jsp" class="a_box">
                    </a>
                </div>
            </div>
        </div>
    </div>

	<nav id="header">
    	<div class="Aheader_box">

        	<div class="Aheader_logo">
            	<a href="00_index.jsp" class="a_box">
                </a>
            </div>

            <div class="Aheader_icons">
            	<div class="search_icon">
                	<div class="search_window">
                        <div class="search_iconB">
                        	<a href="#" class="a_box">
                            </a>
                        </div>
                    	<input type="text" class="search_input">
                    </div>
                </div>
                <div class="Amenu_icon">
                </div>
            </div>

        </div>

    	<div class="header_box">

        	<div class="header_logo">
            	<a href="00_index.jsp" class="a_box">
                </a>
            </div>

            <div class="header_icons">
			<%
			
				if(currentLoginID==null){
					//로그인 안됐을떄

					%>

            	<div class="Login_icon">
                	<a href="10_login.jsp" class="a_box">
                    </a>
                </div>
            	<div class="user_icon">
                	<a href="10_login.jsp?Log=2" class="a_box">
                    </a>
                </div>
                <div class="cart_icon">
                	<a href="10_login.jsp?Log=2" class="a_box">
                    </a>
                </div>
                <div class="favourite_icon">
                	<a href="10_login.jsp?Log=2" class="a_box">
                    </a>
                </div>

					<%
				}

				else{

					%>


            	<div class="Logout_icon">
                	<a href="10_logout.jsp" class="a_box">
                    </a>
                </div>

            	<div class="user_icon">
                	<a href="11_mypage.jsp" class="a_box">
                    </a>
                </div>
                <div class="cart_icon">
                	<a href="11_mypage3-cart.jsp" class="a_box">
                		<div class="cart_iconIn">
                    		<div class="cart_iconIn_text"><%=sessionLength%>
	                        </div>
    	                </div>
                    </a>
                </div>
                <div class="favourite_icon">
                	<a href="11_mypage4-wishlist.jsp" class="a_box">
                    </a>
                </div>


					<%
				}
			%>

            </div>

            <div class="menu">
            	<div class="menu_item"><a href="01-about-raum.jsp" class="a_box">라움소개</a>
                	<div class="submenu">
                    	<div class="submenu_box">
                        	<div class="submenu_item">
                            	<a href="01-about-raum.jsp" class="a_box">RAUM
                                </a>
                            </div>
                            <div class="submenu_item">
	                            <a href="01_deilvery.jsp" class="a_box">배송이야기
                            	</a>
                            </div>
                            <div class="submenu_item">
                            	<a href="01_experience.jsp" class="a_box">공방체험
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="menu_item"><a href="02_showRoom-mordern.jsp" class="a_box">라움쇼룸</a>
                	<div class="submenu">
                    	<div class="submenu_box">
                        	<div class="submenu_item">
                            	<a href="02_showRoom-mordern.jsp" class="a_box">모던형
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="02_showRoom-mordern.jsp" class="a_box">클래식형
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="menu_item"><a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">오브젝트</a>
                	<div class="submenu">
                    	<div class="submenu_box">
                        	<div class="submenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">홈오피스
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">침실/서랍장
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">거실/소파
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">서재/책장
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="03_object-calender.jsp?type=1&listQty=8&page=1&align=new" class="a_box">소품/조명
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="menu_item">
                	<a href="04_Contact-Intro.jsp" class="a_box">제작의뢰
                    </a>
                </div>

                <div class="menu_item"><a href="05_Center.jsp" class="a_box">고객센터</a>
                	<div class="submenu">
                    	<div class="submenu_box">
							<%
				
							if(currentLoginID==null){
								//로그인 안됐을떄

							%>
                        	<div class="submenu_item">
                            	<a href="10_login.jsp?Log=2" class="a_box">1:1문의
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="05_FAQ.jsp" class="a_box">자주 찾는 질문
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="10_login.jsp?Log=2" class="a_box">A/S신청
                                </a>
                            </div>
							<%
							}
							else{

							%>
                        	<div class="submenu_item">
                            	<a href="05_Question.jsp" class="a_box">1:1문의
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="05_FAQ.jsp" class="a_box">자주 찾는 질문
                                </a>
                            </div>
                            <div class="submenu_item">
                            	<a href="05_AS.jsp" class="a_box">A/S신청
                                </a>
                            </div>
							<%
							}
							%>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </nav>